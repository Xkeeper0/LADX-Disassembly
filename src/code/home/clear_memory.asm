;
; Memory-clearing functions
;

; Clear $1600 bytes of WRAM (from $C000 to $D600)
ClearLowerAndMiddleWRAM::
    ld   bc, $1600                                ; $29C1: $01 $00 $16
    jr   ClearWRAMBytes                           ; $29C4: $18 $16

; Clear $1300 bytes of WRAM (from $C000 to $D300)
ClearLowerWRAM::
    ld   bc, $1300                                ; $29C6: $01 $00 $13
    jr   ClearWRAMBytes                           ; $29C9: $18 $11

; Clear lower values of HRAM (from $FF90 to $FFBF) and all WRAM
ClearWRAMAndLowerHRAM::
    ld   bc, $2F                                  ; $29CB: $01 $2F $00
    jr   ClearHRAMBytesAndWRAM                    ; $29CE: $18 $03

; Clear all values from HRAM and WRAM
; (only `hIsGBC` is kept)
ClearHRAMAndWRAM::
    ; Set all bytes of HRAM (from $FF90 to $FFFD) to zero
    ld   bc, $6D                                  ; $29D0: $01 $6D $00

ClearHRAMBytesAndWRAM::
    ; Set BC bytes of HRAM (starting from $FF90) to zero
    ld   hl, hGameValuesSection                   ; $29D3: $21 $90 $FF
    call ClearBytes                               ; $29D6: $CD $DF $29
    ; Set all bytes of WRAM (from $C000 to $DF00) to zero
    ld   bc, $1F00                                ; $29D9: $01 $00 $1F

; Set BC bytes of WRAM (starting from $C000) to zero
ClearWRAMBytes::
    ld   hl, wram0Section                         ; $29DC: $21 $00 $C0

; Set BC bytes of memory starting from HL to zero
ClearBytes::
    ldh  a, [hIsGBC]                              ; $29DF: $F0 $FE
    push af                                       ; $29E1: $F5

.loop
    xor  a                                        ; $29E2: $AF
    ldi  [hl], a                                  ; $29E3: $22
    dec  bc                                       ; $29E4: $0B
    ld   a, b                                     ; $29E5: $78
    or   c                                        ; $29E6: $B1
    jr   nz, .loop                                ; $29E7: $20 $F9
    pop  af                                       ; $29E9: $F1
    ldh  [hIsGBC], a                              ; $29EA: $E0 $FE
    ret                                           ; $29EC: $C9
