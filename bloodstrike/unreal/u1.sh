# Step function
step() {
  echo "▶️  $1 ... ✔"
}

echo " "
echo "🟣🟣🟣🟣🟣🟣🟣🟣🟣🟣🟣🟣🟣🟣🟣🟣🟣🟣🟣🟣"
step "Checking Engine 1"
echo "🔥  U engine 1 ✅"
echo "🧼🧼🧼🧼🧼🧼🧼🧼🧼🧼🧼🧼🧼🧼🧼🧼🧼🧼🧼🧼"

# ====== RENDERER / UE BACKEND (Vulkan path via Skia/RenderEngine) ======
setprop debug.hwui.renderer skiavk
setprop debug.hwui.force_vulkan 1
setprop debug.renderengine.backend skiavk

# ====== SHADER / STUTTER CUTS ======
# Prevents extra redraw work that spikes when you aim or turn fast
setprop debug.hwui.disable_scissor_opt true

# ====== OVERDRAW DEBUG OFF (saves GPU cycles) ======
# (Use numeric/boolean – your device rejected "show none")
setprop debug.hwui.show_overdraw false

# ====== FRAME PACING / PHYSICS LOCK (smooth 60) ======
settings put global game_physics_fps 60
settings put system min_refresh_rate 60
settings put system peak_refresh_rate 60

# ====== GAME DRIVER (prefer updated GPU driver when available) ======
# 1 = Force "updatable game driver" for all apps that support it
settings put global updatable_driver_all_apps 1

# ====== NETWORK / DESYNC REDUCTION ======
# Faster initial TCP window + no delayed ACKs to reduce input-to-server delay
settings put global net.tcp.default_init_rwnd 60
settings put global net.tcp.delack.default 0

# ====== AGGRESSIVE BACKGROUND IDLE (free CPU/GPU/RAM for the game) ======
# Tighten Doze so anything not foreground is frozen quicker
settings put global device_idle_constants inactive_to=600000,sensing_to=0,locating_to=0,motion_inactive_to=0,idle_after_inactive_to=600000
# Keep device in 'awake' state while charging to avoid thermal/idle dips
settings put global stay_on_while_plugged_in 3

# ====== UI ANIMATION OFF (micro-latency cuts, cheaper frame swaps) ======
settings put global window_animation_scale 0
settings put global transition_animation_scale 0
settings put global animator_duration_scale 0

# ====== TOUCH/HAPTIC MICRO-SAVES (optional but helps stability) ======
# (If any line errors on your ROM, skip it — they’re optional.)
settings put system haptic_feedback_enabled 0
settings put system vibrate_when_ringing 0
