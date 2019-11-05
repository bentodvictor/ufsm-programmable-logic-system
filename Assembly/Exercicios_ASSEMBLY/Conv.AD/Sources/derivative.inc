; Note: This file is recreated by the project wizard whenever the MCU is
;       changed and should not be edited by hand

; include derivative specific macros
            INCLUDE 'mc9s08ac128.inc'


; RAM/ROM definitions


; Watchdog feed macro
feed_watchdog: MACRO
            STA SRS              ; feed the watchdog
          ENDM
