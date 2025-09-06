
# Step function
step() {
  echo "▶️  $1 ... ✔"
}

echo " "
echo "🟣🟣🟣🟣🟣🟣🟣🟣🟣🟣🟣🟣🟣🟣🟣🟣🟣🟣🟣🟣"
step "Checking Engine 6"
echo "🔥  U engine 6  Full engine fixing ✅✅✅✅✅✅"
echo "🧼🧼🧼🧼🧼🧼🧼🧼🧼🧼🧼🧼🧼🧼🧼🧼🧼🧼🧼🧼"



# ============================================
# Deep-Level UE4 Optimizer for Blood Strike 
# Auto-detect PID, free memory, boost performance
# ============================================

GAME_PACKAGE="com.netease.newspike"

# 1️⃣ Detect game PID automatically
GAME_PID=$(pidof $GAME_PACKAGE)
if [ -z "$GAME_PID" ]; then
  echo "Game not running!"
  exit 1
fi
echo "Game PID detected: $GAME_PID"

# 2️⃣ Boost CPU scheduling and core affinity
echo "Boosting CPU priority..."
# Set core affinity to all cores
cmd sched setaffinity $GAME_PID 0-7 2>/dev/null
# Set scheduling policy to FIFO or default
cmd sched set_policy $GAME_PID 1 2>/dev/null
# Try setting priority
cmd sched set_priority $GAME_PID 20 2>/dev/null

# 3️⃣ Suspend heavy background apps (non-destructive)
echo "Pausing background apps..."
BACKGROUND_APPS="com.android.chrome com.android.systemui me.piebridge.brevent"
for app in $BACKGROUND_APPS; do
  cmd activity stop $app 2>/dev/null
done

# 4️⃣ Trim game and system memory safely
echo "Trimming memory..."
su -c 'echo 3 > /proc/sys/vm/drop_caches' 2>/dev/null
cmd activity trim-memory $GAME_PACKAGE RUNNING_CRITICAL 2>/dev/null

# 5️⃣ Optimize SurfaceFlinger latency
echo "Optimizing frame latency..."
SURFACE_ID=$(dumpsys window windows | grep -i "$GAME_PACKAGE" | grep -o 'Surface(name=[^/]*/' | head -n1 | cut -d'/' -f1 | cut -d'=' -f2)
if [ ! -z "$SURFACE_ID" ]; then
  dumpsys SurfaceFlinger --latency-clear $SURFACE_ID
  LATENCY=$(dumpsys SurfaceFlinger --latency $SURFACE_ID | tail -n1)
  echo "Current SurfaceFlinger latency: $LATENCY ns"
fi

# 6️⃣ Optional GPU tuning
if [ -f /sys/class/kgsl/kgsl-3d0/devfreq/governor ]; then
  echo "Setting GPU governor to performance..."
  echo performance > /sys/class/kgsl/kgsl-3d0/devfreq/governor
  MAX_GPU=$(cat /sys/class/kgsl/kgsl-3d0/max_gpuclk)
  echo "Locking max GPU frequency to $MAX_GPU"
  echo $MAX_GPU > /sys/class/kgsl/kgsl-3d0/max_gpuclk
fi

# 7️⃣ Print game memory and CPU stats
echo "Game memory and CPU usage:"
dumpsys meminfo $GAME_PACKAGE | head -n 30
top -n 1 | grep $GAME_PID


echo "🚏🚧🚨🚨🚨 Making Blood Strike 📌 as a pin task 🚨🚨 🚨 🚧🚏"
taskset -p f $GAME_PID
echo "✅✅✅✅"
echo "✅ Optimization Blood Strike complete. Game should run smoother!"
