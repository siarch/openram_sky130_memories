$ErrorActionPreference = "Stop"

$LogPath = "D:\trae_projects\Sky130_Power\deliverables\real_area_progress_watch.log"
$HostName = "ryan@192.168.49.140"

while ($true) {
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $remoteScript = @'
set -e
echo "__REMOTE_TIME__ $(date '+%F %T')"
echo "__PROCS__"
ps -ef | egrep 'remote_batch_probe_real_area_1r1w_full.py|remote_probe_real_area_single.py|remote_finalize_real_area_after_batch.sh' | egrep -v grep || true
echo "__SUMMARY_COUNT__"
wc -l /Sky130_memory/reports/v20260612_1r1w_full/real_area_summary.jsonl 2>/dev/null || true
echo "__DEBUG_TAIL__"
tail -n 12 /Sky130_memory/reports/v20260612_1r1w_full/real_area_probe_debug.log 2>/dev/null || true
echo "__FINALIZE_LOG__"
tail -n 12 /tmp/remote_finalize_real_area_after_batch.log 2>/dev/null || true
'@
    $output = $remoteScript | ssh $HostName bash -s 2>&1
    $entry = @(
        "===== $timestamp ====="
        $output
        ""
    ) -join "`r`n"
    Add-Content -Path $LogPath -Value $entry -Encoding UTF8
    Write-Output $entry
    Start-Sleep -Seconds 300
}
