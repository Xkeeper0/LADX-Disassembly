section "HRAM", HRAM[$ff80]

; *******************************************************************
; *                                                                 *
; *             >> LABEL GUIDELINE <<                               *
; *                                                                 *
; *         ; Description of the usage of this memory address.      *
; *         ; Possible values:                                      *
; *         ; 0 = meaning 0,                                        *
; *         ; 1 = meaning 1,                                        *
; *         ; 2 = meaning 2                                         *
; *         label::                                                 *
; *           ds 1 ; address as 4 hex value                         *
; *                                                                 *
; *******************************************************************

; TODO comment
hRomBank::
 ds 1 ; FF80

; used as tempory variable
hTemp::
 ds 1 ; FF81

; used as tempory variable
hCodeTemp::
 ds 1 ; FF82

; not used
hFF83:
 ds $D ; FF83 - FF8F

; Beginning of the game-variables section of the HRAM
hGameValuesSection::
 ; Commands for loading tiles into VRAM at the next vblank period (see LoadTiles)
 ;
 ; Commands:
 ;   0:   do nothing
 ;   1:   load world tiles
 ;   2:   load dungeon minimap tiles
 ;   3:
 ;   4:
 ;   5:
 ;   6:
 ;   7:
 ;   8-A: load inventory tiles for ocarina songs
 ;   B-D: load shared gfx: shadows, explosions, etc
hNeedsUpdatingBGTiles::
 ds 1 ; FF90

; bool value for enemie tile update
; 0 = no update of enemie tiles needed,
; 1 = update needed
hNeedsUpdatingEnnemiesTiles::
 ds 1 ; FF91

; Tiles are loaded in several passes. Holds the state of loading function progress.
; Possible values: 0 -> $0B
hBGTilesLoadingStage::
 ds 1 ; FF92

; Tiles are loaded in several passes. Holds the state of loading function progress.
; Possible values: 0 -> $0B
hEnemiesTilesLoadingStage::
 ds 1 ; FF93

; Sub-tileset to use for overworld or dungeon
hWorldTileset::
  ds 1 ; FF94

; not used
hFF95:
  ds 1 ; FF95

; offset of the main window in X direction
hBaseScrollX::
 ds 1 ; FF96

; offset of the main window in Y direction
hBaseScrollY::
 ds 1 ; FF97

; X position of Link on the map
hLinkPositionX::
 ds 1 ; FF98

; Y position of Link on the map
hLinkPositionY::
 ds 1 ; FF99

; Increment applied to hLinkPositionX at the end of the frame
hLinkPositionXIncrement::
 ds 1 ; FF9A


; Increment applied to hLinkPositionY at the end of the frame
hLinkPositionYIncrement::
 ds 1 ; FF9B

; used when jumping
; possible values:
; 0 = reset,
; 1 = ??? => TRUE?,
; 2 = ??? => different use?
; Unlabeled
hFF9C::
 ds 1 ; FF9C

; How the Link sprite should be drawn.
; for values see gameplay.asm
hLinkAnimationState::
  ds 1 ; FF9D

; Direction Link is facing
; See DIRECTION_* constants for possible values
hLinkDirection::
  ds 1 ; FF9E

; Final computed position of Link, once every modifiers added
hLinkFinalPositionX::
  ds 1 ; FF9F

; Final computed position of Link, once every modifiers added
hLinkFinalPositionY::
  ds 1 ; FFA0

; Whether the interactive motion of Link (i.e. responding to directionnal pad presses)
; is temporary blocked.
; For instance when grabbing an object with the Power Bracelet, giving
; a sword slash, or talking to some NPCs.
;
; Values:
;   0: interactive motion autorized
;   1: interactive motion locked (e.g. during grab or sword slash)
;   2: interactive motion locked (e.g. talking to Trendy game owner)
hLinkInteractiveMotionBlocked::
  ds 1 ; FFA1

; high byte of the distance from Link to the ground
hLinkPositionZHigh::
  ds 1 ; FFA2

; low byte of the distance from Link to the ground
hLinkPositionZLow::
  ds 1 ; FFA3

; Animated tiles are grouped by groups of 4 tiles.
; Each map can use one of these groups.
; See ANIMATED_TILES_* constants for possible values
hAnimatedTilesGroup::
  ds 1 ; FFA4

; Unlabeled
hFFA5::
  ds 1 ; FFA5

; Incremented every frame, wraps around $FF
hAnimatedTilesFrameCount::
  ds 1 ; FFA6

