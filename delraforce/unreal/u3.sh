# Step function
step() {
  echo "▶️  $1 ... ✔"
}

echo  " "
echo "🧬🧬🫟🫟🧬🧬🫟🫟🧬🧬🫟🫟🧬🧬🫟🫟🧬🧬🫟🫟"
step "Checking Engine 3"
echo "U engine 3 MATH ✅✅✅"
echo "🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠"


# --- Physics & Fixed-timestep / deterministic frame pacing ---
settings put global game_physics_fps 60
settings put global game_fixed_timestep_enabled 1   # if ROM supports this key (harmless if ignored)
settings put global game_fixed_timestep_value 16667 # microseconds per frame for 60Hz (16666.67 ≈ 1/60s)

# --- Force stable display timing that physics can attach to ---
settings put system min_refresh_rate 60
settings put system peak_refresh_rate 60

# --- Reduce OS jitter that pollutes CPU math timing ---
settings put global window_animation_scale 0
settings put global transition_animation_scale 0
settings put global animator_duration_scale 0
settings put global updatable_driver_all_apps 1

# --- Reduce background interrupts (lets the physics thread keep CPU cycles) ---
settings put global device_idle_constants inactive_to=300000,sensing_to=0,locating_to=0,motion_inactive_to=0,idle_after_inactive_to=300000
settings put global stay_on_while_plugged_in 3

# --- Prioritize accurate timestamping & lower frame queuing (better input->physics link) ---
setprop debug.sf.hw 1
setprop debug.egl.buffcount 2
setprop debug.gr.numframebuffers 2
setprop debug.sf.disable_backpressure 1
setprop debug.sf.latch_unsignaled 1

# --- Reduce partial-redraw weirdness that forces extra CPU math/spikes ---
setprop debug.hwui.use_buffer_age false
setprop debug.hwui.render_dirty_regions false

# --- Driver/precision hints (only if vendor honors them) — harmless if ignored ---
setprop debug.egl.precision_hint high
setprop debug.gr.precision_mode 2

# --- Micro-profiling hooks (enable only to measure then disable) ---
setprop debug.mali.perfdoc.log logcat
setprop debug.egl.trace error
