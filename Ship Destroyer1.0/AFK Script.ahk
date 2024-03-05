#SingleInstance Force
#NoEnv

;*************************** STARTUP ***************************
Menu Tray, Icon, shell32.dll, 286
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

;*************************** TITLES ***************************
Gui Font, Bold, Times New Roman
Gui Add, Tab3, x0 y0 w390 h426, Info|One-Acc|Multi-Acc|Extras
Gui Show, w400 h440, Ship Destroyer - Mars > Vash > Yumo

;*************************** INFO TAB ***************************
Gui Tab, 1
;*********** INFO : Picture in the middle ***********
Gui, Add, Pic, x130 y140 w125 h150 , % f
;*********** INFO : How To Use section ***********
Gui Font, c0x9ED6FE, Century Gothic
Gui Add, GroupBox, x8 y30 w370 h85, How To Use
Gui Font, c0x9ED6FE, Consolas
Gui Add, Text, x12 y50 w350 h50, ╰┈➤ Choose whether you are using only 1 account or 2. One-Acc Tab is for 1 acc only and Multi-Acc is for 8. Extras Tab is for Anti-Crash and Chat Shortcuts. Be sure to click the Rename Trove button whenever you start afking.
;*********** INFO : Discord Servers section ***********
Gui Font, c0x9ED6FE, Century Gothic
Gui, Add, GroupBox, x8 y139 w110 h160 , Discord Servs
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Button, x22 y160 w80 h25 gButtonDiscordGalaxiaZero, Galaxia Zero
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Button, x22 y210 w80 h25 gButtonDiscordTrove, Trove Official
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Button, x22 y260 w80 h25 gButtonDiscordTrovesaurus, Trovesaurus
;*********** INFO : Helpful Stuff section ***********
Gui Font, c0x9ED6FE, Century Gothic
Gui, Add, GroupBox, x268 y139 w110 h160 , Helpful Stuff
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Button, x282 y160 w80 h25 gButtonWebClassBuilds, Class Builds
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Button, x282 y210 w80 h25 gButtonWebGemBuilds, Gem Builds
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Button, x282 y260 w80 h25 gButtonWebMods, Mods
;*********** INFO : Credits ***********
Gui Font, c0x9ED6FE, Century Gothic
Gui, Add, GroupBox, x9 y325 w369 h82, Credits
Gui Font, c0x9ED6FE, Consolas
Gui Add, Text, x15 y350 w200 h10, *•.¸UI/Script Dev --> Mars¸.•*
Gui Font, c0x9ED6FE, Consolas
Gui Add, Text, x90 y365 w200 h10, *•.¸Script Dev --> Vash¸.•*
Gui Font, c0x9ED6FE, Consolas
Gui Add, Text, x150 y380 w210 h10, *•.¸Script Dev/Idealist --> Yumo¸.•*
Gui Font, c0x9ED6FE, Helvetica
Gui, Add, CheckBox, x230 y334 w125 h21 vTylerCheckBox gTylerCheckBox, What does this do???

;*************************** ONE-ACC TAB ***************************
Gui Tab, 2
;*********** ONE-ACC : Rename Trove section ***********
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Button, x142 y29 w100 h30 gButtonRenameTrove1, Rename Trove
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Text, x16 y39 w120 h10 , MUST PRESS THIS --->
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Text, x252 y39 w120 h10 , <--- BEFORE STARTING
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Text, x133 y65 w120 h10 +Center, ONE Class at a time!
;*********** ONE-ACC : Boomeranger section ***********
Gui Font, c0x9ED6FE, Century Gothic
Gui, Add, GroupBox, x12 y79 w170 h80, » Boomeranger «
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Button, x22 y99 w150 h20 gButtonStartAttackingWithPickUpBR, Attack with Loot
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Button, x22 y129 w150 h20 gButtonStartAttackingWithoutPickUpBR, Attack without Loot
;*********** ONE-ACC : Dracolyte section ***********
Gui Font, c0x9ED6FE, Century Gothic
Gui, Add, GroupBox, x202 y79 w170 h80 , » Dracolyte «
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Button, x212 y99 w150 h20 gButtonStartAttackingWithPickUpDraco, Attack with Loot
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Button, x212 y129 w150 h20 gButtonStartAttackingWithoutPickUpDraco, Attack without Loot
;*********** ONE-ACC : Ice Sage section ***********
Gui Font, c0x9ED6FE, Century Gothic
Gui, Add, GroupBox, x12 y169 w170 h80 , » Ice Sage «
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Button, x22 y189 w150 h20 gButtonStartAttackingWithPickUpIS, Attack with Loot
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Button, x22 y219 w150 h20 gButtonStartAttackingWithoutPickUpIS, Attack without Loot
;*********** ONE-ACC : Lunar Lancer section ***********
Gui Font, c0x9ED6FE, Century Gothic
Gui, Add, GroupBox, x202 y169 w170 h80 , » Lunar Lancer «
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Button, x212 y189 w150 h20 gButtonStartAttackingWithPickUpLL, Attack with Loot
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Button, x212 y219 w150 h20 gButtonStartAttackingWithoutPickUpLL, Attack without Loot
;*********** ONE-ACC : Stop Attacking section ***********
Gui, Add, Pic, x123 y250 w140 h140 , % f
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Button, x143 y380 w100 h30 gButtonStopActionsOneAcc, Stop Attacking

