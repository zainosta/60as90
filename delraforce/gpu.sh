echo "=== GPU tuning for 60FPS stable ==="

# Reduce latency
settings put global gfx_surface_size_policy 0
settings put global persist.sys.gfx.skip_idle_vsync 1
settings put global persist.sys.ui.hw 1
#settings put global debug.egl.swapinterval 1   # lock to vsync = 60hz

# HWUI tweaks
settings put global debug.hwui.renderer skiavk
settings put global debug.hwui.disable_vsync 0
settings put global debug.hwui.render_dirty_regions false

# Cache balanced
settings put global debug.hwui.drop_shadow_cache_size 2
settings put global debug.hwui.texture_cache_size 72
settings put global debug.hwui.layer_cache_size 48
settings put global debug.hwui.path_cache_size 32
settings put global debug.hwui.gradient_cache_size 4

# Stable 60 FPS lock
settings put global persist.sys.NV_FPSLIMIT 60
settings put global persist.sys.gpu.force 1

echo "✅ GPU locked at smooth 90FPS"
echo "--------------------- "