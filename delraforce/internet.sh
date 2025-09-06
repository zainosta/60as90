echo "🌬️ Network 60FPS Stable Profile 🌬️"

# Reserve CPU core for net
#settings put global sys.tasknet.reserve_core 1

# WiFi lock (2.4 GHz stable)
settings put global wifi_frequency_band 0
settings put global wifi_scan_always_enabled 0
settings put global wifi_suspend_optimizations_enabled 0
#settings put global wifi_country_code US

# No metrics save
settings put global net.tcp.no_metrics_save 1


##### sounds fast internet 0 lags ######
settings put global net.tcp.default_init_rwnd 0.3
settings put global net.tcp.delack.default 0
settings put global net.tcp.delack.min 0
settings put global net.tcp.fastopen 1
settings put global net.tcp.retries1 1
settings put global net.tcp.retries2 1
settings put global net.tcp_timestamps 0
settings put global net.tcp_keepalive_time 0.3
settings put global net.tcp_keepalive_intvl 0.3
settings put global net.tcp_keepalive_probes 0.2

echo "✅ Network tuned for 60FPS smoothness"
