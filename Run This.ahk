#Requires AutoHotkey v2.0

xGearShopPos := A_ScreenWidth - 40
yGearShopPos := A_ScreenHeight / 2 - 50

xEggShopPos := A_ScreenWidth - 40
yEggShopPos := A_ScreenHeight / 2 - 120

xEventShopPos := A_ScreenWidth - 40
yEventShopPos := A_ScreenHeight / 2 - 120

;Seed SHop
seedCheckboxes := []
MyGui := Gui("+AlwaysOnTop")
MyGui.Add("Text", "x10 y10", "Seed Shop")
yPos := 40
for item in ["Carrot","Strawberry","Blueberry","Orange Tulip","Tomato","Corn","Daffodil","Watermelon","Pumpkin","Apple","Bamboo","Coconut","Cactus","Dragon Fruit","Mango","Grape","Mushroom","Pepper","Cacao","Beanstalk","Ember Lily","Sugar Apple","Burning Bud","Giant Pinecone", "Elder Strawberry"] {
    ctrl := MyGui.Add("Checkbox", "x10 y" yPos, item)
    ctrl.Tag := item
    ctrl.Value := true
    seedCheckboxes.Push(ctrl)
    yPos += 25
}
;Gear Shop (to the right of Seed Shop)
gearCheckboxes := []
MyGui.Add("Text", "x200 y10", "Gear Shop")
yGearPos := 40
for gear in ["Watering Can","Trading Ticket","Trowel","Recall Wrench","Basic Sprinkler","Advanced Sprinkler","Medium Toy","Medium Treat","Godly Sprinkler","Magnifying Glass","Tanning Mirror","Master Sprinkler","Cleaning Spray","Favorite Tool","Harvest Tool","Friendship Pot","Grandmaster Sprinkler","Levelup Lollipop"] {
    ctrl := MyGui.Add("Checkbox", "x200 y" yGearPos, gear)
    ctrl.Tag := gear
    ctrl.Value := true
    gearCheckboxes.Push(ctrl)
    yGearPos += 25
}
eggsCheckboxes := []
MyGui.Add("Text", "x200 y490", "Egg Shop")
yeggPos := 510
for egg in ["Common Egg","Common Summer Egg","Rare Summer Egg","Mythical Egg","Paradise Egg","Bug Egg"] {
    ctrl := MyGui.Add("Checkbox", "x200 y" yeggPos, egg)
    ctrl.Tag := egg
    ctrl.Value := true
    eggsCheckboxes.Push(ctrl)
    yeggPos += 25
}

;EventCheckboxes := []
;MyGui.Add("Text", "x390 y10", "Zen Shop")
;yEventPos := 40
;for Event in ["Zen Seed Pack","Zen Egg","Hot Spring","Zen Sand","Tranquil Radar","Corrupt Radar","Zenflare","Zen Crate","Sakura Bush","Soft Sunshine","Koi","Zen Gnome Crate","Spiked Mango","Pet Shard Tranquil", "Pet Shard Corrupted", "Raiju"] {
;    ctrl := MyGui.Add("Checkbox", "x390 y" yEventPos, Event)
;    ctrl.Tag := Event
;    ctrl.Value := true
;    EventCheckboxes.Push(ctrl)
;    yEventPos += 25
;}

;auto reconnect
MyGui.Add("Text", "x10 y665", "Auto Reconnect" )
MyGui.Add("Checkbox", "x200 y665 " , "Auto Reconnect")

MyGui.Show()
MyGui.OnEvent("Close", (*) => ExitApp())
global recconnected := false

isAnyChecked(arr) {
    for ctrl in arr {
    if ctrl.Type = "Checkbox" && ctrl.Value
        return true
    }
    return false
}

^t::
{
    for ctrl in seedCheckboxes {
        if ctrl.Type = "Checkbox" {
            Send "{Up down}{Up up}"
        }
    }
}


