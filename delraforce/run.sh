echo "     ####### 🇸🇩 running all codes 🇸🇩 ####### "
RED='\033[1;31m'
GREEN='\033[1;32m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
PURPLE='\033[1;35m'
YELLOW='\033[1;33m'
RESET='\033[0m'
BOLD='\033[1m'


# Banner function
banner() {
  echo "╔═══════════════════════════════════════╗"
  printf "%s \n" "$1  "
  echo "╚═══════════════════════════════════════╝"
}

# Step function
step() {
  echo "▶️  $1 ... ✔"
}


# Ender function
ender() {
  echo "╔═══════════════════════════════════════╗"
  printf "%s \n" "$1  "
  echo "╚═══════════════════════════════════════╝"
}








banner "🔴🟠🟡 🔬🧫 Full System Fixing  v1.0 🧫🔬  🟡🟠🔴"
echo ""
step "Checking Screen"
sh screen.sh
echo ""

step "Checking CPU"
sh cpu.sh
echo ""

step "Checking GPU"
sh gpu.sh
echo ""

#step "Checking Internet"
#sh internet.sh

step "Checking RAM"
sh ram.sh
echo ""

echo "🚨🚨 ⚡⚡⚡ Unreal Engine part ⚡⚡⚡ 🚨🚨"
#step "Checking Unreal Engine"
sh ue.sh

echo " "
step "🎖️🎖️🎖️Stay Sharp Soldier 🫡"
echo "🏅🏅🏅🏅🏅🏅🏅🏅🏅🏅🏅🏅🏅🏅🏅🏅🏅🏅🏅🏅🏅🏅🏅🏅"
echo "🏄🏽🏄🏽🏄🏽🏄🏽🏄🏽     ))^_^))   ((^_^((    🏄🏽🏄🏽🏄🏽🏄🏽🏄🏽"

ender "==  💪🌀🌀🌀   DELTA FORCE Ready   🌀🌀🌀🤳🏽   =="
echo "🏅🏅🏅🏅🏅🏅🏅🏅🏅🏅🏅🏅🏅🏅🏅🏅🏅🏅🏅🏅🏅🏅🏅🏅"
echo ""

#sleep 1
#monkey -p com.garena.game.df 1