;*************************** MULTI-ACC TAB ***************************
Gui Tab, 3
;*********** MULTI-ACC : Rename Trove section ***********
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Button, x142 y29 w100 h30 gButtonRenameTrove2, Rename Trove
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Text, x16 y39 w120 h10 , MUST PRESS THIS --->
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Text, x252 y39 w120 h10 , <--- BEFORE STARTING
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Text, x133 y65 w120 h10 +Center, ONE Class at a time!
;*********** ONE-ACC : Boomeranger section ***********
Gui Font, c0x9ED6FE, Century Gothic
Gui, Add, GroupBox, x12 y79 w170 h80, » Boomeranger «
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Button, x22 y99 w150 h20 gButtonStartAttackingWithPickUpBR2, Attack with Loot
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Button, x22 y129 w150 h20 gButtonStartAttackingWithoutPickUpBR2, Attack without Loot
;*********** ONE-ACC : Dracolyte section ***********
Gui Font, c0x9ED6FE, Century Gothic
Gui, Add, GroupBox, x202 y79 w170 h80 , » Dracolyte «
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Button, x212 y99 w150 h20 gButtonStartAttackingWithPickUpDraco2, Attack with Loot
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Button, x212 y129 w150 h20 gButtonStartAttackingWithoutPickUpDraco2, Attack without Loot
;*********** ONE-ACC : Ice Sage section ***********
Gui Font, c0x9ED6FE, Century Gothic
Gui, Add, GroupBox, x12 y169 w170 h80 , » Ice Sage «
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Button, x22 y189 w150 h20 gButtonStartAttackingWithPickUpIS2, Attack with Loot
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Button, x22 y219 w150 h20 gButtonStartAttackingWithoutPickUpIS2, Attack without Loot
;*********** ONE-ACC : Lunar Lancer section ***********
Gui Font, c0x9ED6FE, Century Gothic
Gui, Add, GroupBox, x202 y169 w170 h80 , » Lunar Lancer «
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Button, x212 y189 w150 h20 gButtonStartAttackingWithPickUpLL2, Attack with Loot
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Button, x212 y219 w150 h20 gButtonStartAttackingWithoutPickUpLL2, Attack without Loot
;*********** MULTI-ACC : Stop Attacking section ***********
Gui, Add, Pic, x123 y250 w140 h140 , % f
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Button, x143 y380 w100 h30 gButtonStopActionsMultiAcc, Stop Attacking

;*************************** EXTRAS TAB ***************************
Gui Tab, 4
;*********** Anti-Crash One-Acc section ***********
Gui Font, c0x9ED6FE, Century Gothic
Gui, Add, GroupBox, x12 y19 w190 h130 , Anti-Crash : One-Acc
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Button, x22 y49 w170 h30 gEnableAntiCrash, Enable Anti-Crash
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Button, x22 y89 w170 h30 gDisableAntiCrash, Disable Anti-Crash
;*********** Tyler section ***********
Gui, Add, Pic, x40 y200 w150 h150 , % f
;*********** Copy Pastes World Chat section ***********
Gui, Add, Pic, x225 y15 w140 h140 , % f
;*********** Bored? Have Fun! section ***********
Gui Font, c0x9ED6FE, Century Gothic
Gui, Add, GroupBox, x230 y150 w150 h240, Bored? Have Fun!
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Button, x245 y170 w120 h20 gButtonSnakeArcade, Snake Arcade
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Button, x245 y195 w120 h20 gButtonMovies, Movies
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Button, x245 y220 w120 h20 gButtonAnime, Anime
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Button, x245 y245 w120 h20 gButtonMiniGames, MiniGames
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Button, x245 y270 w120 h20 gButtonYouTube, YouTube
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Button, x245 y295 w120 h20 gButtonMusic, Music
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Button, x245 y320 w120 h20 gButtonChatGPT, ChatGPT
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Button, x245 y345 w120 h20 gButtonAdBlocker, AdBlocker
Gui Font, c0x9ED6FE, Consolas
Gui, Add, Button, x245 y368 w120 h20 gButtonTwitch, Twitch
Return


