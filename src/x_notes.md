# Xkeeper's notes
Misc notes that have not been translated into disassembly comments yet

----

## Patches

### Patch matrix

|       -       | JP 1.0 | JP 1.1 | JP 1.2 | US 1.0 | US 1.1 | US 1.2 | FR 1.0 | FR 1.1 | DE 1.0 | DE 1.1 |
|:-------------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|:------:|
| `__PATCH_0__` |        |  Yes   |  Yes   |        |  Yes   |  Yes   |  Yes   |  Yes   |  Yes   |  Yes   |
| `__PATCH_1__` |        |        |        |        |        |        |  Yes   |  Yes   |  Yes   |  Yes   |
| `__PATCH_2__` |        |  Yes   |  Yes   |        |        |  Yes   |  Yes   |  Yes   |  Yes   |  Yes   |
| `__PATCH_3__` |        |  Yes   |  Yes   |        |  Yes   |  Yes   |        |        |        |        |
| `__PATCH_4__` |        |        |  Yes   |        |        |  Yes   |        |  Yes   |        |  Yes   |
| `__PATCH_5__` |        |        |        |        |        |        |        |        |  Yes   |  Yes   |
| `__PATCH_6__` |  Yes   |  Yes   |  Yes   |        |        |        |        |        |        |        |
| `__PATCH_7__` |        |        |        |        |        |        |  Yes   |  Yes   |        |        |
| `__PATCH_8__` |        |  Yes   |  Yes   |        |        |        |        |        |        |        |
| `__PATCH_9__` |  Yes   |  Yes   |  Yes   |        |        |        |        |        |  Yes   |  Yes   |
| `__PATCH_A__` |    1   |    1   |    1   |        |        |        |        |        |    2   |    2   |
| `__PATCH_B__` |    1   |    1   |    1   |        |        |        |    2   |    2   |    1   |    1   |
| `__PATCH_C__` |        |        |        |  Yes   |  Yes   |  Yes   |        |        |        |        |

### Patch notes

This is not an exhaustive list. Many patches have effects that are not well-documented,
and even for the patches listed below the lists are likely not complete.


#### `__PATCH_0__`
* If **Yes**, will **not** check for Evil Eagle's room when loading a minimap
  * `src/code/minimap.asm -> LoadMinimap`
  * Effects of this are unknown
