#SingleInstance Force
#NoEnv

;****************************************************************** INFORMATION *******************************************************
Menu Tray, Icon, shell32.dll, 14
Gui +AlwaysOnTop
RunWith(32)
DLLPath:=A_ScriptDir "\USkin.dll"
StylesPath:=A_ScriptDir "\style\"

stylearray:=Object() ;create StyleArray to hold styles
Loop,% StylesPath "*.msstyles"
	stylearray.insert(A_LoopFilename)
total:= stylearray.MaxIndex() ;Get total number of styles
for key, value in stylearray {
	CurrentStyle:=value
	SkinForm(DLLPath,Apply, StylesPath . CurrentStyle)
	SkinForm(DLLPath,"0", StylesPath . CurrentStyle)	
}

SkinForm(DLLPath,Param1 = "Apply", SkinName = ""){
	if(Param1 = Apply){
		DllCall("LoadLibrary", str, DLLPath)
		DllCall(DLLPath . "\USkinInit", Int,0, Int,0, AStr, SkinName)
	}else if(Param1 = 0){
		DllCall(DLLPath . "\USkinExit")
	}
}
Gui Add, Button, x96 y80 w80 h40 gButtonReloadScript, Reload Script
Gui Add, Button, x20 y20 w100 h30 gOneAccount, One Account
Gui Add, Button, x150 y20 w100 h30 gMultiAccount, Multiple Accounts
Gui, Show, w272 h125, Ship Destroyer
Return

;****************************************************************** ONE ACCOUNT *******************************************************
OneAccount:
    Gui, New, +AlwaysOnTop
	Gui, Add, Button, x142 y29 w100 h30 gButtonRenameTrove1, Rename Trove
	Gui, Add, Text, x16 y39 w120 h10 , MUST PRESS THIS --->
	Gui, Add, Text, x252 y39 w120 h10 , <--- BEFORE STARTING
	Gui, Add, Text, x133 y65 w120 h10 +Center, ONE Class at a time!
	;*********** ONE-ACC : Rename Trove section ***********
	Gui, Add, Button, x142 y29 w100 h30 gButtonRenameTrove1, Rename Trove
	Gui, Add, Text, x16 y39 w120 h10 , MUST PRESS THIS --->
	Gui, Add, Text, x252 y39 w120 h10 , <--- BEFORE STARTING
	Gui, Add, Text, x133 y65 w120 h10 +Center, ONE Class at a time!
	;*********** ONE-ACC : Boomeranger section ***********
	Gui, Add, GroupBox, x12 y79 w170 h80, Boomeranger
	Gui, Add, Button, x22 y99 w150 h20 gButtonStartAttackingWithPickUpBR, Attack with Loot
	Gui, Add, Button, x22 y129 w150 h20 gButtonStartAttackingWithoutPickUpBR, Attack without Loot
	;*********** ONE-ACC : Dracolyte section ***********
	Gui, Add, GroupBox, x202 y79 w170 h80 , Dracolyte
	Gui, Add, Button, x212 y99 w150 h20 gButtonStartAttackingWithPickUpDraco, Attack with Loot
	Gui, Add, Button, x212 y129 w150 h20 gButtonStartAttackingWithoutPickUpDraco, Attack without Loot
	;*********** ONE-ACC : Ice Sage section ***********
	Gui, Add, GroupBox, x12 y169 w170 h80 , Ice Sage
	Gui, Add, Button, x22 y189 w150 h20 gButtonStartAttackingWithPickUpIS, Attack with Loot
	Gui, Add, Button, x22 y219 w150 h20 gButtonStartAttackingWithoutPickUpIS, Attack without Loot
	;*********** ONE-ACC : Lunar Lancer section ***********
	Gui, Add, GroupBox, x202 y169 w170 h80 , Lunar Lancer
	Gui, Add, Button, x212 y189 w150 h20 gButtonStartAttackingWithPickUpLL, Attack with Loot
	Gui, Add, Button, x212 y219 w150 h20 gButtonStartAttackingWithoutPickUpLL, Attack without Loot
	;*********** ONE-ACC : Stop Attacking section ***********
	Gui, Add, Button, x143 y400 w100 h30 gButtonStopActionsOneAcc, Stop Attacking
	;*********** Anti-Crash One-Acc section ***********
	Gui, Add, GroupBox, x12 y260 w170 h120 , Anti-Crash
	Gui, Add, Button, x22 y280 w130 h30 gEnableAntiCrash, Enable Anti-Crash
	Gui, Add, Button, x22 y330 w130 h30 gDisableAntiCrash, Disable Anti-Crash
	;*********** AntiAFK One-Acc section ***********
	Gui, Add, GroupBox, x202 y260 w170 h120 , AntiAFK
	Gui, Add, Button, x225 y280 w130 h30 gEnableAntiAFK, Enable AntiAFK
	Gui, Add, Button,x225 y330 w130 h30 gDisableAntiAFK, Disable AntiAFK
	;*********** GUI TITLE ***********
    Gui Show, w400 h440, One Account Menu
    Return

