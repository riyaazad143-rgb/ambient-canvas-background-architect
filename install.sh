#!/usr/bin/env bash
set -e

echo "=========================================================="
echo "  Installing ambient-canvas-background-architect Skill"
echo "=========================================================="

GLOBAL_SKILLS_DIR="$HOME/.gemini/config/skills"
TARGET_DIR="$GLOBAL_SKILLS_DIR/ambient-canvas-background-architect"
ALIAS_DIR="$GLOBAL_SKILLS_DIR/ambient-bg"

mkdir -p "$TARGET_DIR" "$ALIAS_DIR"

BASE_URL="https://raw.githubusercontent.com/riyaazad143-rgb/ambient-canvas-background-architect/main"

echo "[*] Downloading SKILL.md..."
curl -sSL "$BASE_URL/SKILL.md" -o "$TARGET_DIR/SKILL.md"

echo "[*] Configuring alias 'ambient-bg'..."
curl -sSL "$BASE_URL/ambient-bg/SKILL.md" -o "$ALIAS_DIR/SKILL.md"

if [ -d ".git" ] || [ -f "package.json" ]; then
    mkdir -p .agents/skills/ambient-canvas-background-architect
    cp "$TARGET_DIR/SKILL.md" .agents/skills/ambient-canvas-background-architect/SKILL.md
    echo "[+] Also mirrored to workspace: .agents/skills/ambient-canvas-background-architect"
fi

echo "[SUCCESS] Skill installed globally to: $TARGET_DIR"
echo "[SUCCESS] You can now use /ambient-canvas-background-architect or /ambient-bg!"
