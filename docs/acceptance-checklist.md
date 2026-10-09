# Rush 2049 - Acceptance Checklist

This document outlines the acceptance criteria for verifying the PC port functionality of Rush 2049, focusing on gameplay and persistence aspects.

## Gameplay Tests

### Main Menu Navigation
- [ ] Main menu loads correctly
- [ ] Options menu accessible and functional
- [ ] Records/High Scores menu accessible and displays data
- [ ] Quit option works properly

### Race Initialization
- [ ] Start Race option initiates game
- [ ] Race configuration (track selection, car choice, difficulty) works
- [ ] Countdown timer starts correctly
- [ ] Game state transitions to active gameplay

### Circuit Progression
- [ ] Lap timing and checkpoint detection work
- [ ] Car movement and physics behave as expected
- [ ] Race progression through laps
- [ ] Final lap properly detected and handled
- [ ] Finish line crossing triggers race completion

### Race Completion & Results
- [ ] Race finish screen displays correctly
- [ ] Player results (time, position, etc.) are accurate
- [ ] High score table updates with new records
- [ ] Circuit progression continues to next track
- [ ] Retry/continue options work properly

### Game Modes
- [ ] Single player mode functions
- [ ] Multiple player modes function (if implemented)
- [ ] Time trial mode functions (if implemented)
- [ ] Arcade mode functions (if implemented)

## Persistence Tests

### Save System
- [ ] Save system initializes correctly
- [ ] Save files can be created and written
- [ ] Save data persists across game sessions
- [ ] Save data can be loaded successfully
- [ ] Save data integrity maintained

### High Scores
- [ ] High scores are saved and loaded correctly
- [ ] High score tables update with new records
- [ ] Default high scores load properly when no save exists
- [ ] Score validation works (time limits, etc.)

### Unlocks/Progression
- [ ] Car unlocks work correctly
- [ ] Track unlocks work correctly
- [ ] Progression flags persist between sessions
- [ ] Save data structure maintains compatibility

## Controller Pak Integration

### Save Data Management
- [ ] Multiple controller pak detection works
- [ ] Save data can be written to different paks
- [ ] Save data automatically loads from available pak
- [ ] Save data validation works
- [ ] Error handling for missing/poorly formatted paks

### Compatibility
- [ ] Controller Pak save system matches arcade behavior
- [ ] Save data structure maintains arcade compatibility
- [ ] Arcade statistics and high score functionality preserved