; Pointer to the animation data for the current
; frame (either 00, 40, 80 or C0).
hAnimatedTilesDataOffset::
  ds 1 ; FFA7

; Music fade out timer
hMusicFadeOutTimer::
  ds 1 ; FFA8

; Right channel volume -- low nybble only, 00-07
hVolumeRight::
  ds 1 ; FFA9

; Left channel volume -- high nybble only, 00-70
hVolumeLeft::
  ds 1 ; FFAA

; Music fade in timer
hMusicFadeInTimer::
  ds 1 ; FFAB

; Unlabeled
hFFAC::
  ds 1 ; FFAC

; Unlabeled
hFFAD::
  ds 1 ; FFAD

; Unlabeled
hFFAE::
  ds 1 ; FFAE

; Type of the object under the active entity
hObjectUnderEntity::
  ds 1 ; FFAF

; Music track to play
; See MUSIC_* constants for possible values
hDefaultMusicTrack::
  ds 1 ; FFB0

; Next music to be played after room transition
hNextMusicTrackToFadeInto::
  ds 1 ; FFB1

; When 1, Link is moving much slower, like when being
; incapacited by a mini-gel.
slowWalkingSpeed::
  ds 1 ; FFB1

; Unlabeled
hFFB3::
  ds 1 ; FFB3

; Unlabeled
hFFB4::
  ds 1 ; FFB4

; Number of frames during which joypad is ignored
hButtonsInactiveDelay::
  ds 1 ; FFB5

; Unlabeled
hFFB6::
  ds 1 ; FFB6

; Unlabeled
hFFB7::
  ds 1 ; FFB7

; Unlabeled
hFFB8::
  ds 1 ; FFB8

; Unlabeled
hFFB9::
  ds 1 ; FFB9

; Unlabeled
hFFBA::
  ds 1 ; FFBA

; Unlabeled
hFFBB::
  ds 1 ; FFBB

; Unknown; stores previous gameplay type before a transition?
; Related to fade-out/fade-in transitions
; Seems to affect whether a music track is restarted afer
; a transition
hFFBC::
  ds 1 ; FFBC

; Unlabeled
; used for music
hFFBD::
  ds 1 ; FFBD

; Unlabeled
hFFBE::
  ds 1 ; FFBE

; Music track to be played after countdown
; See hNextMusicTrackToFadeInto and
hNextDefaultMusicTrack::
  ds 1 ; FFBF

; DMA routine copied from ROM during initialization
; Copy the content of wOAMBuffer to the OAM memory
hDMARoutine::
  ds $A ; FFC0 - FFC9

; not used
hFFCA:
  ds 1 ; FFCA

; The pressed buttons on the joypad.
; During all the time a button is pressed, the matching bit on this variable is set.
;
; See J_* constants for values.
hPressedButtonsMask::
  ds 1 ; FFCB

; The buttons newly pressed on the joypad.
; The matching bit is set only during the first frame the button is pressed.
; Afterwards, the bit is cleared.
;
; See J_* constants for values.
hJoypadState::
  ds 1 ; FFCC

; Topmost corner of the area intercepted by Link's sword
; Vary from 00 to 80 by increments of 10
hSwordIntersectedAreaY::
  ds 1 ; FFCD

; Leftmost corner of the area intercepted by Link's sword
; Vary from 00 to A0 by increments of 10
hSwordIntersectedAreaX::
  ds 1 ; FFCE

; Unlabeled
hFFCF::
  ds $1 ; FFCF

; Unlabeled
hFFD0::
  ds $1 ; FFD0

; boolean value if changes needs to be rendered
; 1 = frame rendering is needed,
; 0 = frame rendering was done
hNeedsRenderingFrame::
  ds 1 ; FFD1

; Unlabeled
hFFD2::
  ds 5 ; FFD2

; used in many different cases
hMultiPurpose0::
  ds 1 ; FFD7

; used in many different cases
hMultiPurpose1::
  ds 1 ; FFD8

; used in many different cases
hMultiPurpose2::
  ds 1 ; FFD9

; used in many different cases
hMultiPurpose3::
  ds 1 ; FFDA

; used in many different cases
hMultiPurpose4::
  ds 1 ; FFDB

; used in many different cases
hMultiPurpose5::
  ds 1 ; FFDC

; used in many different cases
hMultiPurpose6::
  ds 1 ; FFDD

; used in many different cases
hMultiPurpose7::
  ds 1 ; FFDE

