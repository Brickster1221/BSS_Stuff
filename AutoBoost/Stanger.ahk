; By brickster1221 :D

#NoEnv
#SingleInstance Force

HotkeyAction := {}
; grabs all the values from inventory.ini
Loop, 7 {
    IniRead, Slot%A_Index%, Settings.ini, Settings, Slot%A_Index%, 0
    IniRead, HK, Settings.ini, Settings, Hotkey%A_Index%, %A_Space%

    HK := Trim(HK)
    if !HK
        continue

    if !HotkeyAction.HasKey(HK)
        HotkeyAction[HK] := []
    HotkeyAction[HK].Push(A_Index)
    Hotkey%A_Index% := HK
}

for combo, actions in HotkeyAction
    Hotkey, %combo%, HandleHotkey

IniRead, Mouse, Settings.ini, Settings, Mouse, 1

; makes the GUI
Gui, Add, Text, x10 y0 w250 h20, Slot  |  Time (ms)  |  Hotkey  |  ^ = CTRL
Gui, Add, Button, x200 y0 w12 h15 gHelpButton, ?
Loop, 7 {
    yPos := 20 + (A_Index - 1) * 25
    Gui, Add, Text, x10 y%yPos% w50 h20, Slot%A_Index%:
    Gui, Add, Edit, x40 y%yPos% w50 h20 vSlot%A_Index%, % Slot%A_Index%
    Gui, Add, Text, x100 y%yPos% w50 h20, Hotkey%A_Index%:
    Gui, Add, Edit, x150 y%yPos% w50 h20 vHotkey%A_Index%, % Hotkey%A_Index%
}

Gui, Add, Button, x10 y200 w100 h30 gButtonClick, Save
Gui, Add, Text, x115 y200 W100 h30 , CTRL + Q to stop
Gui, Add, Checkbox, x115 y213 w100 h20 vMouse checked%Mouse%, Hold Left Mouse
Gui +AlwaysOnTop
Gui, Show, w215 h235, Boosting Macro


ButtonClick:
    Gui, Submit, NoHide
    Loop, 7 {
        IniWrite, % Slot%A_Index%, Settings.ini, Settings, Slot%A_Index%
        IniWrite, % Hotkey%A_Index%, Settings.ini, Settings, Hotkey%A_Index%
    }
    IniWrite, %Mouse%, Settings.ini, Settings, Mouse
return

HelpButton:
    MsgBox, 0x40000, Information, Timers are a toggle, meaning once you press a hotkey for a certain slot, it will keep repeating that slot with a delay of the number you set, up until you press they keybind again.`n`nSimple Hotkey Symbols`n# = Windows key`n! = Alt key`n^ = Ctrl key`n+ = Shift key`n`nMade by brickster1221  
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
Loop, 7 {
    Running%A_Index% := false
}
RunningMouse := False

HandleHotkey:
CurHotkey := A_ThisHotkey
for _, action in HotkeyAction[CurHotkey]
    ToggleTimer(action)
Return

TimMouse(Mouse) {
    if RunningMouse {
        SetTimer, Mouse, Off
        RunningMouse := false
    } else {
        if (Mouse) {
            Click, Down
            SetTimer, Mouse, 5000 ; will click mouse every 5 seconds
            RunningMouse := true
        }
    }
}

ToggleTimer(index) {
    global
    Slot := Slot%index%
    Running := Running%index%

    if (Running) {
        SetTimer, % "Timer" . index, Off
        Running%index% := false
    } else {
        if (Slot != 0) {
            Send, %index%
            SetTimer, % "Timer" . index, %Slot%
            Running%index% := true
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
