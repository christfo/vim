#!/usr/bin/env bash
LOCALPORT=7778
SURRHOST=$(1:-chrisf-dev)

function mapbackend {
  IP=$1
  PORT=$2
  LOCALPORT=$3
  SAFE_RID=$4
  echo "mapping surrogate ${IP}:${PORT} to localhost:${LOCALPORT} of safe rid == ${SAFE_RID}   "
  ssh $SURRHOST -- -L ${PORT}:${IP}:${LOCALPORT} -N &
  echo
}


pushd ~/git/safeview
echo "start devtools backends"
SURROGATES=$( ssh $SURRHOST -c '
RENDER=$(ps aux | grep -Po "type=zygote.+" | sed -rn "s/^.+safe-rid=([^ ]+).*$/\1/p" | sort | uniq | awk -vORS="|" "{print $1}" | sed "s/|$//g")
ps aux | grep -Po "[m]onitor.+" | sed -rn "s/^.+server-address=([^ ]+).+safe-rid=($RENDER).+debugging-port=([0-9]+).*$/\1 \2 \3/p"
')

echo "$SURROGATES"

if [ $(echo "$SURROGATES" | wc -l ) -eq 1 ]; then
selection=1
else
NUM=1
echo "--------------"
while read  IP SAFE_RID PORT  ; do
  echo "${NUM}) $IP ... $SAFE_RID"
  NUM=$((NUM+1))
done <<< "$SURROGATES"
echo "--------------"

read -p "Choose a surrogate to continue... " -n1 -s selection
echo
fi

NUM=1
while read  IP SAFE_RID PORT  ; do
  if [ $selection == $NUM ]; then
    lsof -t -i :7778 | xargs kill  # incase and old PF is alive
    mapbackend ${IP} 7778 ${LOCALPORT} ${SAFE_RID}
    sleep 1
    open http://localhost:${LOCALPORT}
  fi
  NUM=$((NUM+1))
done <<< "$SURROGATES"

popd