* [Color Dungeon book shadow is removed](https://tcrf.net/The_Legend_of_Zelda:_Link%27s_Awakening/Version_Differences#Book.27s_Shadow_in_the_Library)
  * `src/code/bank3.asm -> Data_003_42F1`
* Many, many other undocumented changes everywhere
  * A handful of checks against your current tunic type when changing music tracks
  * `src/code/entities/bank7.asm -> EntityA8Handler` - Code possibly relating to (unused?) entity `A8`?


#### `__PATCH_1__`
_(To-do)_


#### `__PATCH_2__`
* Changes a single opcode(?)
  * `src/code/audio/sfx.asm` (before the huge string of `nop`s)
* No other changes. This is the only thing this patch does!


#### `__PATCH_3__`
* Removes the debug feature that reset your photo album when pressing SELECT on the subscreen
  * `src/code/bank20.asm -> jr_020_63F5`
* Many other undocumented changes


#### `__PATCH_4__`
* Adds code to recalculate player's count of heart containers at certain times.
  * `src/code/bank1.asm -> Call_001_5eca`
  * Contains two tables; one for boss rooms, one for Piece of Heart rooms
  * Sets max hearts to `CLAMP(3, 14, 3 + (boss room flags) + (PoH room flags / 4))`
* Various other undocumented changes
  * File menu
  * Photo interface

#### `__PATCH_5__`
* Removes the bizarre feature where debug flag 2 writes a weird BG map to the subscreen
  * `src/code/world_handler.asm -> GameplayWorldSubtype0Handler`
* Various other undocumented changes
  * Credits
  * File menus


#### `__PATCH_6__`
* Seems to be a "reverse history patch". The disassembly is based on DX US 1.0 and this is for the JP versions only
  * That is, rather than representing a change in a future version, this change reverts to an older version of code
* Pointless `push hl`, `pop hl` instruction
  * `src/code/bank1.asm -> jr_001_55F5`
  * This seems like a complete waste of a few bytes and CPU cycles???
* Changes some graphics for the introduction sequence
  * `src/code/intro.asm -> Data_001_72DE`
  * [Obligatory TCRF link](https://tcrf.net/The_Legend_of_Zelda:_Link%27s_Awakening/Version_Differences#Introduction_Background)
* Various other undocumented changes


#### `__PATCH_7__`
* Changes to credits code
  * `src/code/credits.asm -> AnimateCreditsIslandFadeTiles`
  * Some other changes throughout the credits
* No other changes


#### `__PATCH_8__`
* Removes the debug feature that let you jump to the ending by pushing START on the map screen if debug flag 3 was enabled.
  * `src/code/world_map.asm -> WorldMapInteractiveHandler`
  * Oddly, this change didn't proliferate to other versions...
* Writes the current bank to the current bank memory address during the intro
  * `src/code/intro.asm -> IntroSceneStage0Handler`
  * Possible fix for obscure race condition?
* No other changes


#### `__PATCH_9__`
* Completely unfounded assumption: deals with handling dakuten, handakuten, and umlaut modifiers.
* Effects of this patch are unknown


#### `__PATCH_A__`
* Has two variants, which seem to have been used to test a change in the order of calls to update the status bar
  * `src/code/world_handler.asm -> GameplayWorldSubtype4Handler`
    * `0`: Calls `LoadHeartsAndRuppeesCount`, then `IncrementGameplaySubtype`.
    * `1`: Calls `IncrementGameplaySubtype`, then (if debug flag 2 is _not_ set) `LoadHeartsAndRuppeesCount`
    * `2`: Calls `IncrementGameplaySubtype`, then `LoadHeartsAndRuppeesCount`
  * `src/code/world_handler.asm -> GameplayWorldSubtype5Handler`
    * `0`: Calls `label_3E5A`, then `IncrementGameplaySubtype`.
    * `1`: Calls `IncrementGameplaySubtype`, then (if debug flag 2 is _not_ set) `label_3E5A`
    * `2`: Calls `IncrementGameplaySubtype`, then `label_3E5A`
	* `label_3E5A` draws the A and B button inventory icons (according to comments)
* No other changes


#### `__PATCH_B__`
* Has two variants; makes a single change to the file menu code
  * `src/code/file_menus.asm -> jr_001_489D`
  * Effects of this patch are unknown
* No other changes


#### `__PATCH_C__`
* More changes in the file menus
  * `src/code/file_menus.asm -> jr_001_4894`, etc.
  * Effects of this patch are unknown
* No other changes


## Debug stuff

* While in a dungeon, free movement mode will update your position on the minimap,
  even across rooms that it ordinarily would not; e.g. when entering a side-scrolling area,
  enabling free movement will show the indicator at the "real" room you are in.


## Background tile commands

From `src/data/backgrounds/background_tile_commands.asm`:

* `01`: island from ending disappearing-island scene
* `02`: subscreen `a[]b[]`, rupee icon, horizontal and vertical line
* `03`: file select main screen w/ no files - no erase / copy option
* `04`: file select main screen w/ files - erase / copy options present
* `05`: name entry screen
* `06`: file erase
* `07`: (dynamic, RAM)
* `08`: map screen border
* `09`: eagle tower's unused parallax scroll
* `0a`: game over menu
* `0b`: blacked out window on the subscreen, drawn with debug flag 2
* `0c`: file copy
* `0d`: a+b+s+s save & quit menu
* `0e`: intro scene w/ clouds, waves (?) looks slightly broken in gbc
* `0f`: intro scene w/ link holding onto the rope
* `10`: intro scene - beach
* `11`: title screen
* `12`: photo of catherine
* `13`: marin beach scene
* `14`: mamu spotlight overlay (probably)
* `15`: face shrine mural
* `16`: unchecked / credits
* `17`: unchecked / credits
* `18`: unchecked / credits
* `19`: unchecked / credits
* `1a`: unchecked / credits
* `1b`: unchecked / credits
* `1c`: unchecked / credits
* `1d`: unchecked / credits (?) 
* `1e`: unchecked / credits
* `1f`: unchecked / credits
* `20`: unchecked / credits
* `21`: unchecked / credits
* `22`: unchecked / credits
  * All of these are based on seeing them called in the `credits.asm` code, _except_ for `1d`
* `23`: schultz's painting
* `24`: eagle's tower pillar-drop cutscene
* `25`: intro scene w/ clouds, waves

## Fun

### Speeding up dialogue

`src/code/home/dialog.asm`: Change `jp` to `call`
    .delayOver
        call func_01C_49F1                            ; $24C7: $CD $F1 $49
        ; jp   IncrementDialogStateAndReturn            ; $24CA: $C3 $85 $24
        call   IncrementDialogStateAndReturn            ; $24CA: $C3 $85 $24

`src/code/home/dialog.asm`: Change `$08` to `$00`
    label_275D::
        dec  e                                        ; $275D: $1D
        jr   nz, label_2739                           ; $275E: $20 $D9
        ld   a, $08  ; Pause the scrolling for 8 frames ; $2760: $3E $08
        ld   [wDialogScrollDelay], a                  ; $2762: $EA $72 $C1
        jp   IncrementDialogStateAndReturn            ; $2765: $C3 $85 $24