;*********** ONE-ACC : Boomeranger Attack section ***********
;*********** ONE-ACC : Boomeranger Attack With Pickup section ***********
ButtonStartAttackingWithPickUpBR:
    startedPickup := true
    while(startedPickup){
        ControlSend,,{Esc Down}, Afk4Life
        ControlSend,,{m down}, Afk4Life
        ControlSend,,{e down}, Afk4Life
        sleep, 5000
        ControlSend,,{e up}, Afk4Life
        ControlSend,,{m up}, Afk4Life
        ControlSend,,{o down}, Afk4Life
        sleep, 500
        ControlSend,,{o up}, Afk4Life
        ControlSend,,{2 down}, Afk4Life
        sleep, 200
        ControlSend,,{2 up}, Afk4Life
		sleep, 100
        ControlSend,,{Esc Up}, Afk4Life
    }
Return
;*********** ONE-ACC : Boomeranger Attack Without Pickup section ***********
ButtonStartAttackingWithoutPickUpBR:
    started := true
    while(started){
        ControlSend,,{Esc Down}, Afk4Life
        ControlSend,,{m down}, Afk4Life
        sleep, 5000
        ControlSend,,{m up}, Afk4Life
        ControlSend,,{o down}, Afk4Life
        sleep, 500
        ControlSend,,{o up}, Afk4Life
        ControlSend,,{2 down}, Afk4Life
        sleep, 200
        ControlSend,,{2 up}, Afk4Life
		sleep, 100
        ControlSend,,{Esc Up}, Afk4Life
    }
Return
;*********** ONE-ACC : Dracolyte Attack With Pickup section ***********
ButtonStartAttackingWithPickUpDraco:
    startedPickup := true
    while(startedPickup){
        ControlSend,, {m down}, Afk4Life
        ControlSend,, {1 down}, Afk4Life
        ControlSend,, {e down}, Afk4Life
        Sleep, 100
        ControlSend,, {1 up}, Afk4Life
        Sleep, 700
        ControlSend,, {2 down}, Afk4Life
        ControlSend,, {e up}, Afk4Life
        Sleep, 100
        ControlSend,, {2 up}, Afk4Life
        ControlSend,, {m up}, Afk4Life
    }
Return
;*********** ONE-ACC : Dracolyte Attack Without Pickup section ***********
ButtonStartAttackingWithoutPickUpDraco:
    started := true
    while(started){
        ControlSend,, {m down}, Afk4Life
        ControlSend,, {1 down}, Afk4Life
        Sleep, 100
        ControlSend,, {1 up}, Afk4Life
        Sleep, 700
        ControlSend,, {2 down}, Afk4Life
        Sleep, 100
        ControlSend,, {2 up}, Afk4Life
        ControlSend,, {m up}, Afk4Life
    }
Return
;*********** ONE-ACC : Ice Sage Attack With Pickup section ***********
ButtonStartAttackingWithPickUpIS:
    startedPickup := true
    while(startedPickup){
        ControlSend,,{o down}, Afk4Life
        ControlSend,,{1 down}, Afk4Life
        ControlSend,,{e down}, Afk4Life
        sleep, 100
        ControlSend,,{1 up}, Afk4Life
        ControlSend,,{o up}, Afk4Life
        sleep, 300
        ControlSend,,{e up}, Afk4Life
    }
Return
;*********** ONE-ACC : Ice Sage Attack Without Pickup section ***********
ButtonStartAttackingWithoutPickUpIS:
    started := true
    while(started){
        ControlSend,,{o down}, Afk4Life
        ControlSend,,{1 down}, Afk4Life
        sleep, 100
        ControlSend,,{1 up}, Afk4Life
        ControlSend,,{o up}, Afk4Life
        sleep, 300
    }
