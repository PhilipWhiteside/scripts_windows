; ======================================= Outlook to Moo.do ====================================== 
; There is no integration between these two applications
; The goal is to automate the input of Outlook emails to actions in Moo.do
; Outlook does not support linking in, so Email Subject will be used as reference
; 
; ---------------------------------------------------------------------------------------- AHK ENV
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
; SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#NoTrayIcon


; --------------------------------------------------------------------------------------- TRIGGERS
#IfWinActive, ahk_exe OUTLOOK.EXE                                             ;Run only in Outlook 

^!1::
    ; Copy email info
    Clipboard = 
    SendInput, ^c 
    ClipWait 
    
    ; Remove common heading titles
    result := Clipboard
    result := RegExReplace(result, "Subject\t")
    result := RegExReplace(result, "From\t")
    result := RegExReplace(result, "Received\t")
    result := RegExReplace(result, "Categories\t")

    ; Move columns into new lines
    result := RegExReplace(result, "\t", "`r")

    ; Add result to clipboard
    Clipboard = 
    Clipboard = %result% 
    ClipWait 

    ; Add to Moo.do
    winactivate Moo.do              ;Switch to Moo.do window
    Send !n                         ;Add new item
    
    ; Select location
    Send {tab}
    Send Email Inbox                ;Select location
    Sleep 100                       ;Delay for Moo.do reactivity
    Send {enter}                    ;Select location

    ; Fill notes field with email info
    Send {tab}
    Send ^v 
    Sleep 100

    ; Step back to Task title
    Send +{tab}
    Send +{tab}

return

