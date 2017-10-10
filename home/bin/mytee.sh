#!/usr/bin/env bash

BUILD_CMD=${1:-build.sh}
shift
unbuffer "${BUILD_CMD} $* "  2>&1 | tee >(strip-ansi |  sed -u  's%../../%%g' > build.out)

    # safeview chrome_sandbox 2>&1 | tee >(strip-ansi | sed 's%../../base/%../base/%g'  | sed -u  's%../../%%g' > build.out)
    # safeview chrome_sandbox 2>&1 | tee >(sed -lE "s/"$'\E'"\[([0-9]{1,3}((;[0-9]{1,3})*)?)?[m|K]//g" | sed -lu 's%../../base/%../base/%g'  | sed -lu  's%../../%%g' > build.out)
    # safeview chrome_sandbox 2>&1 | tee >(strip-ansi | sed -u 's%../../base/%../base/%g'  | sed -u  's%../../%%g' > build.out)




