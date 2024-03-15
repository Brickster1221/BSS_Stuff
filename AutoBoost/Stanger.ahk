; By brickster1221 :D

#NoEnv
#SingleInstance Force

; grabs all the values from inventory.ini
IniRead, Slot1, Settings.ini, Settings, Slot1, Default1
IniRead, Slot2, Settings.ini, Settings, Slot2, Default1
IniRead, Slot3, Settings.ini, Settings, Slot3, Default1
IniRead, Slot4, Settings.ini, Settings, Slot4, Default1
IniRead, Slot5, Settings.ini, Settings, Slot5, Default1
IniRead, Slot6, Settings.ini, Settings, Slot6, Default1
IniRead, Slot7, Settings.ini, Settings, Slot7, Default1
IniRead, Hotkey1, Settings.ini, Settings, Hotkey1, Default1
IniRead, Hotkey2, Settings.ini, Settings, Hotkey2, Default1
IniRead, Hotkey3, Settings.ini, Settings, Hotkey3, Default1
IniRead, Hotkey4, Settings.ini, Settings, Hotkey4, Default1
IniRead, Hotkey5, Settings.ini, Settings, Hotkey5, Default1
IniRead, Hotkey6, Settings.ini, Settings, Hotkey6, Default1
IniRead, Hotkey7, Settings.ini, Settings, Hotkey7, Default1
IniRead, Mouse, Settings.ini, Settings, Mouse, Defailt1

; makes the gui
Gui, Add, Text, x20 y0 w250 h20, Slot  |  Time (ms)  |  Hotkey  |  ^ = CTRL
Gui, Add, Text, x20 y25 w50 h20, Slot1:
Gui, Add, Edit, x50 y20 w50 h20 vSlot1, %Slot1%
Gui, Add, Text, x110 y25 w50 h20, Hotkey:
Gui, Add, Edit, x160 y20 w50 h20 vHotkey1, %Hotkey1%
Gui, Add, Text, x20 y50 w50 h20, Slot2:
Gui, Add, Edit, x50 y45 w50 h20 vSlot2, %Slot2%
Gui, Add, Text, x110 y50 w50 h20, Hotkey:
Gui, Add, Edit, x160 y45 w50 h20 vHotkey2, %Hotkey2%
Gui, Add, Text, x20 y75 w50 h20, Slot3:
Gui, Add, Edit, x50 y70 w50 h20 vSlot3, %Slot3%
Gui, Add, Text, x110 y75 w50 h20, Hotkey:
Gui, Add, Edit, x160 y70 w50 h20 vHotkey3, %Hotkey3%
Gui, Add, Text, x20 y100 w50 h20, Slot4:
Gui, Add, Edit, x50 y95 w50 h20 vSlot4, %Slot4%
Gui, Add, Text, x110 y100 w50 h20, Hotkey:
Gui, Add, Edit, x160 y95 w50 h20 vHotkey4, %Hotkey4%
Gui, Add, Text, x20 y125 w50 h20, Slot5:
Gui, Add, Edit, x50 y120 w50 h20 vSlot5, %Slot5%
Gui, Add, Text, x110 y125 w50 h20, Hotkey:
Gui, Add, Edit, x160 y120 w50 h20 vHotkey5, %Hotkey5%
Gui, Add, Text, x20 y150 w50 h20, Slot6:
Gui, Add, Edit, x50 y145 w50 h20 vSlot6, %Slot6%
Gui, Add, Text, x110 y150 w50 h20, Hotkey:
Gui, Add, Edit, x160 y145 w50 h20 vHotkey6, %Hotkey6%
Gui, Add, Text, x20 y175 w50 h20, Slot7:
Gui, Add, Edit, x50 y170 w50 h20 vSlot7, %Slot7%
Gui, Add, Text, x110 y175 w50 h20, Hotkey:
Gui, Add, Edit, x160 y170 w50 h20 vHotkey7, %Hotkey7%

Gui, Add, Button, x20 y200 w100 h30 gButtonClick, Save
Gui, Add, Text, x125 y200 W100 h30 , CTRL + Q to stop
Gui, Add, checkbox, x125 y213 w100 h20 vMouse checked%Mouse%, Hold Left Mouse
Gui +AlwaysOnTop
Gui, Show, w225 h235, Boosting Macro


ButtonClick: ; saves the Values to inventory.ini
    Gui, Submit, NoHide
    Saveinput(Slot1, "Slot1")
    Saveinput(Slot2, "Slot2")  
    Saveinput(Slot3, "Slot3")  
    Saveinput(Slot4, "Slot4")  
    Saveinput(Slot5, "Slot5")  
    Saveinput(Slot6, "Slot6")  
    Saveinput(Slot7, "Slot7") 
    Iniwrite, %Mouse%, Settings.ini, Settings, Mouse
return

Saveinput(val, Name) {
    if (val = "") ; if the value is left blank, set it to 0
        val := 0
    if  RegExMatch(val,"^\d+$") ; checks if value is an integer
        Iniwrite, %val%, Settings.ini, Settings, %Name%
    else
        MsgBox, 48, Invalid Value, %Name% must be an integer.
}

GuiClose:
    ExitApp
return

; Timer FUNNN!!!!
Timer1 := false
Timer2 := false
Timer3 := false
Timer4 := false
Timer5 := false
Timer6 := false
Timer7 := false
TimerMouse := False


^t::
    if TimerMouse {
        SetTimer, Mouse, Off
        TimerMouse := false
    } else {
        if (Slot1 != 0) {
            Click, Down
            SetTimer, Mouse, 10000 ; will click mouse every 10 seconds
            TimerMouse := true
        }
    }

    if Timer1 {
        SetTimer, Slot1, Off
        Timer1 := false
    } else {
        if (Slot1 != 0) {
            Send, 1
            SetTimer, Slot1, %Slot1%
            Timer1 := true
        }
    }
    if Timer2 {
        SetTimer, Slot2, Off
        Timer2 := false
    } else {
        if (Slot2 != 0) {
            Send, 2
            SetTimer, Slot2, %Slot2%
            Timer2 := true
        }
    }
    if Timer3 {
        SetTimer, Slot3, Off
        Timer3 := false
    } else {
        if (Slot3 != 0) {
            Send, 3
            SetTimer, Slot3, %Slot3%
            Timer3 := true
        }
    }
    if Timer4 {
        SetTimer, Slot4, Off
        Timer4 := false
    } else {
        if (Slot4 != 0) {
            Send, 4
            SetTimer, Slot4, %Slot4%
            Timer4 := true
        }
    }
    if Timer5 {
        SetTimer, Slot5, Off
        Timer5 := false
    } else {
        if (Slot5 != 0) {
            Send, 5
            SetTimer, Slot5, %Slot5%
            Timer5 := true
        }
    }
    if Timer6 {
        SetTimer, Slot6, Off
        Timer6 := false
    } else {
        if (Slot6 != 0) {
            Send, 6
            SetTimer, Slot6, %Slot6%
            Timer6 := true
        }
    }
    if Timer7 {
        SetTimer, Slot7, Off
        Timer7 := false
    } else {
        if (Slot7 != 0) {
            Send, 7
            SetTimer, Slot7, %Slot7%
            Timer7 := true
        }
    }
return

Mouse:
Click, Down
return

Slot1:
Send, 1
return

Slot2:
Send, 2
return

Slot3:
Send, 3
return

Slot4:
Send, 4
return

Slot5:
Send, 5
return

Slot6:
Send, 6
return

Slot7:
Send, 7
return

^q::
Reload
return
