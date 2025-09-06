GAME_PKG="com.netease.newspike"

echo "=== Blood Strike CPU boost (60FPS stable) ==="


# Disable animations
settings put global window_animation_scale 0
settings put global transition_animation_scale 0
settings put global animator_duration_scale 0

# Keep awake
cmd deviceidle whitelist +$GAME_PKG 2>/dev/null

# Kill heavy hogs only (not all)
for pkg in com.facebook.services com.instagram.android com.tiktok.android com.spotify.music; do
  am force-stop "$pkg" 2>/dev/null
done

pid=$(pidof $GAME_PKG)
if [ -n "$pid" ]; then
  echo "Game PID: $pid"
  renice -n -10 -p $pid 2>/dev/null
  for t in $(ps -T -p $pid | grep -i "Firebase\|Crashlytics" | awk '{print $2}'); do
    kill -9 $t 2>/dev/null
  done
fi

# Watchdog loop (lightened)
(
  retries=0
  while [ $retries -lt 30 ]; do
    for offender in com.tiktok.android com.spotify.music; do
      am force-stop "$offender" 2>/dev/null
    done
    sleep 1
    retries=$((retries+1))
  done
) &

sh c1.sh