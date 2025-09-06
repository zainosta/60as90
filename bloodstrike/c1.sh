
echo "FPS 👉🐌💻🔨👈"
GAME_PKG="com.netease.newspike"
echo "=== Precision booster (60FPS) ==="

pid=$(pidof $GAME_PKG)
if [ -n "$pid" ]; then
  renice -n -12 -p $pid 2>/dev/null
  for t in $(ps -T -p $pid | grep -i "RenderThread\|MainThread\|Input" | awk '{print $2}'); do
    renice -n -12 -p $t 2>/dev/null
  done
  for t in $(ps -T -p $pid | grep -i "Firebase\|Crashlytics" | awk '{print $2}'); do
    kill -9 $t 2>/dev/null
  done
fi

# GPU governor to performance but capped
echo performance > /sys/class/devfreq/80000000.gpu/governor 2>/dev/null

# Touch tuning
#settings put system pointer_speed 6
#settings put secure long_press_timeout 200

echo "✅ Precision booster applied (60FPS stable)"
echo "--------------------"