^j::
    {
        global recconnected
        while true {
            Loop 30 {
            Send "{WheelUp}"
        }

        Sleep(1000)

        Loop 6 {
            Send "{WheelDown}"
            Sleep(100)
        }

        Send "\"
        Send "{Up}"
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

        ctrl := 0
        for ctrl in seedCheckboxes {
            if ctrl.Type = "Checkbox" && ctrl.Value {
                Send "{Down down}{Down up}"
                Send "{Enter}"
                Send "{Down down}{Down up}"
                Send "{Left down}{Left up}"
                Loop 30 {
                    Send "{Enter}"
                }
            } else if ctrl.Type = "Checkbox" {
                Send "{Down down}{Down up}"
                Send "{Enter}"
                Send "{Down down}{Down up}"
            }
        }

        Sleep(100)
        Send "{Up down}{Up up}"
        Send "{Enter}"
        Sleep(100)
        Send "{Enter}"

        for ctrl in seedCheckboxes {
            if ctrl.Type = "Checkbox" {
                Send "{Up down}{Up up}"
            }
        }

        Send "{Enter}"
        Sleep(100)
        Send "{Enter}"
        Sleep(670)

        Send "{Up down}{Up up}"
        Send "{Enter down}{Enter up}"
        Send "1"
        Sleep(250)
        Click

        Sleep(1000)

        Send "e"
        Sleep(2750)
        MouseMove xGearShopPos, yGearShopPos
        Sleep(100)

        MouseMove xGearShopPos-30, yGearShopPos
        Sleep(250)
        Click
        Sleep(3000)
        Send "\"
        Send "\"
        Send "{Up down}{Up up}"
        Send "{Up down}{Up up}"
        Send "{Up down}{Up up}"
        Sleep(100)
        ;gearshop add
        ctrl := 0
        index := 1
        for ctrl in gearCheckboxes {
            if ctrl.Type = "Checkbox" && ctrl.Value {
                if (index = 3) {
                    Send "{Down down}{Down up}"
                    Send "{Enter}"
                    Send "{Down down}{Down up}"
                } else {
                    Send "{Down down}{Down up}"
                    Send "{Enter}"
                    Send "{Down down}{Down up}"
                    Send "{Left down}{Left up}"
                }
                
                Loop 30 {
                    Send "{Enter}"
                }
            } else if ctrl.Type = "Checkbox" {
                Send "{Down down}{Down up}"
                Send "{Enter}"
                Send "{Down down}{Down up}"
            }
            index++
        }

        for ctrl in gearCheckboxes {
            if ctrl.Type = "Checkbox" {
                Send "{Up down}{Up up}"
            }
        }

        Send "{Enter}"
        Sleep(100)
        Send "{Enter}"
        Sleep(670)

        Send "{Up down}{Up up}"
        Send "{Enter down}{Enter up}"
        Send "\"

        if isAnyChecked(eggsCheckboxes) && recconnected = false {
            Sleep(1000)
            Send "{A down}"
            Sleep(750)
            Send "{A up}"
    
            Sleep(500)
    
            Send "e"
            Sleep(2750)
            MouseMove xEggShopPos, yEggShopPos
            Sleep(100)
    
            MouseMove xEggShopPos-30, yEggShopPos
            Sleep(250)
            Click
            Sleep(3000)
            Send "\"
            Send "{Up down}{Up up}"
            Send "{Up down}{Up up}"
            Send "{Up down}{Up up}"
            Send "{Up down}{Up up}"
            Send "{Up down}{Up up}"
            Sleep(100)
    
            ctrl := 0
            for ctrl in eggsCheckboxes {
                if ctrl.Type = "Checkbox" && ctrl.Value {
                    Send "{Down down}{Down up}"
                    Send "{Enter}"
                    Send "{Down down}{Down up}"
                    Send "{Down down}{Down up}"
                    Send "{Left down}{Left up}"
                    Loop 30 {
                        Send "{Enter}"
                    }
                } else if ctrl.Type = "Checkbox" {
                    Send "{Down down}{Down up}"
                    Send "{Enter}"
                    Send "{Down down}{Down up}"
                    Send "{Down down}{Down up}"
                }
            }
    
            for ctrl in eggsCheckboxes {
            if ctrl.Type = "Checkbox" {
                Send "{Up down}{Up up}"
                Send "{Up down}{Up up}"
            }
            }

            Send "{Down down}{Down up}"
            Send "{Enter}"
            Sleep(100)
            Send "{Enter}"
            Sleep(670)

            Send "{Up down}{Up up}"
            Send "{Up down}{Up up}"
            Send "{Down down}{Down up}"
            Send "{Right down}{Right up}"
            Send "{Enter down}{Enter up}"
            Send "\"
        }

        ;if isAnyChecked(EventCheckboxes) {
        ;    Send "\"
        ;    Send "{Down down}{Down up}"
        ;    Send "{Enter Down}{Enter Up}"
        ;    Sleep(1000)
        ;    Send "\"
        ;    Send "{W Down}"
        ;    Sleep(7000)
        ;    Send "{W Up}"
        ;    Sleep(100)
        ;    Send "{A down}"
        ;    Sleep(1000)
        ;    Send "{A up}"
        ;    Sleep(500)
        ;    Send "{W Down}"
        ;    Sleep(1000)
        ;    Send "{W Up}"
;
        ;    Send "e"
        ;    Sleep(2750)
        ;    MouseMove xEventShopPos, yEventShopPos
        ;    Sleep(100)
;
        ;    MouseMove xEventShopPos-30, yEventShopPos
        ;    Sleep(250)
        ;    Click
        ;    Sleep(100)
        ;    Sleep(3000)
        ;    Send "\"
        ;    Send "{Down down}{Down up}"
        ;    Sleep(100)
;
        ;    ctrl := 0
        ;    index := 1
        ;    for ctrl in EventCheckboxes {
        ;        if ctrl.Type = "Checkbox" && ctrl.Value && recconnected = false {
        ;            if (index = 1 || index = 2 || index = 8 || index = 12) {
        ;                Send "{Down down}{Down up}"
        ;                Send "{Enter}"
        ;                Send "{Down down}{Down up}"
        ;                Send "{Down down}{Down up}"
        ;            } else {
        ;                Send "{Down down}{Down up}"
        ;                Send "{Enter}"
        ;                Send "{Down down}{Down up}"
        ;            }
        ;            
        ;            Loop 30 {
        ;                Send "{Enter}"
        ;            }
        ;        } else if ctrl.Type = "Checkbox" {
        ;            if (index = 1 || index = 2 || index = 8 || index = 12) {
        ;                Send "{Down down}{Down up}"
        ;                Send "{Enter}"
        ;                Send "{Down down}{Down up}"
        ;                Send "{Down down}{Down up}"
        ;            } else {
        ;                Send "{Down down}{Down up}"
        ;                Send "{Enter}"
        ;                Send "{Down down}{Down up}"
        ;            }
        ;        }
        ;        index++
        ;    }
        ;    Send "\"
        ;    Sleep(250)
        ;    Send "\"
        ;    Send "{Enter}"
        ;    Sleep(100)
        ;    Send "{Enter}"
        ;    Sleep(670)
        ;    Send "{Right down}{Right up}"
        ;    Send "{Right down}{Right up}"
        ;    Send "{Right down}{Right up}"
        ;    Send "{Enter}"
        ;    Send "\"
        ;}

        Sleep(2000)
        Send "\"
        Send "{Up down}{Up up}"
        Send "{Right down}{Right up}"
        Send "{Enter}"
        Send "\"

        showCountdown(seconds) {
        static countdownGui := 0, countdownText := 0
        if !countdownGui {
            countdownGui := Gui("+AlwaysOnTop -Caption +ToolWindow")
            countdownText := countdownGui.Add("Text", "w80 h30 Center", "")
        }
        MouseGetPos &mx, &my
        countdownGui.Show("x" mx+20 " y" my+20 " NoActivate")
        Loop seconds {
            countdownText.Text := "Next loop in: " (seconds - A_Index + 1) "s"
            Sleep(1000)
        }
        countdownGui.Hide()
        }

        if (MyGui["Auto Reconnect"].Value)  {
            Color := PixelGetColor(A_ScreenWidth / 2, (A_ScreenHeight * 0.6111111111) -27)
            if (Color != 0x393b3d) {
                MouseMove A_ScreenWidth / 2+30, (A_ScreenHeight * 0.6111111111) -27
                Sleep(500)
                MouseMove A_ScreenWidth / 2+60, (A_ScreenHeight * 0.6111111111) -27
                Click
                Sleep(18000)
                Click
                global recconnected
                recconnected := true
            }
        }
        MouseMove A_ScreenWidth / 2, A_ScreenHeight / 2
        showCountdown(300)
    }
}

^h::
{
    ExitApp
}