# Step function
step() {
  echo "▶️  $1 ... ✔"
}

echo  " "
echo "🧬🧬🫟🫟🧬🧬🫟🫟🧬🧬🫟🫟🧬🧬🫟🫟🧬🧬🫟🫟"
step "Checking Engine 2"
echo "U engine 2 math and gpu  ✅✅"
echo "🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠"
# ==== SurfaceFlinger / compositor tweaks ====
setprop debug.sf.hw 1
setprop debug.egl.hw 1
setprop debug.performance.tuning 1

# reduce compositor backpressure and latch behavior (improves frame delivery)
setprop debug.sf.disable_backpressure 1
setprop debug.sf.latch_unsignaled 1

# ==== EGL / buffer & swap tweaks ====
# reduce buffering latency (fewer frames queued) — (try 2/3/4 to test)
setprop debug.egl.buffcount 3
setprop debug.gr.numframebuffers 3

# native scaling control (turn off system scaling that can add math overhead)
setprop debug.egl.native_scaling false

# optional: try lower swap interval to reduce input-to-display latency (may cause tearing)
# (if it appears to be rejected or causes tearing, remove/comment these two)
setprop debug.gr.swapinterval 0
setprop debug.egl.swapinterval 0

# ==== HWUI / dirty-region & buffer-age control (reduce re-raster work) ====
# prefer full redraw logic that avoids odd partial-redraw overhead on some ROMs
setprop debug.hwui.use_buffer_age false
setprop debug.hwui.render_dirty_regions false

# ensure no UI profiling / overlays remain on
setprop debug.hwui.profile false
setprop debug.hwui.show_dirty_regions false

# ==== ART / runtime & malloc / JVM micro-optimizations (reduce JS/Java overhead) ====
setprop dalvik.vm.usejit true
setprop dalvik.vm.verify-bytecode false
setprop dalvik.vm.checkjni false
setprop libc.debug.malloc 0

# ==== Optional GPU vendor perf logging (useful only if your SoC vendor exposes it) ====
# (these are harmless if ignored; useful if you later inspect logs)
setprop debug.mali.perfdoc.log logcat
setprop debug.egl.trace error
