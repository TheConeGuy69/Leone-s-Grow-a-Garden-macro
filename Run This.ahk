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
for item in ["Carrot","Strawberry","Blueberry","Orange Tulip","Tomato","Corn","Daffodil","Watermelon","Pumpkin","Apple","Bamboo","Coconut","Cactus","Dragon Fruit","Mango","Grape","Mushroom","Pepper","Cacao","Beanstalk","Ember Lily","Sugar Apple","Burning Bud","Giant Pinecone"] {
    ctrl := MyGui.Add("Checkbox", "x10 y" yPos, item)
    ctrl.Tag := item
    seedCheckboxes.Push(ctrl)
    yPos += 25
}
;Gear Shop (to the right of Seed Shop)
gearCheckboxes := []
MyGui.Add("Text", "x200 y10", "Gear Shop")
yGearPos := 40
for gear in ["Watering Can","Trowel","Recall Wrench","Basic Sprinkler","Advanced Sprinkler","Medium Toy","Medium Treat","Godly Sprinkler","Magnifying Glass","Tanning Mirror","Master Sprinkler","Cleaning Spray","Favorite Tool","Harvest Tool","Friendship Pot","Levelup Lollipop"] {
    ctrl := MyGui.Add("Checkbox", "x200 y" yGearPos, gear)
    ctrl.Tag := gear
    gearCheckboxes.Push(ctrl)
    yGearPos += 25
}
eggsCheckboxes := []
MyGui.Add("Text", "x200 y440", "Egg Shop")
yeggPos := 470
for egg in ["Common Egg","Common Summer Egg","Rare Summer Egg","Mythical Egg","Paradise Egg","Bug Egg"] {
    ctrl := MyGui.Add("Checkbox", "x200 y" yeggPos, egg)
    ctrl.Tag := egg
    eggsCheckboxes.Push(ctrl)
    yeggPos += 25
}

EventCheckboxes := []
MyGui.Add("Text", "x390 y10", "Zen Shop")
yEventPos := 40
for Event in ["Zen Seed Pack","Zen Egg","Hot Spring","Zen Sand","Tranquil Radar","Zenflare","Zen Crate","Soft Sunshine","Koi","Zen Gnome Crate","Spiked Mango","Pet Shard Tranquil"] {
    ctrl := MyGui.Add("Checkbox", "x390 y" yEventPos, Event)
    ctrl.Tag := Event
    EventCheckboxes.Push(ctrl)
    yEventPos += 25
}

MyGui.Show()
MyGui.OnEvent("Close", (*) => ExitApp())

^t::
{
    Loop 30 {
        Send "{WheelUp}"
    }

    Sleep(1000)

    Loop 6 {
        Send "{WheelDown}"
        Sleep(100)
    }

    
}

^j::
    {
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

        ctrl := 0
        for ctrl in seedCheckboxes {
            if ctrl.Type = "Checkbox" && ctrl.Value {
                Send "{Down down}{Down up}"
                Send "{Enter}"
                Send "{Down down}{Down up}"
                Loop 30 {
                    Send "{Enter}"
                }
            } else if ctrl.Type = "Checkbox" {
                Send "{Down down}{Down up}"
                Send "{Enter}"
                Send "{Down down}{Down up}"
            }
        }

        Send "\"
        Sleep(250)
        Send "\"
        Send "{Enter}"
        Sleep(100)
        Send "{Enter}"
        Sleep(670)

        Send "{Up down}{Up up}"
        Send "{Enter down}{Enter up}"
        Send "1"
        Sleep(250)
        Click

        Sleep(500)

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
        Send "{Down down}{Down up}"
        Sleep(100)
        ;gearshop add
        ctrl := 0
        for ctrl in gearCheckboxes {
            if ctrl.Type = "Checkbox" && ctrl.Value {
                Send "{Down down}{Down up}"
                Send "{Enter}"
                Send "{Down down}{Down up}"
                Loop 30 {
                    Send "{Enter}"
                }
            } else if ctrl.Type = "Checkbox" {
                Send "{Down down}{Down up}"
                Send "{Enter}"
                Send "{Down down}{Down up}"
            }
        }
        Send "\"
        Sleep(250)
        Send "\"
        Send "{Enter}"
        Sleep(100)
        Send "{Enter}"
        Sleep(670)
        Send "{Up down}{Up up}"
        Send "{Enter}"
        Send "\"
        Send "{Down down}{Down up}"

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
        Send "{Down down}{Down up}"
        Sleep(100)

        ctrl := 0
        for ctrl in eggsCheckboxes {
            if ctrl.Type = "Checkbox" && ctrl.Value {
                Send "{Down down}{Down up}"
                Send "{Enter}"
                Send "{Down down}{Down up}"
                Send "{Down down}{Down up}"
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

        Send "\"
        Sleep(250)
        Send "\"
        Send "{Enter}"
        Sleep(100)
        Send "{Enter}"
        Sleep(670)
        Send "{Right down}{Right up}"
        Send "{Right down}{Right up}"
        Send "{Right down}{Right up}"
        Send "{Enter}"
        Send "\"

        if EventCheckboxes.Length > 0 {
            Sleep(1000)
            Send "{D down}"
            Sleep(1200)
            Send "{D up}"
            Sleep(500)
            Send "{S down}"
            Sleep(9500)
            Send "{S up}"

            Send "e"
            Sleep(2750)
            MouseMove xEventShopPos, yEventShopPos
            Sleep(100)

            MouseMove xEventShopPos-30, yEventShopPos
            Sleep(250)
            Click
            Sleep(100)
            Sleep(3000)
            Send "\"
            Send "{Down down}{Down up}"
            Sleep(100)

            ctrl := 0
            index := 1
            for ctrl in EventCheckboxes {
                if ctrl.Type = "Checkbox" && ctrl.Value {
                    if (index = 1 || index = 2 || index = 7 || index = 10) {
                        Send "{Down down}{Down up}"
                        Send "{Enter}"
                        Send "{Down down}{Down up}"
                        Send "{Down down}{Down up}"
                    } else {
                        Send "{Down down}{Down up}"
                        Send "{Enter}"
                        Send "{Down down}{Down up}"
                    }
                    
                    Loop 30 {
                        Send "{Enter}"
                    }
                } else if ctrl.Type = "Checkbox" {
                    if (index = 1 || index = 2 || index = 7 || index = 10) {
                        Send "{Down down}{Down up}"
                        Send "{Enter}"
                        Send "{Down down}{Down up}"
                        Send "{Down down}{Down up}"
                    } else {
                        Send "{Down down}{Down up}"
                        Send "{Enter}"
                        Send "{Down down}{Down up}"
                    }
                }
                index++
            }
            Send "\"
            Sleep(250)
            Send "\"
            Send "{Enter}"
            Sleep(100)
            Send "{Enter}"
            Sleep(670)
            Send "{Right down}{Right up}"
            Send "{Right down}{Right up}"
            Send "{Right down}{Right up}"
            Send "{Enter}"
            Send "\"
        }

        Sleep(2000)
        Send "\"
        Send "{Down down}{Down up}"
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

        MouseMove A_ScreenWidth / 2, A_ScreenHeight / 2
        showCountdown(300)
    }
}

^h::
{
    ExitApp
}
