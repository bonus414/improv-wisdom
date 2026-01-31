#!/bin/zsh

# Improv Wisdom Installer
# Sets up terminal greeting with random improv wisdom

echo "🎭 Installing Improv Wisdom Terminal Greeting..."
echo ""

# Get the directory where this script lives
SCRIPT_DIR="${0:a:h}"

# Copy wisdom file to home directory
echo "📝 Copying wisdom file to ~/.improv-wisdom.txt"
cp "$SCRIPT_DIR/improv-wisdom.txt" "$HOME/.improv-wisdom.txt"

# Copy scripts to home directory
echo "📜 Copying scripts to home directory"
cp "$SCRIPT_DIR/improv-wisdom.sh" "$HOME/.improv-wisdom.sh"
cp "$SCRIPT_DIR/improv-wisdom-config.sh" "$HOME/.improv-wisdom-config.sh"
chmod +x "$HOME/.improv-wisdom.sh"
chmod +x "$HOME/.improv-wisdom-config.sh"

# Check if already in .zshrc
if grep -q "improv-wisdom" "$HOME/.zshrc" 2>/dev/null; then
    echo "✅ Already configured in .zshrc"
else
    echo "⚙️  Adding to .zshrc..."
    echo "" >> "$HOME/.zshrc"
    echo "# Improv Wisdom - random wisdom on terminal startup" >> "$HOME/.zshrc"
    echo 'source "$HOME/.improv-wisdom.sh"' >> "$HOME/.zshrc"
    echo "" >> "$HOME/.zshrc"
    echo "# Change improv wisdom display style" >> "$HOME/.zshrc"
    echo 'alias improv-wisdom-config="source $HOME/.improv-wisdom-config.sh"' >> "$HOME/.zshrc"
    echo "✅ Added to .zshrc"
fi

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🎉 Installation complete!"
echo ""
echo "Open a new terminal - you'll be asked to choose a display style."
echo ""
echo "Commands:"
echo "  improv-wisdom-config  - change display style anytime"
echo ""
echo "Optional installs for extra fun:"
echo "  brew install cowsay   - cow delivers your wisdom"
echo "  brew install ponysay  - pony delivers your wisdom"
echo "  brew install figlet   - big ASCII text"
echo "  brew install lolcat   - rainbow colors"
echo ""
