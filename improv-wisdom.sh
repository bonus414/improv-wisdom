#!/bin/zsh

# Improv Wisdom - Terminal Greeting
# Shows a random improv wisdom nugget each time terminal opens

WISDOM_FILE="${IMPROV_WISDOM_FILE:-$HOME/.improv-wisdom.txt}"
CONFIG_FILE="${IMPROV_WISDOM_CONFIG:-$HOME/.improv-wisdom-config}"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
PINK='\033[0;35m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color
BOLD='\033[1m'

# Check if wisdom file exists
if [[ ! -f "$WISDOM_FILE" ]]; then
    return 0 2>/dev/null || exit 0
fi

# Check for config, prompt if missing
if [[ ! -f "$CONFIG_FILE" ]]; then
    echo ""
    echo "${GREEN}${BOLD}🎭 Welcome to Improv Wisdom!${NC}"
    echo ""
    echo "How do you want your wisdom delivered?"
    echo ""
    echo "  ${BLUE}1)${NC} plain   - clean box format"
    echo "  ${BLUE}2)${NC} cow     - cowsay (requires: brew install cowsay)"
    echo "  ${BLUE}3)${NC} pony    - ponysay (requires: brew install ponysay)"
    echo "  ${BLUE}4)${NC} big     - large ASCII text (requires: brew install figlet)"
    echo "  ${BLUE}5)${NC} rainbow - rainbow colors (requires: brew install lolcat)"
    echo ""
    echo -n "Choose [1-5]: "
    read choice

    case $choice in
        1) echo "plain" > "$CONFIG_FILE" ;;
        2) echo "cow" > "$CONFIG_FILE" ;;
        3) echo "pony" > "$CONFIG_FILE" ;;
        4) echo "big" > "$CONFIG_FILE" ;;
        5) echo "rainbow" > "$CONFIG_FILE" ;;
        *) echo "plain" > "$CONFIG_FILE" ;;
    esac

    echo ""
    echo "${GREEN}Saved! Run 'improv-wisdom-config' to change later.${NC}"
    echo ""
fi

# Read display mode
DISPLAY_MODE=$(cat "$CONFIG_FILE" 2>/dev/null || echo "plain")

# Read the file and split into array by % delimiter
IFS='%' read -r -d '' -A entries < "$WISDOM_FILE" 2>/dev/null || true

# Clean up whitespace from each entry
cleaned=()
for entry in "${entries[@]}"; do
    trimmed="$(echo "$entry" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
    if [[ -n "$trimmed" ]]; then
        cleaned+=("$trimmed")
    fi
done

# Pick a random wisdom
total=${#cleaned[@]}
if [[ $total -lt 1 ]]; then
    return 0 2>/dev/null || exit 0
fi

random_idx=$((RANDOM % total + 1))  # zsh arrays are 1-indexed
wisdom="${cleaned[$random_idx]}"

# Display based on mode
case $DISPLAY_MODE in
    cow)
        if command -v cowsay &> /dev/null; then
            echo ""
            echo "$wisdom" | cowsay -W 50
            echo ""
        else
            echo "${YELLOW}cowsay not found. Install with: brew install cowsay${NC}"
            echo "${YELLOW}Falling back to plain...${NC}"
            DISPLAY_MODE="plain"
        fi
        ;;
    pony)
        if command -v ponysay &> /dev/null; then
            echo "$wisdom" | ponysay -W 50
        else
            echo "${YELLOW}ponysay not found. Install with: brew install ponysay${NC}"
            echo "${YELLOW}Falling back to plain...${NC}"
            DISPLAY_MODE="plain"
        fi
        ;;
    big)
        if command -v figlet &> /dev/null; then
            echo ""
            echo "$wisdom" | figlet -w 80 -f small
            echo ""
        else
            echo "${YELLOW}figlet not found. Install with: brew install figlet${NC}"
            echo "${YELLOW}Falling back to plain...${NC}"
            DISPLAY_MODE="plain"
        fi
        ;;
    rainbow)
        if command -v lolcat &> /dev/null; then
            echo ""
            echo "🎭 Improv Wisdom"
            echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
            echo "$wisdom"
            echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
            echo ""
        else
            echo "${YELLOW}lolcat not found. Install with: brew install lolcat${NC}"
            echo "${YELLOW}Falling back to plain...${NC}"
            DISPLAY_MODE="plain"
        fi | lolcat 2>/dev/null || DISPLAY_MODE="plain"
        ;;
esac

# Plain fallback (also used if other modes fail)
if [[ "$DISPLAY_MODE" == "plain" ]]; then
    echo ""
    echo "${GREEN}${BOLD}🎭 Improv Wisdom${NC}"
    echo "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo "${PINK}$wisdom${NC}"
    echo "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
fi
