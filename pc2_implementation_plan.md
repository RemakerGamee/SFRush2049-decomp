# Rush 2049 PC2 Implementation Plan

## Current Status
- Working decompilation with significant matching functions
- Save system, race management, menu systems all exist in code
- No full gameplay flow verified yet
- Repository is at commit 301d9e75 on pc2/decomp-worker branch

## Key Areas to Verify and Implement

### 1. Menu Navigation and Transitions (Priority 1)
**Files involved**: menu.c, game.c
**What needs verification**:
- Main menu displays properly
- Menu navigation works (up/down, select)
- Transition from menu to race mode
- Pause menu functionality
- Return to menu from race

### 2. Race Progression and Completion (Priority 2) 
**Files involved**: race.c, checkpoint.c, game.c
**What needs verification**:
- Lap counting (lap 1/3, lap 2/3, lap 3/3)
- Checkpoint detection and progression
- Race completion detection
- Final standings display
- Next-race transition

### 3. Persistence and Save System (Priority 3)
**Files involved**: save.c, game.c  
**What needs verification**:
- Save initialization on game start
- Saving between races
- Loading saved data at game start
- Progression tracking (unlocks, records)
- Isolated test profiles

### 4. Game-State Transitions (Priority 4)
**Files involved**: game.c, race.c, menu.c
**What needs verification**:
- Proper state handling during race progression
- Return to menu after race completion
- Retry functionality 
- Circuit progression through multiple races

## Acceptance Criteria

### Must-have Functionality:
1. Menu navigation works without crashes
2. Race can be started from main menu
3. Lap progression (1/3 → 2/3 → 3/3) works
4. Race completion and results screen display works
5. Return to menu after race works
6. Save/load functionality works with isolated test data
7. Progression through circuits works

### Verification Steps:
1. **Build**: Verify basic build system (even non-matching)
2. **Menu Flow**: Test main menu → start race → pause → return to menu  
3. **Race Progression**: Complete one circuit (3 laps) with checkpoint detection
4. **Results**: Verify results display and saving
5. **Persistence**: Test save/load cycle with isolated data

## Implementation Approach

### Phase 1: Baseline Verification
- Create test environment for gameplay verification
- Identify what currently works vs what doesn't  
- Document current functional state

### Phase 2: Core Gameplay Flow
- Implement or fix menu transitions
- Implement lap/checkpoint progression logic
- Fix race completion detection
- Implement results display

### Phase 3: Persistence Testing
- Test save/load functionality
- Verify progression tracking
- Confirm data persistence across restarts

### Phase 4: Regression Testing  
- Test multiple sessions
- Check for stale state issues
- Validate reinitialization behavior

## Files Owned by PC2 Worker (Game-side implementation)

### Core Gameplay:
- `src/game/race.c` - Race progression, lap tracking, completion detection
- `src/game/checkpoint.c` - Checkpoint handling and progression
- `src/game/game.c` - Main game loop and state transitions  
- `src/game/menu.c` - Menu navigation and system transitions

### Persistence:
- `src/game/save.c` - Save/load system and serialization
- `src/game/record.c` - Record tracking and progression
- `src/game/state.c` - Game state management

### Supporting:
- `src/game/init.c` - Initialization routines
- `src/game/hiscore.c` - High score handling
- `src/game/garage.c` - Car selection and progression

## Known Limitations in Current State
1. Full build requires IDO compiler setup (not available)
2. Missing blob generation pipeline prevents full compilation
3. No verified end-to-end gameplay flow
4. Some function implementations may be incomplete or partially matching
5. Native PC port functionality not yet implemented (Copilot's responsibility)

## Immediate Next Steps

1. Create isolated test environment for gameplay verification
2. Identify specific functional blockers by testing basic flows  
3. Implement focused fixes for highest-impact issues
4. Document findings and create acceptance matrix