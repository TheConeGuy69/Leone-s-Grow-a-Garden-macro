#Requires AutoHotkey v2.0

xGearShopPos := A_ScreenWidth * (900 / 1440)
yGearShopPos := A_ScreenHeight * (427 / 900)

;Seed SHop
seedCheckboxes := []
MyGui := Gui()
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

MyGui.Show()

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

    MouseMove xGearShopPos+30, yGearShopPos
    Sleep(250)
    Click
    Sleep(100)
    Sleep(3000)
    Send "\"
    Send "\"
    Send "{Down down}{Down up}"
    Sleep(100)
    ;gearshop add
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
}

^h::
{
    ExitApp
}
