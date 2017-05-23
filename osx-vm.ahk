#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force
#Persistent
DetectHiddenWindows, On

IfWinNotExist, OSX - VMware Workstation 12 Player
{  
	Run D:\Virtual Machines\OSX\OSX.vmx,, max
	SetTimer, ProcessCheckTimer, 5000
	Return
} else {
	SetTimer, ProcessCheckTimer, 5000
	Return
}
Return

ProcessCheckTimer:
IfWinNotExist, OSX - VMware Workstation 12 Player
{  
   ExitApp
}
Return

#IfWinExist, ahk_class VMPlayerFrame
	; --------------------------------------------------------------
	; OS X system shortcuts
	; --------------------------------------------------------------

	; Make Ctrl + S work with cmd (windows) key
	$!s::
	ControlGet, Hwnd, Hwnd,, xui::TForm4, OSX - VMware Workstation 12 Player
	If Not DllCall("IsWindowVisible", UInt, hwnd ) {
		Send {Ctrl Down}{s}{Ctrl Up}
	}
	Return
	$!+s::
	ControlGet, Hwnd, Hwnd,, xui::TForm4, OSX - VMware Workstation 12 Player
	If Not DllCall("IsWindowVisible", UInt, hwnd ) {
		Send {Ctrl Down}{LShift Down}{s}{LShift Up}{Ctrl Up}
	}
	Return

	; Selecting
	$!a::
	ControlGet, Hwnd, Hwnd,, xui::TForm4, OSX - VMware Workstation 12 Player
	If Not DllCall("IsWindowVisible", UInt, hwnd ) {
		Send {Ctrl Down}{a}{Ctrl Up}
	}
	Return

	; Copying
	$!c::
	ControlGet, Hwnd, Hwnd,, xui::TForm4, OSX - VMware Workstation 12 Player
	If Not DllCall("IsWindowVisible", UInt, hwnd ) {
		Send {Ctrl Down}{c}{Ctrl Up}
	}
	Return

	; Pasting
	$!v::
	ControlGet, Hwnd, Hwnd,, xui::TForm4, OSX - VMware Workstation 12 Player
	If Not DllCall("IsWindowVisible", UInt, hwnd ) {
		Send {Ctrl Down}{v}{Ctrl Up}
	}
	Return

	; Cutting
	$!x::
	ControlGet, Hwnd, Hwnd,, xui::TForm4, OSX - VMware Workstation 12 Player
	If Not DllCall("IsWindowVisible", UInt, hwnd ) {
		Send {Ctrl Down}{x}{Ctrl Up}
	}
	Return

	; Finding
	$!f::
	ControlGet, Hwnd, Hwnd,, xui::TForm4, OSX - VMware Workstation 12 Player
	If Not DllCall("IsWindowVisible", UInt, hwnd ) {
		Send ^f
	}
	Return
	$!+f::
	ControlGet, Hwnd, Hwnd,, xui::TForm4, OSX - VMware Workstation 12 Player
	If Not DllCall("IsWindowVisible", UInt, hwnd ) {
		Send {Ctrl Down}{LShift Down}{f}{LShift Up}{Ctrl Up}
	}
	Return

	; Undo
	$!z::
	ControlGet, Hwnd, Hwnd,, xui::TForm4, OSX - VMware Workstation 12 Player
	If Not DllCall("IsWindowVisible", UInt, hwnd ) {
		Send {Ctrl Down}{z}{Ctrl Up}
	}
	Return

	; Redo
	$!y::
	ControlGet, Hwnd, Hwnd,, xui::TForm4, OSX - VMware Workstation 12 Player
	If Not DllCall("IsWindowVisible", UInt, hwnd ) {
		Send {Ctrl Down}{y}{Ctrl Up}
	}
	Return
	$!+z::
	ControlGet, Hwnd, Hwnd,, xui::TForm4, OSX - VMware Workstation 12 Player
	If Not DllCall("IsWindowVisible", UInt, hwnd ) {
		Send {Ctrl Down}{LShift Down}{z}{LShift Up}{Ctrl Up}
	}
	Return


	; New window
	$!n::
	ControlGet, Hwnd, Hwnd,, xui::TForm4, OSX - VMware Workstation 12 Player
	If Not DllCall("IsWindowVisible", UInt, hwnd ) {
		Send {Ctrl Down}{n}{Ctrl Up}
	}
	Return

	; New Incognito window
	$!+n::
	ControlGet, Hwnd, Hwnd,, xui::TForm4, OSX - VMware Workstation 12 Player
	If Not DllCall("IsWindowVisible", UInt, hwnd ) {
		Send {Ctrl Down}{LShift Down}{n}{LShift Up}{Ctrl Up}
	}
	Return

	; New tab
	$!t::
	ControlGet, Hwnd, Hwnd,, xui::TForm4, OSX - VMware Workstation 12 Player
	If Not DllCall("IsWindowVisible", UInt, hwnd ) {
		Send {Ctrl Down}{t}{Ctrl Up}
	}
	Return

	; close tab
	$!w::
	ControlGet, Hwnd, Hwnd,, xui::TForm4, OSX - VMware Workstation 12 Player
	If Not DllCall("IsWindowVisible", UInt, hwnd ) {
		Send {Ctrl Down}{w}{Ctrl Up}
	}
	Return

	; refresh tab
	$*!r::
	ControlGet, Hwnd, Hwnd,, xui::TForm4, OSX - VMware Workstation 12 Player
	If Not DllCall("IsWindowVisible", UInt, hwnd ) {
		Send {Ctrl Down}{r}{Ctrl Up}
	}
	Return

	; Close windows (cmd + q to Alt + F4)
	$!q::
	ControlGet, Hwnd, Hwnd,, xui::TForm4, OSX - VMware Workstation 12 Player
	If Not DllCall("IsWindowVisible", UInt, hwnd ) {
		Send !{F4}
	}
	Return
#IfWinExist

#IfWinActive, OSX - VMware Workstation 12 Player
	XButton1::
	Send, {Alt down}{[}{Alt up}
	Return
	XButton2::
	Send, {Alt down}{]}{Alt up}
	Return
#IfWinActive