Return
;*********** ONE-ACC : Lunar Lancer Attack With Pickup section ***********
ButtonStartAttackingWithPickUpLL:
    startedPickup := true
    while(startedPickup){
        ControlSend,,{m down}, Afk4Life
        ControlSend,,{e down}, Afk4Life
        sleep, 5000
        ControlSend,,{e up}, Afk4Life
        ControlSend,,{m up}, Afk4Life
        sleep, 500
        ControlSend,,{2 down}, Afk4Life
        sleep, 200
        ControlSend,,{2 up}, Afk4Life
        sleep, 100
    }
Return
;*********** ONE-ACC : Lunar Lancer Attack Without Pickup section ***********
ButtonStartAttackingWithoutPickUpLL:
    started := true
    while(started){
        ControlSend,,{m down}, Afk4Life
        sleep, 5000
        ControlSend,,{m up}, Afk4Life
        sleep, 500
        ControlSend,,{2 down}, Afk4Life
        sleep, 200
        ControlSend,,{2 up}, Afk4Life
        sleep, 100
    }
Return
;*********** ONE-ACC Stop Attacking ***********
ButtonStopActionsOneAcc:
    started := false
    startedPickup := false
    startedJump := false
Return
;*********** ONE-ACC Rename Trove ***********
ButtonRenameTrove1:
    If (WinExist("Trove") && !WinExist("Afk4Life")){
        WinActivate, Trove
        WinSetTitle, Trove, , %Title%Afk4Life
        Sleep, 5000
    }
Return
;*********** ANTI-CRASH One-Acc Section ***********
EnableAntiCrash:
    SetTimer, AntiCrash, On
    GuiControl, Disable, Enable Anti-Crash
    GuiControl, Enable, Disable Anti-Crash
    return

DisableAntiCrash:
    SetTimer, AntiCrash, Off
    GuiControl, Enable, Enable Anti-Crash
    GuiControl, Disable, Disable Anti-Crash
    return

AntiCrash:
    if (!WinExist("Afk4Life")) {
        WinClose, Trove - Error Handler
        Sleep, 200
        WinActivate, Glyph
        Sleep, 500
        ControlClick, x1000 y100, Glyph
        Sleep, 1000
        If (!WinExist("Trove")){
            ControlClick, x1000 y100, Glyph
        }
        Sleep, 5000
        WinActivate, Trove
        WinSetTitle, Trove, , %Title%Afk4Life
    }
    return
;*********** AntiAFK One-Acc Section ***********
EnableAntiAFK:
    SetTimer, AntiAFK, On
    GuiControl, Disable, Enable AntiAFK
    GuiControl, Enable, Disable AntiAFK
    return

DisableAntiAFK:
    SetTimer, AntiAFK, Off
    GuiControl, Enable, Enable AntiAFK
    GuiControl, Disable, Disable AntiAFK
    return
	
AntiAFK:
    startedJump := true
    while(startedJump){
        ControlSend,, {1 down}, %Title%Afk4Life
        ControlSend,, {1 up}, %Title%Afk4Life
        Sleep, 400
        ControlSend,, {z down}, %Title%Afk4Life
        ControlSend,, {z up}, %Title%Afk4Life
        ControlSend,, {space down}, %Title%Afk4Life
        ControlSend,, {space up}, %Title%Afk4Life
        Sleep, 400
        ControlSend,, {space down}, %Title%Afk4Life
        ControlSend,, {space up}, %Title%Afk4Life
        Sleep, 400
        ControlSend,, {space down}, %Title%Afk4Life
        ControlSend,, {space up}, %Title%Afk4Life
        Sleep, 400
        ControlSend,, {space down}, %Title%Afk4Life
        ControlSend,, {space up}, %Title%Afk4Life
        Sleep, 20200
    }
Return

