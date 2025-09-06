
# Step function
step() {
  echo "▶️  $1 ... ✔"
}

echo  " "
echo "🧬🧬🫟🫟    ))^_^))🧬((^_^((    🫟🫟🧬🧬🫟🫟"
step "This one close every background app use it manually to not lose brevent app session"
echo "Prefix  🫟🫟🫟"
echo "🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠🧠"


# Kill background junk
#am kill-all

# Force system memory trim (non-root cache cleanup)
#cmd activity send-trim-memory com.garena.game.df MODERATE
#cmd activity send-trim-memory com.garena.game.df COMPLETE

# Correct renice format (boost game priority)
#renice -n -20 -p $(pidof com.garena.game.df)

# Hint scheduler to prefer performance (less aggressive than root)
#cmd power boost INTERACTION 1

# Drop cached background memory only (does NOT touch your game data)
#cmd activity idle-maintenance

# Force background apps to release memory
#am trim-memory all MODERATE
#am trim-memory all BACKGROUND


#ps -A | grep -E "sh|sleep" | awk '{print $2}' | xargs kill -9






