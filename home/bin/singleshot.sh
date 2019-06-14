GIT_ROOT=`git rev-parse --show-toplevel`
CMDFILE=${CMDFILE:-"$GIT_ROOT/cmd.out"}
FILTER=${FILTER:-cat}

source ~/.bash-preexec.sh
preexec() { echo "clearing $CMDFILE" ; echo '' > $CMDFILE; }
postexec() { 
    echo "filter $CMDFILE"
    strip-ansi "$CMDFILE" \
    | ${FILTER} \
    | sed -u  's%../../%%g; s%/host/menlo%~/git%g; s%/home/vagrant%~%g' \
    > "${CMDFILE}" ;
}

PROMPT_COMMAND="$PROMPT_COMMAND; postexec" 
echo "Auditing to \"$CMDFILE\""

