; by brickster1221 :D
; To start, face the wall PERPINDICULAR to the portal/stairs (face the sprout timer thing)


; im going to murder someone if another one of these variables dont work         reps := 2 ; how much the pattern repeats before resetting its location on the field
; uh theres a big webhook url, change it to urs (couldnt find out how to set with a variable), if u find out tell me :D
; not working for whatever reason              RecconnectDelay := 10000 ; how long it takes your roblox to load (ms)


; ⚠⚠⚠⚠⚠⚠      oh and also make sure your logged into google for the auto reconnect to work    ⚠⚠⚠⚠⚠⚠

Send_Msg_to_Discord("Macro Opened")
MsgBox, Press CTRL + S to start, CTRL + P to pause, CTRL + Q to stop

MainLoop() {
   if (success := DiscconectCheck() = 1) {
      GoToHub()
   }
   Send_Msg_to_Discord("Playing Pattern")
   Send, {shift}
   Loop {
      if Mod(A_Index, 50) = 0 || A_Index = 1 {
         DriftComp()
      }
      ;Main pattern
      if (success := DiscconectCheck() =1) {
         GoToHub()
      }
      Click, down
      Lines()
   }
}

DriftComp() {
   ;Field drift comp (Yes, you can drift without haste) 
   Send, {w down}
   sleep, 3000
   Send, {a down}
   sleep, 2500
   Send, {a up}{w down}
   sleep, 1500
   Send, {w up}{s down}
   Sleep, 3000
   Send, {d down}
   sleep, 750
   Send, {s up}{d up}
}

Square() {
   Send, {w down}
   sleep, 1000
   Send, {w up}
   Send, {d down}
   sleep, 1000
   Send, {d up}
   Send, {s down}
   sleep, 1000
   Send, {s up}
   Send, {a down}
   sleep, 1000
   Send, {a up}
}
Lines() {
   ; →↓→↓
   ; ||||
   ; ||||
   ; ↑→↑→
   Send, {w down}
   sleep, 2000
   Send, {d down}{w up}
   sleep, 500
   Send, {s down}{d up}
   sleep, 2000
   Send, {d down}{s up}
   sleep, 500
   Send, {w down}{d up}
   sleep, 2000
   Send, {d down}{w up}
   sleep, 500
   Send, {s down}{d up}
   sleep, 2000
   ;Send, {d down}{s up}
   ;sleep, 500 
   ;Send, {w down}{d up} 
   ;sleep, 2000
   ; left cycle
   ;Send, {a down}{w up}
   ;sleep, 500
   ;Send, {s down}{a up}
   ;sleep, 2000
   Send, {a down}{s up}
   sleep, 500
   Send, {w down}{a up}
   sleep, 2000
   Send, {a down}{w up}
   sleep, 500
   Send, {s down}{a up}
   sleep, 2000
   Send, {a down}{s up}
   sleep, 500
   Send, {a up} 
}

GoToHub() {
   Send, {w down}
   sleep, 5000
   Send, {w up}{s down}
   Sleep, 100
   Send, {s up}{a down}
   Sleep, 6000
   Send, {w down}
   Sleep, 2000
   Send, {a up}{w up}{d down}
   Sleep, 500
   Send, {d up}{space down}{w down}{space up}
   Sleep, 3000
   Send, {d down}
   Sleep, 4000
   Send, {d up}{w up}{a down}{s down}
   Sleep, 550
   Send, {a up}{s up}{w down}
   Sleep, 5000
   Send, {w up}{a down}
   Sleep, 4000
   Send, {w down}
   Sleep, 1000
   Send, {a up}{d down}
   Sleep, 5500
   Send, {w up}{d up}{s down}{a down}
   Sleep, 9000
   Send, {s up}{w down}
   Sleep, 3000
   Send, {a up}
   Sleep, 1000
   Send, {w up}{d down}{s down}
   Sleep, 1500
   Send, {d up}{s up}{w down}
   Sleep, 5000
   Send, {w up}
   Sleep, 10000
   Send, {w down}
   Sleep, 6000
   Send, {w up},,ooo
   MainLoop()
}

DiscconectCheck() {
   Loop {
      if !WinExist("Roblox") {
         Send_Msg_to_Discord("Roblox disconnected, Reconnecting")
         Run, chrome.exe "https://www.roblox.com/games/1537690962/Bee-Swarm-Simulator?privateServerLinkCode=" ; Replace this with your own private server
         Sleep, 2000
      }
      else {
         return false
      }
      ;loop just incase roblox doesnt wanna load
      Loop, 180 {
         if WinExist("Roblox") {
            break 2
         }
         if (A_Index = 120) {
            break
         }
         Sleep, 2000
      }
      if (A_Index = 10) {
         Send_Msg_to_Discord("ERROR, Roblox couldnt reconnect, please manually find out what tf is going on")
         break
      }
   }
   Send_Msg_to_Discord("Roblox open")
   Sleep, 20000 ; makes it wait for roblox to load, i would add the timer thing but i'd have to add more files for that and me no want to do that
   WinActivate, chrome.exe
   Send, ^{w}
   return true
}

; webhook stuff
Send_Msg_to_Discord(msg, url="https://discord.com/api/webhooks/") { ;Replace this with your own webhook
   
   EncodedMsg := JsonReady(msg)
   
   postdata=
   (
   {
      "content": "%EncodedMsg%"
   }
   ) ;Use https://leovoel.github.io/embed-visualizer/ to generate above webhook code

   WebRequest := ComObjCreate("WinHttp.WinHttpRequest.5.1")
   WebRequest.Open("POST", url, false)
   WebRequest.SetRequestHeader("Content-Type", "application/json")
   WebRequest.Send(postdata)  
}


JsonReady(msg) {
q="
dq=
(
\"
)
    msg := StrReplace(msg, q, dq) ; Replace double quote with \"
    msg := StrReplace(msg, "/", "\\/") ; Replace slash with \/
    msg := StrReplace(msg, "`n", "\n") ; Replace newline with \n
    msg := StrReplace(msg, "`r", "\r") ; Replace carriage return with \r
    msg := StrReplace(msg, "`t", "\t") ; Replace horizontal tab with \t
    msg := StrReplace(msg, "`b", "\b") ; Replace backspace with \b
    msg := StrReplace(msg, "`f", "\f") ; Replace form feed with \f
    return % msg
}


^s::
Send_Msg_to_Discord("Starting Macro")
MainLoop()
Return

^t:: ;test keybind (you can remove it changes nothing)
MainLoop()
Return

Paused := false
^p::
Send, {a up}{w up}{d up}{s up}
Paused := !Paused
Pause,, 1
if (Paused) 
   Send_Msg_to_Discord("Macro Paused")
else
   Send_Msg_to_Discord("Macro Resumed")
Return

^q::
Send, {a up}{w up}{d up}{s up}
Send_Msg_to_Discord("Macro Stopped")
ExitApp
Return
