#!/usr/bin/env bash
set -euo pipefail

echo "PID"
if [ -f /tmp/remote_batch_1r1w.pid ]; then
    cat /tmp/remote_batch_1r1w.pid
else
    echo "missing"
fi

echo "PS"
if [ -f /tmp/remote_batch_1r1w.pid ]; then
    pid="$(cat /tmp/remote_batch_1r1w.pid)"
    ps -p "$pid" -o pid=,stat=,etime=,cmd= || true
fi

echo "SUMMARY"
cat /tmp/batch_1r1w_summary.tsv 2>/dev/null || true

echo "TAIL"
tail -n 40 /tmp/remote_batch_1r1w.stdout 2>/dev/null || true
