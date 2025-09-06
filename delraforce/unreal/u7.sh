
# Step function
step() {
  echo "▶️  $1 ... ✔"
}

echo  " "
echo "🧬🧬🫟🫟🧬🧬🫟🫟🧬🧬🫟🫟🧬🧬🫟🫟🧬🧬🫟🫟"
step "Checking Engine 4"
echo "U engine 7  Full unreal engine fixing 2 ✅✅✅✅✅✅✅"
echo "🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠"



GAME_PACKAGE="com.garena.game.df"

# 1️⃣ Detect PID differently (binder-heavy processes too)
GAME_PIDS=$(pidof $GAME_PACKAGE)
if [ -z "$GAME_PIDS" ]; then
  GAME_PIDS=$(pidof UE4Game)
fi

if [ -z "$GAME_PIDS" ]; then
  echo "Game not running!"
  exit 1
fi

echo "Detected game PIDs: $GAME_PIDS"

# 2️⃣ Force CPU governor to performance mode
for cpu in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor; do
  echo performance > $cpu 2>/dev/null
done
echo "CPU governor set to performance mode."

# 3️⃣ Tune IO scheduler for faster asset streaming
for block in /sys/block/*/queue/scheduler; do
  echo noop > $block 2>/dev/null
done
echo "I/O scheduler set to noop (fast path)."

# 4️⃣ Binder transaction boost (low latency IPC)
for pid in $GAME_PIDS; do
  echo "Boosting binder thread for PID $pid..."
  echo 1 > /proc/$pid/binder_boost 2>/dev/null
done

# 5️⃣ GPU driver parameters (force aggressive scheduling if available)
if [ -f /sys/class/kgsl/kgsl-3d0/devfreq/governor ]; then
  echo performance > /sys/class/kgsl/kgsl-3d0/devfreq/governor
  echo "GPU governor forced to performance."
fi

# 6️⃣ Print short stats to confirm
for pid in $GAME_PIDS; do
  echo "=== Stats for $pid ==="
  cat /proc/$pid/stat | awk '{print "CPU time:", $14, " | Kernel time:", $15}'
done

echo "✅ New optimization method applied."
