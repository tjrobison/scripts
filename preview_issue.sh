#!/bin/bash

sed -e 's,\\\\,\\,g' \
    -e 's,\\b,'"9001,g" \
    -e 's,\\d,'"$(date '+%a %b %e %Y'),g" \
    -e 's,\\s,'"$(uname -s),g" \
    -e 's,\\l,'"vc/$XDG_VTNR,g" \
    -e 's,\\m,'"$(uname -m),g" \
    -e 's,\\n,'"$(uname -n),g" \
    -e 's,\\o,'"$(hostname -d),g" \
    -e 's,\\O,'"$(hostname -f),g" \
    -e 's,\\r,'"$(uname -r),g" \
    -e 's,\\t,'"$(date +%T),g" \
    -e 's,\\u,'"$(users | wc -w),g" \
    -e 's,\\U,'"$(users | wc -w) users,g" \
    -e 's,\\v,'"$(uname -v),g" \
< "$1"