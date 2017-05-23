; # - winkey
; + - shift
; ^ - ctrl
; ! - alt
#SingleInstance

#MaxHotkeysPerInterval 200

IsFullscreen() {
    Static
    Local iMidX, iMidY, iMonitor

    ErrorLevel := false

     WinGet, hWin, ID, A

    ;Make sure it's not desktop
    WinGetClass, c, ahk_id %hWin%
    If (hWin = DllCall("GetDesktopWindow") Or (c = "Progman") Or (c = "WorkerW"))
        return false

    WinGetPos, upperleft_x, upperleft_y, width, height, ahk_id %hWin%

    If bRefreshRes Or Not Mon0 {
        SysGet, Mon0, MonitorCount
        SysGet, iPrimaryMon, MonitorPrimary
        Loop %Mon0% { ;Loop through each monitor
            SysGet, Mon%A_Index%, Monitor, %A_Index%
/*
            MsgBox, Left: %Mon2Left% -- Top: %Mon2Top% -- Right: %Mon2Right% -- Bottom %Mon2Bottom%
  */
            Mon%A_Index%MidX := Mon%A_Index%Left + Ceil((Mon%A_Index%Right - Mon%A_Index%Left) / 2)
            Mon%A_Index%MidY := Mon%A_Index%Top + Ceil((Mon%A_Index%Top - Mon%A_Index%Bottom) / 2)

            If (( upperleft_x <= Mon%A_Index%Left ) And ( width >= 1920 ) And ( height >= 1200 )) {
                return true
            }
        }
    }
    return false
}

If ( !IsFullscreen ) {

	;
	; following section mimics command-q and command-w
	; behaviour to close windows
	; note these had to be disabled below for the
	; command to ctrl key remaps
	;
	;!w::^F4
	!q::!F4

	;
	; following section remaps command key to control key
	; affects all number and letter keys
	; note that some keys, like winkey-l and winkey-d
	; need to be remapped a differeny way
	; otherwise autohotkey will not take over
	;
	!a::Send {LCtrl down}{a}{LCtrl up}
	!c::Send {LCtrl down}{c}{LCtrl up}
	!v::Send {LCtrl down}{v}{LCtrl up}

	!b::Send {LCtrl down}{b}{LCtrl up}
	!d::Send {LCtrl down}{d}{LCtrl up}
	!e::Send {LCtrl down}{e}{LCtrl up}

	;following won't remap using the normal method
	!f::Send {LCtrl down}{f}{LCtrl up}
	!g::Send {LCtrl down}{g}{LCtrl up}
	!h::Send {LCtrl down}{h}{LCtrl up}
	!i::Send {LCtrl down}{i}{LCtrl up}
	!j::Send {LCtrl down}{j}{LCtrl up}
	!k::Send {LCtrl down}{k}{LCtrl up}

	!l::Send {LCtrl down}{l}{LCtrl up}
	!m::Send {LCtrl down}{m}{LCtrl up}
	!n::Send {LCtrl down}{n}{LCtrl up}
	!o::Send {LCtrl down}{o}{LCtrl up}
	!p::Send {LCtrl down}{p}{LCtrl up}

	;!q::^q ;disabled --remapped to alt-F4 instead
	!r::Send {LCtrl down}{r}{LCtrl up}
	!s::Send {LCtrl down}{s}{LCtrl up}
	!t::Send {LCtrl down}{t}{LCtrl up}
	!u::Send {LCtrl down}{u}{LCtrl up}

	!w::Send {LCtrl down}{w}{LCtrl up}
	!x::Send {LCtrl down}{x}{LCtrl up}
	!y::Send {LCtrl down}{y}{LCtrl up}
	!z::Send {LCtrl down}{z}{LCtrl up}
	!1::Send {LCtrl down}{1}{LCtrl up}
	!2::Send {LCtrl down}{2}{LCtrl up}
	!3::Send {LCtrl down}{3}{LCtrl up}
	!4::Send {LCtrl down}{4}{LCtrl up}
	!5::Send {LCtrl down}{5}{LCtrl up}
	!6::Send {LCtrl down}{6}{LCtrl up}
	!7::Send {LCtrl down}{7}{LCtrl up}
	!8::Send {LCtrl down}{8}{LCtrl up}
	!9::Send {LCtrl down}{9}{LCtrl up}
	!0::Send {LCtrl down}{0}{LCtrl up}

	LAlt & Space::Send {LWinDown}{LWinUp}

	;
	; Cursor keys for text selection
	;

	!Left::Send {Home}
	!Right::Send {End}
	!+Left::Send {Lshift down}{Home}{Lshift up}
	!+Right::Send {Lshift down}{End}{Lshift up}

	!Up::Send {Lctrl down}{Home}{Lctrl up}
	!Down::Send {Lctrl down}{End}{Lctrl up}

	#Left::Send {Lctrl down}{Left}{Lctrl up}
	#Right::Send {Lctrl down}{Right}{Lctrl up}
	#+Left::Send {Lshift down}{Lctrl down}{Left}{Lctrl up}{Lshift up}
	#+Right::Send {Lshift down}{Lctrl down}{Right}{Lctrl up}{Lshift up}

	#Up::Send {Lctrl down}{Up}{Lctrl up}
	#Down::Send {Lctrl down}{Down}{Lctrl up}

}