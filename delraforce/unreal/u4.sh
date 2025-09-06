
# Step function
step() {
  echo "▶️  $1 ... ✔"
}

echo  " "
echo "🧬🧬🫟🫟🧬🧬🫟🫟🧬🧬🫟🫟🧬🧬🫟🫟🧬🧬🫟🫟"
step "Checking Engine 4"
echo "U engine4 AIM ISSUES ✅✅✅✅"
echo "🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠"


# ===== RENDERER / VULKAN (we confirmed these work on your device) =====
setprop debug.hwui.renderer skiavk
setprop debug.hwui.force_vulkan 1
setprop debug.renderengine.backend skiavk

# ===== FRAME / PHYSICS TIMING (force stable 60fps physics attach) =====
settings put global game_physics_fps 60
settings put global game_fixed_timestep_enabled 1
settings put global game_fixed_timestep_value 16667   # microseconds per 1/60s

# ===== COMPOSITOR / EGL LOW-LATENCY (tight swap, minimal buffering) =====
setprop debug.sf.hw 1
setprop debug.egl.hw 1
setprop debug.sf.disable_backpressure 1
setprop debug.sf.latch_unsignaled 1
setprop debug.egl.buffcount 2
setprop debug.gr.numframebuffers 2
setprop debug.gr.swapinterval 0
setprop debug.egl.swapinterval 0

# ===== HWUI / REDRAW (avoid partial-redraw spikes) =====
setprop debug.hwui.disable_scissor_opt true
setprop debug.hwui.use_buffer_age false
setprop debug.hwui.render_dirty_regions false
setprop debug.hwui.show_dirty_regions false

# ===== INPUT / UI MICRO-LATENCY (animation & UI work off) =====
settings put global window_animation_scale 0
settings put global transition_animation_scale 0
settings put global animator_duration_scale 0

# ===== NETWORK (reduce client-side delay / delayed-acks) =====
settings put global net.tcp.default_init_rwnd 60
settings put global net.tcp.delack.default 0

# ===== AGGRESSIVE BACKGROUND CONTROL =====
settings put global device_idle_constants inactive_to=300000,sensing_to=0,locating_to=0,motion_inactive_to=0,idle_after_inactive_to=300000
settings put global stay_on_while_plugged_in 3

# ===== DIAGNOSTICS (enable briefly to capture driver timing if you want logs) =====
setprop debug.mali.perfdoc.log logcat
setprop debug.egl.trace error
