#Requires AutoHotkey v2.0

xGearShopPos := A_ScreenWidth * (900 / 1440)
yGearShopPos := A_ScreenHeight * (427 / 900)

^t::
{
    Loop 30 {
        Send "{WheelUp}"
    }

    Sleep(1000)

    Loop 10 {
        Send "{WheelDown}"
        Sleep(100)
    }
    ;MsgBox xGearShopPos, yGearShopPos
    Click xGearShopPos, yGearShopPos

    MouseGetPos &x, &y
    MsgBox "Mouse position: " x ", " y
}

^j::
{
    Loop 30 {
        Send "{WheelUp}"
    }

    Sleep(1000)

    Loop 10 {
        Send "{WheelDown}"
        Sleep(100)
    }

    Send "\"
    Send "{Right down}{Right up}"
    Send "{Right down}{Right up}"
    Send "{Right down}{Right up}"
    Sleep(1000)
    Send "{Enter}"
    Send "{Enter}"
    Send "{Enter}"
    Send "{Enter}"
    Send "{Enter}"
    Sleep(670)

    ;shop
    Send "e"
    Sleep(2500)

    buyItem(amountOfItems){
        Loop amountOfItems {
            Send "{Down down}{Down up}"
            Send "{Enter}"
            Send "{Down down}{Down up}"

            Loop 30 {
                Send "{Enter}"
            }
        }
    }
    buyItem(24)
    Send "\"
    Sleep(250)
    Send "\"
    Send "{Enter}"
    Sleep(100)
    Send "{Enter}"
    Sleep(670)

    Send "{Up down}{Up up}"
    Send "{Enter down}{Enter up}"
    Send "2"
    Sleep(250)
    Click

    Sleep(500)

    Send "e"
    Sleep(2750)
    MouseMove xGearShopPos, yGearShopPos
    Sleep(100)
    
    MouseMove xGearShopPos+30, yGearShopPos
    Sleep(250)
    Click
    Sleep(100)
    Sleep(3000)
    Send "\"
    Send "\"
    Send "{Down down}{Down up}"
    Sleep(100)
    buyItem(16)
    Send "\"
    Sleep(250)
    Send "\"
    Send "{Enter}"
    Sleep(100)
    Send "{Enter}"
    Sleep(670)
    Send "{Up down}{Up up}"
    Send "{Enter}"
}

^h::
{
    ExitApp
}