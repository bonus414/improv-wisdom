# 🎭 Improv Wisdom

A terminal greeting that delivers random improv wisdom nuggets every time you open a new shell.

## What it does

Each time you open your terminal, you'll see something like:

```
🎭 Improv Wisdom
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Yes, AND... builds scenes (and solutions)

Instead of shutting down ideas, build on them. Even if the initial
suggestion isn't perfect, there's usually something valuable to work with.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

## Install

```bash
git clone https://github.com/YOUR_USERNAME/improv-wisdom.git
cd improv-wisdom
./install.sh
```

On first terminal open, you'll be asked to choose a display style.

## Display Styles

Choose how your wisdom gets delivered:

| Style | Description | Requires |
|-------|-------------|----------|
| **plain** | Clean box format | Nothing |
| **cow** | Cowsay - a cow delivers your wisdom | `brew install cowsay` |
| **pony** | Ponysay - My Little Pony delivers your wisdom | `brew install ponysay` |
| **big** | Large ASCII art text | `brew install figlet` |
| **rainbow** | Rainbow colored text | `brew install lolcat` |

Change your style anytime:
```bash
improv-wisdom-config
```

## Uninstall

Remove these lines from your `~/.zshrc`:
```bash
# Improv Wisdom - random wisdom on terminal startup
source "$HOME/.improv-wisdom.sh"

# Change improv wisdom display style
alias improv-wisdom-config="source $HOME/.improv-wisdom-config.sh"
```

Then delete the files:
```bash
rm ~/.improv-wisdom.txt ~/.improv-wisdom.sh ~/.improv-wisdom-config.sh ~/.improv-wisdom-config
```

## Add your own wisdom

Edit `~/.improv-wisdom.txt`. Format:

```
Your principle here
%
The explanation or application
%
Another principle
%
Another explanation
```

Each principle/explanation pair is separated by `%` on its own line.

## Credits

Improv wisdom collected by [Lauren Morris](https://laurenoutloud.com) from years of teaching improv and applying it to tech/product work.

---

*"I used to be funny. Now I work in tech."*
