#!/bin/zsh

# Improv Wisdom Config - Change display mode

CONFIG_FILE="${IMPROV_WISDOM_CONFIG:-$HOME/.improv-wisdom-config}"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
PINK='\033[0;35m'
NC='\033[0m'
BOLD='\033[1m'

current=$(cat "$CONFIG_FILE" 2>/dev/null || echo "plain")

echo ""
echo "${GREEN}${BOLD}🎭 Improv Wisdom Config${NC}"
echo ""
echo "Current mode: ${BLUE}$current${NC}"
echo ""
echo "How do you want your wisdom delivered?"
echo ""
echo "  ${BLUE}1)${NC} plain   - clean box format"
echo "  ${BLUE}2)${NC} cow     - cowsay"
echo "  ${BLUE}3)${NC} pony    - ponysay (My Little Pony!)"
echo "  ${BLUE}4)${NC} big     - large ASCII text (figlet)"
echo "  ${BLUE}5)${NC} rainbow - rainbow colors (lolcat)"
echo ""
echo -n "Choose [1-5] or press Enter to keep current: "
read choice

case $choice in
    1) echo "plain" > "$CONFIG_FILE"; echo "${GREEN}Set to plain${NC}" ;;
    2) echo "cow" > "$CONFIG_FILE"; echo "${GREEN}Set to cow${NC}" ;;
    3) echo "pony" > "$CONFIG_FILE"; echo "${GREEN}Set to pony${NC}" ;;
    4) echo "big" > "$CONFIG_FILE"; echo "${GREEN}Set to big${NC}" ;;
    5) echo "rainbow" > "$CONFIG_FILE"; echo "${GREEN}Set to rainbow${NC}" ;;
    "") echo "Keeping: $current" ;;
    *) echo "Unknown option, keeping: $current" ;;
esac

echo ""
