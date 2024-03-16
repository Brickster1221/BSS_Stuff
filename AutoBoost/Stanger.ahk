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
Gui, Add, Button, x210 y0 w12 h15 gHelpButton, ?
Gui, Add, Text, x20 y25 w50 h20, Slot1:
Gui, Add, Edit, x50 y20 w50 h20 vSlot1, %Slot1%
Gui, Add, Text, x110 y25 w50 h20, Hotkey1:
Gui, Add, Edit, x160 y20 w50 h20 vHotkey1, %Hotkey1%
Gui, Add, Text, x20 y50 w50 h20, Slot2:
Gui, Add, Edit, x50 y45 w50 h20 vSlot2, %Slot2%
Gui, Add, Text, x110 y50 w50 h20, Hotkey2:
Gui, Add, Edit, x160 y45 w50 h20 vHotkey2, %Hotkey2%
Gui, Add, Text, x20 y75 w50 h20, Slot3:
Gui, Add, Edit, x50 y70 w50 h20 vSlot3, %Slot3%
Gui, Add, Text, x110 y75 w50 h20, Hotkey3:
Gui, Add, Edit, x160 y70 w50 h20 vHotkey3, %Hotkey3%
Gui, Add, Text, x20 y100 w50 h20, Slot4:
Gui, Add, Edit, x50 y95 w50 h20 vSlot4, %Slot4%
Gui, Add, Text, x110 y100 w50 h20, Hotkey4:
Gui, Add, Edit, x160 y95 w50 h20 vHotkey4, %Hotkey4%
Gui, Add, Text, x20 y125 w50 h20, Slot5:
Gui, Add, Edit, x50 y120 w50 h20 vSlot5, %Slot5%
Gui, Add, Text, x110 y125 w50 h20, Hotkey5:
Gui, Add, Edit, x160 y120 w50 h20 vHotkey5, %Hotkey5%
Gui, Add, Text, x20 y150 w50 h20, Slot6:
Gui, Add, Edit, x50 y145 w50 h20 vSlot6, %Slot6%
Gui, Add, Text, x110 y150 w50 h20, Hotkey6:
Gui, Add, Edit, x160 y145 w50 h20 vHotkey6, %Hotkey6%
Gui, Add, Text, x20 y175 w50 h20, Slot7:
Gui, Add, Edit, x50 y170 w50 h20 vSlot7, %Slot7%
Gui, Add, Text, x110 y175 w50 h20, Hotkey7:
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

HelpButton:
    MsgBox, 0x40000, Information, Timers are a toggle, meaning once you press a hotkey for a certain slot, it will keep repeating that slot with a delay of the number you set, up until you press they keybind again.`n`nSimple Hotkey Symbols`n# = Windows key`n! = Alt key`n^ = Ctrl key`n+ = Shift key  
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
Running1 := false
Running2 := false
Running3 := false
Running4 := false
Running5 := false
Running6 := false
Running7 := false
RunningMouse := False


^t::  ;base keybind, all functions are toggled timers, meaning once you press it, it will repeat forever, then stop once pressed again
    TimMouse(Mouse) ; Hold Left Mouse check

    TimFunc1(Slot1)
    TimFunc2(Slot2)
    TimFunc3(Slot3)

    TimFunc5(Slot5)
    TimFunc6(Slot6)
    TimFunc7(Slot7)
return

^g::
    TimFunc4(Slot4)
return


TimMouse(Mouse) {
    if RunningMouse {
        SetTimer, Mouse, Off
        RunningMouse := false
    } else {
        if (Mouse) {
            MsgBox, Click
            Click, Down
            SetTimer, Mouse, 1000 ; will click mouse every 5 seconds
            RunningMouse := true
        }
    }
}

TimFunc1(Slot1) {
    if Running1 {
        SetTimer, Timer1, Off
        Running1 := false
    } else {
        if (Slot1 != 0) {
            Send, 1
            SetTimer, Timer1, %Slot1%
            Running1 := true
        }
    }
}

TimFunc2(Slot2) {
    if Running2 {
        SetTimer, Timer2, Off
        Running2 := false
    } else {
        if (Slot2 != 0) {
            Send, 2
            SetTimer, Timer2, %Slot2%
            Running2 := true
        }
    }
}

TimFunc3(Slot3) {
    if Running3 {
        SetTimer, Timer3, Off
        Running3 := false
    } else {
        if (Slot3 != 0) {
            Send, 3
            SetTimer, Timer3, %Slot3%
            Running3 := true
        }
    }
}

TimFunc4(Slot4) {
    if Running4 {
        SetTimer, Timer4, Off
        Running4 := false
    } else {
        if (Slot4 != 0) {
            Send, 4
            SetTimer, Timer4, %Slot4%
            Running4 := true
        }
    }
}

TimFunc5(Slot5) {
    if Running5 {
        SetTimer, Timer5, Off
        Running5 := false
    } else {
        if (Slot5 != 0) {
            Send, 5
            SetTimer, Timer5, %Slot5%
            Running5 := true
        }
    }
}

TimFunc6(Slot6) {
    if Running6 {
        SetTimer, Timer6, Off
        Running6 := false
    } else {
        if (Slot6 != 0) {
            Send, 6
            SetTimer, Timer6, %Slot6%
            Running6 := true
        }
    }
}

TimFunc7(Slot7) {
    if Running7 {
        SetTimer, Timer7, Off
        Running7 := false
    } else {
        if (Slot7 != 0) {
            Send, 7
            SetTimer, Timer7, %Slot7%
            Running7 := true
        }
    }
}


Mouse:
Click, Down
return

Timer1:
Send, 1
return

Timer2:
Send, 2
return

Timer3:
Send, 3
return

Timer4:
Send, 4
return

Timer5:
Send, 5
return

Timer6:
Send, 6
return

Timer7:
Send, 7
return

^q::
Reload
return
