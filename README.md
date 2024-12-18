# Rock papaer scissors game in Pascal Programming Language
This game is made for learning after finishing the pascal tutorial. The aim for this project is to utilize the knowledge of pascal into problem solving by using in project.

## Problem statement
- The game of rock paper scissors in traditional sense.
- The input must be the selection of menu and not being blocked by waiting input signal.
- There must be the main menu for the game for start and finish.
- There must be the result screen after player select.
- There must be a selection on whether or not player want to continue.
    - If player select restart the game must go back to the gameplay.
    - If player select to end the game it must lead back to main menu.

## State Analysis

```
                                       Select Play Again             
                                     +-------------------------+     
                                     |                         |     
                                     v                         |     
+-----------+  Click Start    +------------+ Select Option +---+----+
| Main Menu |---------------->|  Gameplay  |-------------->| Result |
+-----------+                 +------------+               +---+----+
      ^                                                        |     
      |                                                        |     
      +--------------------------------------------------------+     
                               Select End Game                       
```

## Menu Design
### Main Menu

```
---------------------------------
「Rock Paper Scissors in Pascal 」
---------------------------------
[x] Start
[ ] Exit
```

### Gameplay

```
---------------------------------
「Select your choice 」
---------------------------------
[x] Rock
[ ] Paper
[ ] Scissors
```

### Result
#### Win

```
---------------------------------
「You win! 」
---------------------------------
[x] Try Again
[ ] End
```
#### Lost

```
---------------------------------
「You lose! 」
---------------------------------
[x] Try Again
[ ] End
```
#### Draw

```
---------------------------------
「Draw! 」
---------------------------------
[x] Try Again
[ ] End
```