;*************************** INFO FUNCTIONS ***************************
;*********** INFO : Discord Servs section ***********
ButtonDiscordGalaxiaZero:
Run, https://discord.gg/aD4Bbm2VuC
Return
ButtonDiscordTrove:
Run, https://discord.gg/trovegame
Return
ButtonDiscordTrovesaurus:
Run, https://discord.gg/trovesaurus
Return
;*********** INFO : Helpful Stuff section ***********
ButtonWebClassBuilds:
Run, https://docs.google.com/spreadsheets/d/12UgLQkh6YJ5tZvvbrmqrYE6NfsPZ9e-bOmL-dBY30L8/edit#gid=1549018159
Return
ButtonWebGemBuilds:
Run, https://trovetools.slynx.xyz/gem_builds
Return
ButtonWebMods:
Run, https://trovesaurus.com/mods
Return
;*********** INFO : Credits section ***********
TylerCheckBox:
Gui, Submit, NoHide


;*************************** ACC RENAME FUNCTIONS ***************************
;*********** ONE-ACC : Rename Trove section ***********
ButtonRenameTrove1:
    If (WinExist("Trove") && WinExist("Afk4Life") = false){
        WinActivate, Trove
        WinSetTitle, Trove, , %Title%Afk4Life
        Sleep, 5000
    }
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
;*********** ONE-ACC : Boomeranger Attack section ***********
;*********** ONE-ACC : Boomeranger Attack With Pickup section ***********
ButtonStartAttackingWithPickUpBR:
    startedPickup := true
    while(startedPickup){
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
    }
Return
;*********** ONE-ACC : Boomeranger Attack Without Pickup section ***********
ButtonStartAttackingWithoutPickUpBR:
    started := true
    while(started){
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
;*********** MULTIE-ACC : Lunar Lancer Attack Without Pickup section ***********
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

;*********** ONE-ACC Stop Attacking ***********
ButtonStopActionsOneAcc:
    started := false
    startedPickup := false
    startedJump := false
Return
;*********** MULTI-ACC Stop Attacking ***********
ButtonStopActionsMultiAcc:
    started := false
    startedPickup := false
    startedJump := false
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
        Sleep, 200
        ControlClick, x1000 y100, Glyph
        Sleep, 10000
        WinActivate, Trove
        WinSetTitle, Trove, , %Title%Afk4Life
    }
    return
;*********** Bored? Have Fun section ***********
;*********** SnakeArcade section ***********
ButtonSnakeArcade:
	Run, https://www.google.com/fbx?fbx=snake_arcade&safe=active
Return
;*********** Movies section ***********
ButtonMovies:
	Run, https://www.youtube.com/watch?v=dQw4w9WgXcQ
Return
;*********** Anime section ***********
ButtonAnime:
	Run, https://123animehub.cc
Return
;*********** MiniGames section ***********
ButtonMiniGames:
	Run, https://www.coolmathgames.com
Return
;*********** YouTube section ***********
ButtonYouTube:
	Run, https://www.youtube.com
Return
;*********** Music section ***********
ButtonMusic:
	Run, https://open.spotify.com/?
Return
;*********** ChatGPT section ***********
ButtonChatGPT:
	Run, https://chat.openai.com
Return
;*********** AdBlocker section ***********
ButtonAdBlocker:
	Run, https://adguard.com/en/welcome.html
Return
;*********** Twitch section ***********
ButtonTwitch:
	Run, https://www.twitch.tv
Return

;*********** SHOW/HIDE Script ***********
ins::
toggle:= !toggle
If (toggle = 1)
	{
	Gui, Hide
	return
	}
Else (toggle = 0)
	{
	Gui, Show
	return
	}
return

GuiClose:
ExitApp

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