;****************************************************************** MULTI ACCOUNT *******************************************************
MultiAccount:
    Gui, New, +AlwaysOnTop
	Gui, Add, Button, x142 y29 w100 h30 gButtonRenameTrove2, Rename Trove
	Gui, Add, Text, x16 y39 w120 h10 , MUST PRESS THIS --->
	Gui, Add, Text, x252 y39 w120 h10 , <--- BEFORE STARTING
	Gui, Add, Text, x133 y65 w120 h10 +Center, ONE Class at a time!
	Gui, Add, GroupBox, x12 y79 w170 h80, Boomeranger
	Gui, Add, Button, x22 y99 w150 h20 gButtonStartAttackingWithPickUpBR2, Attack with Loot
	Gui, Add, Button, x22 y129 w150 h20 gButtonStartAttackingWithoutPickUpBR2, Attack without Loot
	Gui, Add, GroupBox, x202 y79 w170 h80 , Dracolyte
	Gui, Add, Button, x212 y99 w150 h20 gButtonStartAttackingWithPickUpDraco2, Attack with Loot
	Gui, Add, Button, x212 y129 w150 h20 gButtonStartAttackingWithoutPickUpDraco2, Attack without Loot
	Gui, Add, GroupBox, x12 y169 w170 h80 , Ice Sage
	Gui, Add, Button, x22 y189 w150 h20 gButtonStartAttackingWithPickUpIS2, Attack with Loot
	Gui, Add, Button, x22 y219 w150 h20 gButtonStartAttackingWithoutPickUpIS2, Attack without Loot
	Gui, Add, GroupBox, x202 y169 w170 h80 , Lunar Lancer
	Gui, Add, Button, x212 y189 w150 h20 gButtonStartAttackingWithPickUpLL2, Attack with Loot
	Gui, Add, Button, x212 y219 w150 h20 gButtonStartAttackingWithoutPickUpLL2, Attack without Loot
	Gui, Add, Button, x143 y380 w100 h30 gButtonStopActionsMultiAcc, Stop Attacking
    Gui Show, w400 h440, Multiple Accounts Menu
    Return

;*********** MULTI-ACC : Boomeranger Attack section ***********
;*********** MULTI-ACC : Boomeranger Attack With Pickup section ***********
ButtonStartAttackingWithPickUpBR2:
started := true
while (started) {
    Loop, 8 {
        ControlSend,, {m down}, Afking%A_Index%
        ControlSend,, {e down}, Afking%A_Index%
    }
    sleep 5000
    Loop, 8 {
        ControlSend,, {e up}, Afking%A_Index%
        ControlSend,, {m up}, Afking%A_Index%
        ControlSend,, {o down}, Afking%A_Index%
    }
    sleep 500
    Loop, 8 {
        ControlSend,, {o up}, Afking%A_Index%
        ControlSend,, {2 down}, Afking%A_Index%
        ControlSend,, {2 up}, Afking%A_Index%
    }
    sleep 100
}
Return
;*********** MULTI-ACC : Boomeranger Attack Without Pickup section ***********
ButtonStartAttackingWithoutPickUpBR2:
started := true
while (started) {
    Loop, 8 {
        ControlSend,, {m down}, Afking%A_Index%
    }
    sleep 5000
    Loop, 8 {
        ControlSend,, {m up}, Afking%A_Index%
        ControlSend,, {o down}, Afking%A_Index%
    }
    sleep 500
    Loop, 8 {
        ControlSend,, {o up}, Afking%A_Index%
        ControlSend,, {2 down}, Afking%A_Index%
        ControlSend,, {2 up}, Afking%A_Index%
    }
    sleep 100
}
Return
;*********** MULTI-ACC : Dracolyte Attack With Pickup section ***********
ButtonStartAttackingWithPickUpDraco2:
started := true
while (started) {
    Loop, 8 {
        ControlSend,, {1 down}, Afking%A_Index%
        ControlSend,, {1 down}, Afking%A_Index%
        ControlSend,, {e down}, Afking%A_Index%
    }
    sleep 100
    Loop, 8 {
        ControlSend,, {1 up}, Afking%A_Index%
	ControlSend,, {1 up}, Afking%A_Index%
	ControlSend,, {2 down}, Afking%A_Index%
    }
    sleep 700
    Loop, 8 {
        ControlSend,, {e up}, Afking%A_Index%
	ControlSend,, {2 up}, Afking%A_Index%
    }
    sleep 100
}
Return
;*********** MULTI-ACC : Dracolyte Attack Without Pickup section ***********
ButtonStartAttackingWithoutPickUpDraco2:
started := true
while (started) {
    Loop, 8 {
        ControlSend,, {1 down}, Afking%A_Index%
        ControlSend,, {1 down}, Afking%A_Index%
    }
    sleep 100
    Loop, 8 {
        ControlSend,, {1 up}, Afking%A_Index%
	ControlSend,, {1 up}, Afking%A_Index%
	ControlSend,, {2 down}, Afking%A_Index%
    }
    sleep 700
    Loop, 8 {
	ControlSend,, {2 up}, Afking%A_Index%
    }
    sleep 100
}
Return
;*********** MULTI-ACC : Ice Sage Attack With Pickup section ***********
ButtonStartAttackingWithPickUpIS2:
started := true
while (started) {
    Loop, 8 {
        ControlSend,, {o down}, Afking%A_Index%
        ControlSend,, {1 down}, Afking%A_Index%
	ControlSend,, {e down}, Afking%A_Index%
	ControlSend,, {e down}, Afking%A_Index%
    }
    sleep 100
    Loop, 8 {
        ControlSend,, {o up}, Afking%A_Index%
        ControlSend,, {1 up}, Afking%A_Index%
    }
    sleep 200
    Loop, 8 {
	ControlSend,, {e up}, Afking%A_Index%
    }
    sleep 200
}
Return
;*********** MULTI-ACC : Ice Sage Attack Without Pickup section ***********
ButtonStartAttackingWithoutPickUpIS2:
started := true
while (started) {
    Loop, 8 {
        ControlSend,, {o down}, Afking%A_Index%
        ControlSend,, {1 down}, Afking%A_Index%
    }
    sleep 100
    Loop, 8 {
        ControlSend,, {o up}, Afking%A_Index%
        ControlSend,, {1 up}, Afking%A_Index%
    }
    sleep 200
    
}
Return
;*********** MULTI-ACC : Lunar Lancer Attack With Pickup section ***********
ButtonStartAttackingWithPickUpLL2:
    startedPickup := true
    while(startedPickup){
	    Loop, 8 {
        ControlSend,,{m down}, Afking%A_Index%
        ControlSend,,{e down}, Afking%A_Index%
		}
        sleep, 5000
		Loop, 8 {
        ControlSend,,{e up}, Afking%A_Index%
        ControlSend,,{m up}, Afking%A_Index%
		}
        sleep, 500
		Loop, 8 {
        ControlSend,,{2 down}, Afking%A_Index%
		}
        sleep, 200
		Loop, 8 {
        ControlSend,,{2 up}, Afking%A_Index%
		}
        sleep, 100
    }
