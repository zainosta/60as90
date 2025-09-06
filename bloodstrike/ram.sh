
echo "=== RAM cleaner (safe 60FPS mode) ==="


# Light trim
cmd activity idle-maintenance

# Free ZRAM for game only
PID=$(pidof com.netease.newspike)
if [ -n "$PID" ]; then
  am send-trim-memory $PID MODERATE
fi

# DO NOT kill-all → causes relaunch lag
# Instead kill heavy hogs
for p in com.facebook.katana com.tiktok.android com.spotify.music; do
  am force-stop "$p" 2>/dev/null
done

# Trigger LMKD gently
cmd activity broadcast -a android.intent.action.MEMORY_TRIM

echo "✅ RAM cleared safely"
echo "--------------------"
echo ""