; used in many different cases
hMultiPurpose8::
  ds 1 ; FFDF

; used in many different cases
hMultiPurpose9::
; high bit of the BG map offset
hBGMapOffsetHigh::
  ds 1 ; FFE0

; used in many different cases
hMultiPurposeA::
; low bit of the BG map offset
hBGMapOffsetLow::
  ds 1 ; FFE1

; used in many different cases
hMultiPurposeB::
  ds 1 ; FFE2

; used in many different cases
hMultiPurposeC::
  ds 1 ; FFE3

; used in many different cases
hMultiPurposeD::
  ds 1 ; FFE4

; used in many different cases
hMultiPurposeE::
  ds 1 ; FFE5

; used in many different cases
hMultiPurposeF::
; Address of the first free warp data slot
hFreeWarpDataAddress::
  ds 1 ; FFE6

; wraps around 00-FF
hFrameCounter::
  ds 1 ; FFE7

; used in many different cases
hMultiPurposeG::
; bank number for the used room
hRoomBank::
; tile data for the dialog background
hDialogBackgroundTile::
  ds 1 ; FFE8

; used in many different cases
hMultiPurposeH::
; tile data for the dungeon floor
hDungeonFloorTile::
; TODO comment
hIndexOfObjectBelowLink::
  ds 1 ; FFE9

; Active entity status
; See wEntitiesStatusTable
hActiveEntityStatus::
  ds 1 ; FFEA

; Active entity type
; See wEntitiesTypeTable
hActiveEntityType::
  ds 1 ; FFEB

; Visual Y-position (including the Z position) of the active entity.
; Usually equal to posY + posZ.
hActiveEntityVisualPosY::
  ds 1 ; FFEC

; Invert OAM attribute bits of the active entity.
;
; Each bit set inverts the OAM attributes of the active sprite pair.
; bit 0-3: GBC palette,
; bit 4: use inverted color palette,
; bit 5: x-flip the entity,
; bit 6: y-flip the entity,
; bit 7: invert the background priority
hActiveEntityFlipAttribute::
  ds 1 ; FFED

; Logical X-position of the active entity.
hActiveEntityPosX::
  ds 1 ; FFEE

; Logical Y-position of the active entity.
; (Also see hActiveEntityVisualPosY)
hActiveEntityPosY::
  ds 1 ; FFEF

; The entity-specific state of the active entity
; See wEntitiesStateTable
hActiveEntityState::
  ds 1 ; FFF0

; See wEntitiesSpriteVariantTable
hActiveEntitySpriteVariant::
  ds 1 ; FFF1

; Start playing a jingle
; See JINGLE_* constants for possible values
hJingle::
  ds 1 ; FFF2

; Start playing a waveform audio effect
; See WAVE_SFX_* constants for possible values
hWaveSfx::
  ds 1 ; FFF3

; Play a noise-generated audio effect next
; See NOISE_SFX_* constants for possible values
hNoiseSfx::
  ds 1 ; FFF4

; hActiveEntityTilesOffset?
; Control the base location of the active entity tiles
; in the tilemap.
;
; Dodongo snake: $10 for a specific instance
; Octorock: $30
; etc.
hActiveEntityTilesOffset::
  ds 1 ; FFF5

; Room id on the active map
hMapRoom:: ; FFF6
  ds 1

; Id of the current indoor world map
; See MAP_* constants for values
hMapId::
  ds 1 ; FFF7

; Status flags of the current room
; 0x00 = not visited,
; 0x04 = bos door is open,
; 0x10 = special event occured,
; 0x30 = don't load room entities,
; 0x80 = visited,
hRoomStatus::
  ds 1 ; FFF8

; 0  top view
; 1  Unknown
; 2  side-scrolling view
hIsSideScrolling::
  ds 1 ; FFF9

; Position of Link in the current world room
; Value goes from 0 (top left) to $79 (bottom right)
; Not updated during room transitions
hLinkRoomPosition::
  ds 1 ; FFFA

; Final position of Link in the room, once modifiers applied
hLinkFinalRoomPosition::
  ds 1 ; FFFB

; not used
hFFFC:
  ds 1 ; FFFC

; Is the engine currently rendering a frame.
; 0 = rendering is done, a frame is ready to be copied to VRAM,
; 1 = the engine is rendering a new frame
hIsRenderingFrame::
 ds 1 ; FFFD

; Marker for the Hardware that the program is running on
; 0 = GB,
; 1 = GBC
hIsGBC::
  ds 1 ; FFFE
