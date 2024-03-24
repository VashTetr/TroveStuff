#SingleInstance, Force

Gui, +AlwaysOnTop +Resize
Gui, Color, 222222
Gui, Font, s10 cFFFFFF
Gui Add, GroupBox, x20 y20 w180 h95 cFuchsia, Toggle Keys
Gui, Add, Button, x30 y40 w160 h25 gButtonRecoverOn, Recover On
Gui, Add, Button, x30 y70 w160 h25 gButtonRecoverOff, Recover Off
Gui, Show, w230 h140, AntiCrash
Return

Global crashed := false

ButtonRecoverOn:
    crashed := true   
        while (crashed) {
            If (!WinExist("Trove")) {
		    WinClose, Trove - Error Handler
		    Sleep, 200
		    WinActivate, Glyph
            WinWaitActive, Glyph
            WinGetPos, Xpos, Ypos,Wpos,Hpos, Glyph
            clickPost := "x"+ Wpos *(80/100) " y" + Hpos * (14/100)
            Sleep, 200
            ControlClick, %clickPost% , Glyph 
		    Sleep, 10000
		    WinActivate, Trove
            }
    }
Return

ButtonRecoverOff:
    crashed := false
Return

GuiClose:
    ExitApp
Return
