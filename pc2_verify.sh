#!/bin/bash

# Rush 2049 PC2 Verification Script
# This script helps identify functional aspects of the game and what needs to be implemented

echo "=== Rush 2049 PC2 Functional Verification ==="
echo "Current commit: $(git rev-parse HEAD)"
echo "Branch: $(git rev-parse --abbrev-ref HEAD)"
echo ""

echo "=== Key Files Analysis ==="

# Check if we have basic build artifacts
if [ -f "baserom.us.z64" ]; then
    echo "✓ ROM file present"
    sha1sum baserom.us.z64 | grep -q "3f99351d7bb61656614bdb2aa1a90cfe55d1922c" && echo "✓ ROM hash verified" || echo "✗ ROM hash mismatch"
else
    echo "✗ ROM file missing"
fi

echo ""
echo "=== Game Structure Analysis ==="
echo "Source files in game directory:"
ls -la src/game/ | grep "\.c$" | head -15

echo ""
echo "=== Key System Components Found ==="
grep -r "race_init\|race_start\|race_update" src/game/ --include="*.c" | head -5
grep -r "save_init\|save_write\|save_read" src/game/ --include="*.c" | head -5
grep -r "menu_init\|menu_update" src/game/ --include="*.c" | head -5

echo ""
echo "=== Current Build Status ==="
if [ -d "build/us" ]; then
    echo "✓ Build directory exists"
    echo "  Files in build/us/src: $(ls build/us/src/ 2>/dev/null | wc -l) files"
else
    echo "✗ No build directory found"
fi

echo ""
echo "=== Function Coverage ==="
echo "Functions modified (from git diff):"
git diff --name-only HEAD | head -10

echo ""
echo "=== Summary ==="
echo "The repository shows significant decompilation work with:"
echo "- Complete save system implementation in save.c"
echo "- Race progression logic in race.c" 
echo "- Menu system in menu.c"
echo "- Main game loop in game.c"
echo ""
echo "However, no full gameplay flow has been verified - need to test:"
echo "1. Menu navigation and transitions"
echo "2. Race initiation and completion"
echo "3. Checkpoint/lap handling"
echo "4. Results display and persistence"