Return
;*********** MULTI-ACC : Lunar Lancer Attack Without Pickup section ***********
ButtonStartAttackingWithoutPickUpLL2:
    started := true
    while(started){
	    Loop, 8 {
        ControlSend,,{m down}, Afking%A_Index%
		}
        sleep, 5000
		Loop, 8 {
        ControlSend,,{m up}, Afking%A_Index%
		}
        sleep, 500
		Loop, 8 {
        ControlSend,,{2 down}, Afking%A_Index%
		}
        sleep, 200
		Loop, 8 {
        ControlSend,,{2 up}, Afking%A_Index%
		}
        sleep, 100
    }
Return

;*********** MULTI-ACC Stop Attacking ***********
ButtonStopActionsMultiAcc:
    started := false
    startedPickup := false
    startedJump := false
Return

;*********** MULTI-ACC : Rename Trove section ***********
ButtonRenameTrove2:
Loop, 8 {
    if WinExist("Trove") && !WinExist("Afking" . A_Index) {
        WinActivate, Trove
        WinSetTitle, Trove, , Afking%A_Index%
        sleep 1500
    }
}
Return

;****************************************************************** RELOAD SCRIPT  *******************************************************
ButtonReloadScript:
{
    Reload
    IniRead, LoadText, %A_ScriptDir%/%IniFile%, Main, Text
}

global started := false
return
;*************************** AHK VERSION FOR THEME ***************************
runWith(version){	
	if (A_PtrSize=(version=32?4:8))
		Return
	
	SplitPath,A_AhkPath,,ahkDir ;get directory of AutoHotkey executable
	if (!FileExist(correct := ahkDir "\AutoHotkeyU" version ".exe")){
		MsgBox,0x10,"Error",% "Couldn't find the " version " bit Unicode version of Autohotkey in:`n" correct
		ExitApp
	}
	Run,"%correct%" "%A_ScriptName%",%A_ScriptDir%
	ExitApp
}
;*************************** CLOSE SCRIPT ***************************
GuiClose:
    ExitApp
Return
