import QtQuick 1.1
import Menu 1.0
import Odometer 1.0
import Entertainment 1.0
import CarData 1.0
import Data 1.0
import Config 1.0

Rectangle {
    //Holds the mainView (black background)
    id: mainContainer
    width: 1600
    height: 650
    color: "#000000"

    property int volume: 50
    property bool altLoader
    property string slash: "\\"

    property CarData carData: allData.carData
    property Menu menu: allData.menu
    property Odometer odometer: allData.odometer
    property Entertainment entertainment: allData.entertainment

    Rectangle {
        //This mimics brightness. Transparent box which gets more opaic with a lower brightness setting.
        color: Qt.rgba(0,0,0,allData.settings.brightness)
        z: 1
        width: 1280
        height: 480
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Rectangle {
        id: mainView
        width: 1280
        height: 480
        color: "#00000000"
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.horizontalCenter: parent.horizontalCenter

        Image {
            id: background
            x: 0
            y: 0
            width: 1280
            height: 480
            z: -1
            source: "menus/backgrounds/" + allData.settings.backgroundImageValue
        }

        //Need two loaders. One for the fade in and one for fade out.
        //These switch based on the altLoader boolean property.
        Loader {
            id: leftLoader
            x: 90
            onLoaded: {
                item.allData = allData
                item.loaded()
            }
        }

        Loader {
            id: rightLoader
            x: 865
            onLoaded: {
                item.allData = allData
                item.loaded()
            }
        }

        Loader {
            id: leftLoader1
            x: 90
            source: "menus" + slash + menu.leftQml
            onLoaded: {
                item.allData = allData
                item.loaded()
            }
        }

        Loader {
            id: rightLoader1
            x: 865
            source: "menus" + slash + menu.rightQml
            onLoaded: {
                item.allData = allData
                item.loaded()
            }
        }

        //Main key handler.
        //Uses menu files to determine what to do with current menu.
        //If there is a menu to forward to, it will forward to the menu specified in the menue file coresponding to the button.
        //If command in menu file. It will send a function call corespoding to that button.
        //
        //Key Assignment - Location - functionCall
        //w - Top left - lt()
        //s - Middle left - lm()
        //x - bottom left - lb()
        //d - left up arrow - lu()
        //c - left down arrow - ld()
        //o - Top right - rt()
        //k - Middle right - rm()
        //m - Bottom right - rb()
        //j - Right vol. up - N/A
        //n - Right vol. down - N/A
        //e - Exit - N/A

        Item {
            id: keyHandler
            focus: true
            Keys.onPressed:  {
                if (event.key === Qt.Key_W) {
                    if (menu.menuLeftTop != "command"){
                        menu.updateMenu("qml" + slash + "MetroSwift" + slash + "menus" + slash + menu.menuLeftTop)
                    } else{
                        if (altLoader){
                            leftLoader.item.lt()
                        }else{
                            leftLoader1.item.lt()
                        }
                    }
                }
                else if (event.key === Qt.Key_S) {
                    if (menu.menuLeftMid != "command"){
                        menu.updateMenu("qml" + slash + "MetroSwift" + slash + "menus" + slash + menu.menuLeftMid)
                    } else{
                        if (altLoader){
                            leftLoader.item.lm()
                        }else{
                            leftLoader1.item.lm()
                        }
                    }
                }
                else if (event.key === Qt.Key_X) {
                    if (menu.menuLeftBottom != "command"){
                        menu.updateMenu("qml" + slash + "MetroSwift" + slash + "menus" + slash + menu.menuLeftBottom)
                    } else{
                        if (altLoader){
                            leftLoader.item.lb()
                        }else{
                            leftLoader1.item.lb()
                        }
                    }
                }
                else if (event.key === Qt.Key_D) {
                    if (menu.menuLeftToggle != "command"){
                        menu.updateMenu("qml" + slash + "MetroSwift" + slash + "menus" + slash + menu.menuLeftToggle)
                    } else{
                        if (altLoader){
                            leftLoader.item.lu()
                        }else{
                            leftLoader1.item.lu()
                        }
                    }
                }
                else if (event.key === Qt.Key_C) {
                    if (menu.menuLeftToggle != "command"){
                        menu.updateMenu("qml" + slash + "MetroSwift" + slash + "menus" + slash + menu.menuLeftToggle)
                    } else{
                        if (altLoader){
                            leftLoader.item.ld()
                        }else{
                            leftLoader1.item.ld()
                        }
                    }
                }
                else if (event.key === Qt.Key_O) {
                    if (menu.menuRightTop != "command"){
                        menu.updateMenu("qml" + slash + "MetroSwift" + slash + "menus" + slash + menu.menuRightTop)
                    } else{
                        if (altLoader){
                            leftLoader.item.rt()
                        }else{
                            leftLoader1.item.rt()
                        }
                    }
                }
                else if (event.key === Qt.Key_K) {
                    if (menu.menuRightMid != "command"){
                        menu.updateMenu("qml" + slash + "MetroSwift" + slash + "menus" + slash + menu.menuRightMid)
                    } else{
                        if (altLoader){
                            leftLoader.item.rm()
                        }else{
                            leftLoader1.item.rm()
                        }
                    }
                }
                else if (event.key === Qt.Key_M) {
                    if (menu.menuRightBottom != "command"){
                        menu.updateMenu("qml" + slash + "MetroSwift" + slash + "menus" + slash + menu.menuRightBottom)
                    } else{
                        if (altLoader){
                            leftLoader.item.rb()
                        }else{
                            leftLoader1.item.rb()
                        }
                    }
                }
                else if (event.key === Qt.Key_J) {
                    //Allows for mute is down was pressed less than 100ms ago
                    if (muteTimer2.running){
                        volume = 0
                    }
                    else{
                        //increments volume
                        volume = Math.min(100, volume + 1)
                    }
                    //sets volume
                    allData.entertainment.setVolume(volume/100)
                    //Makes the volume bar visible
                    volumeBar.visible = true
                    //Turns the volume bar to not visible in 2.5 seconds
                    volumeTimer.restart()
                    //Starts a new timer to see if mute should happen
                    muteTimer.restart()
                }
                else if (event.key === Qt.Key_N) {
                    //Allows for mute is down was pressed less than 100ms ago
                    if (muteTimer.running){
                        volume = 0
                    } else {
                        //decrements volume
                        volume = Math.max(0, volume - 1)
                    }
                    //sets volume
                    allData.entertainment.setVolume(volume/100)
                    //Makes the volume bar visible
                    volumeBar.visible = true
                    //Turns the volume bar to not visible in 2.5 seconds
                    volumeTimer.restart()
                    //Starts a new timer to see if mute should happen
                    muteTimer2.restart()
                }
                else if (event.key === Qt.Key_E) {
                    /****EXIT POINT****/

                    //Write current game score to highscore file
                    allData.game.writeFile()
                    //Write out current mileages
                    odometer.writeMileage(Math.round((carData.currentDistance + odometer.odom)* 10) /10, Math.round((carData.currentDistance + odometer.trip)* 10) /10)
                    Qt.quit()
                }
            }
        }

        Timer {
            //Hold volume bar to visible for 2.5 seconds, then turn it off
            id: volumeTimer
            interval: 2500
            running: false
            repeat: false
            onTriggered:{
                volumeBar.visible = false
            }
        }

        Timer {
            //Mute timer for up/down
            id: muteTimer
            interval: 100
            running: false
            repeat: false
        }

        Timer {
            //Mute timer for down/up
            id: muteTimer2
            interval: 100
            running: false
            repeat: false
        }

        Rectangle {
            //Bar which is visible if volume has been recently changed.
            //May want to refactor out.
            id: volumeBar
            x: 90
            y: 440
            z: 1
            width: 1100
            height: 40
            color: "#c8000000"
            visible: false
            Text{
                font.family: "Segoe UI"
                font.pointSize: 20
                color: "#ffffff"
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Volume: " + volume
            }
        }

        Center {
            //Everything that is in the center is under this
            id: center
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 0
        }


        ButtonsRight {
            //The buttons on the right side
            id: right
            anchors.right: parent.right
            anchors.rightMargin: 0

        }

        ButtonsLeft {
            //The buttons on the left side
            id: left
        }

        BottomBar {
            //The bottom bar of info
            id: bottomBar
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.horizontalCenter: parent.horizontalCenter
            currentDistance: odometer.odom
            tripDistance: odometer.trip
            gear: carData.gear
            manual: allData.config.manual
        }    

        Connections {
            //If the menu file has changed update menu
            //If one of the properties changed, just update the buttons
            target: menu
            onFinished: {
                menuUpdate()
            }
            onUpdated:{
                updateButtons()
            }
        }

        ParallelAnimation {
            //Fade animation
            //loader1 fade out
            //loader fade in
            id: menuAnimation
            running: false
            NumberAnimation { target: leftLoader1; property: "opacity"; to: 0; duration: 835 }
            NumberAnimation { target: rightLoader1; property: "opacity"; to: 0; duration: 835 }
            NumberAnimation { target: leftLoader; property: "opacity"; to: 1; duration: 835 }
            NumberAnimation { target: rightLoader; property: "opacity"; to: 1; duration: 835 }
        }

        ParallelAnimation {
            //Fade animation
            //loader1 fade in
            //loader fade out
            id: menuAnimation1
            running: false
            NumberAnimation { target: leftLoader; property: "opacity"; to: 0; duration: 835 }
            NumberAnimation { target: rightLoader; property: "opacity"; to: 0; duration: 835 }
            NumberAnimation { target: leftLoader1; property: "opacity"; to: 1; duration: 835 }
            NumberAnimation { target: rightLoader1; property: "opacity"; to: 1; duration: 835 }
        }
    }

    function menuUpdate(){
        //Updates the menus. Changes the buttons. Fades in/out the appropriate stuffs.
        //switches loaders.
        if (altLoader){
            leftLoader1.opacity = 0
            rightLoader1.opacity = 0
        }
        else{
            leftLoader.opacity = 0
            rightLoader.opacity = 0
        }

        updateButtons()

        if (altLoader){
            altLoader = !altLoader
            rightLoader1.source = "menus" + slash + menu.rightQml
            leftLoader1.source = "menus" + slash + menu.leftQml
            if (!altLoader){
                menuAnimation1.running = true
            }
        }
        else{
            altLoader = !altLoader
            rightLoader.source = "menus" + slash + menu.rightQml
            leftLoader.source = "menus" + slash + menu.leftQml
            if (altLoader){
                menuAnimation.running = true
            }
        }
    }

    function updateButtons(){
        left.leftTopImgProp = "menus" + slash + menu.buttonLeftTopSrc
        left.leftMidImgProp = "menus" + slash + menu.buttonLeftMidSrc
        left.leftBottomImgProp = "menus" + slash + menu.buttonLeftBottomSrc
        left.leftToggleImgProp = "menus" + slash + menu.buttonLeftToggleSrc
        right.rightTopImgProp = "menus" + slash + menu.buttonRightTopSrc
        right.rightMidImgProp = "menus" + slash + menu.buttonRightMidSrc
        right.rightBottomImgProp = "menus" + slash + menu.buttonRightBottomSrc

        left.leftTopTextProp = menu.buttonLeftTopTitle
        left.leftMidTextProp = menu.buttonLeftMidTitle
        left.leftBottomTextProp = menu.buttonLeftBottomTitle
        left.leftToggleTextProp = menu.buttonLeftToggleTitle
        right.rightTopTextProp = menu.buttonRightTopTitle
        right.rightMidTextProp = menu.buttonRightMidTitle
        right.rightBottomTextProp = menu.buttonRightBottomTitle
    }
}
