; Warning: This file is managed by Mosaic development environment.
; It is not recommended to change it manualy!

#program LinkaPasSemTam , V1.0
;**************************************
;<ActionName/>
;<Programmer/>
;<FirmName/>
;<Copyright/>
;**************************************
;<History>
;</History>
;**************************************
#useoption CPM = 9              ; CPM type: K
#useoption RemZone = 0          ; the remanent zone length
#useoption AlarmTime = 150      ; first alarm [milisec]
#useoption MaxCycleTime = 750   ; maximum cycle [milisec]
#useoption PLCstart = 1         ; cold start
#useoption AutoSummerTime = 0   ; internal PLC clock does not switch to daylight saving time
#useoption RestartOnError = 0   ; PLC will not be restarted after hard error

#uselib "LocalLib\StdLib_V22_20180619.mlb"
#endlibs

;**************************************
#usefile "SysGen\HWConfig.ST", 'auto'
#usefile "SysGen\LinkaPasSemTam.hwc", 'auto'
#usefile "..\SinCerveneLinky.hwn", 'auto'
#usefile "Sysgen\CIBMaker.mos", 'auto'
#usefile "Sysgen\CIBMaker.st", 'auto'
#usefile "LINKAPASSEMTAM.ST"
#usefile "prgMain.ST"
#usefile "LinkaPasSemTam.mcf", 'auto'