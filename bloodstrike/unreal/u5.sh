# Step function
step() {
  echo "▶️  $1 ... ✔"
}

echo " "
echo "🟣🟣🟣🟣🟣🟣🟣🟣🟣🟣🟣🟣🟣🟣🟣🟣🟣🟣🟣🟣"
step "Checking Engine 5"
echo "🔥  U engine 5  FPS LATENCY  ✅✅✅✅✅"
echo "🧼🧼🧼🧼🧼🧼🧼🧼🧼🧼🧼🧼🧼🧼🧼🧼🧼🧼🧼🧼"



# --- Delta Force FPS / GPU Logging Script ---

# Step 1: Find the surface ID for com.garena.game.df
surfaceID=$(dumpsys SurfaceFlinger --list | grep com.netease.newspike | awk '{print $1}')
echo "Game surface ID: $surfaceID"

# Step 2: Clear previous latency data
if [ -n "$surfaceID" ]; then
    dumpsys SurfaceFlinger --latency-clear $surfaceID
    echo "Old latency data cleared."
else
    echo "Game surface not found. Make sure the game is running."
    exit 1
fi

# Step 3: Stop non-critical apps to free CPU/GPU
for pkg in com.android.chrome com.android.settings me.zhanghai.android.files; do
    am kill --user 0 $pkg
    echo "Killed $pkg"
done

# Step 4: Start fresh latency logging (press Ctrl+C to stop after playing)
echo "Starting frame latency logging for Blood Strike..."
echo "Press Ctrl+C after 30-60 seconds of gameplay to stop and review output."
dumpsys SurfaceFlinger --latency $surfaceID
