import QtQuick 1.1
import Data 1.0
import Climate 1.0

Rectangle {
    id: rectangle1
    width: 325
    height: 440
    color: "#00000000"
	
    property Data allData
    property Climate climate
    property bool hasLoaded : false

    Rectangle {
        id: rectangle2
        x: 0
        y: 10
        width: 314
        height: 420
        color: "#a0000000"
        anchors.horizontalCenterOffset: 2
        anchors.horizontalCenter: parent.horizontalCenter

        Text {
            x: 20
            y: 46
            color: "#ffffff"
            text: "Climate"
            font.pixelSize: 72
            font.family: "Segoe UI Light"
        }

        Rectangle {
            id: tempOutline
            x: 92
            y: 235
            width: 265
            height: 25
            color: "#00000000"
            anchors.horizontalCenterOffset: 6
            border.width: 3
            border.color: "#ffffff"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
            id: tempFill
            x: 32
            y: 237
            width: tempWidth()
            height: 22
            color: tempColor()
        }

        Rectangle {
            id: fanOutline
            x: 16
            y: 348
            width: 265
            height: 25
            color: "#00000000"
            anchors.horizontalCenterOffset: 6
            anchors.horizontalCenter: parent.horizontalCenter
            border.width: 3
            border.color: "#ffffff"
        }


        Rectangle {
            id: fan1
            x: 32
            y: 350
            width: 42
            height: 22
            color: "#ffffff"
            visible: visableFan(1)
        }

        Rectangle {
            id: fan2
            x: 76
            y: 350
            width: 42
            height: 22
            color: "#ffffff"
            visible: visableFan(2)
        }

        Rectangle {
            id: fan3
            x: 120
            y: 350
            width: 42
            height: 22
            color: "#ffffff"
            visible: visableFan(3)
        }

        Rectangle {
            id: fan4
            x: 164
            y: 350
            width: 42
            height: 22
            color: "#ffffff"
            visible: visableFan(4)
        }

        Rectangle {
            id: fan5
            x: 208
            y: 350
            width: 42
            height: 22
            color: "#ffffff"
            visible: visableFan(5)
        }

        Rectangle {
            id: fan6
            x: 252
            y: 350
            width: 42
            height: 22
            color: "#ffffff"
            visible: visableFan(6)
        }

        Text {
            x: 24
            y: 199
            color: "#ffffff"
            text: "Temperature"
            font.pixelSize: 28
            font.family: "Segoe UI Light"
        }

        Text {
            x: 24
            y: 310
            color: "#ffffff"
            text: "Fan Speed"
            font.pixelSize: 28
            font.family: "Segoe UI Light"
        }

        Text {
            id: tempLabel
            x: 252
            y: 199
            color: "#ffffff"
            text: tempText();
            font.pixelSize: 28
            font.family: "Segoe UI Light"
        }
    }

    function loaded(){
        climate = allData.climate
        hasLoaded = true
    }

    function lt(){
        climate.fanSpeed += 1
    }
    function lb(){
        climate.fanSpeed -= 1
    }
    function lu(){
        climate.temp += 1
    }
    function ld(){
        climate.temp -= 1
    }
    function rt(){
        if (climate.fanSpeed == 0){
            climate.fanSpeed = 1
        }else{
            climate.nextFanMode()
        }
    }
    function rm(){
        climate.nextDefrostMode()
    }
    function rb(){
        if (climate.fanSpeed == 0){
            climate.fanSpeed = 1
        }
        climate.switchAC()
    }

    function visableFan(speed){
        if (hasLoaded){
            return climate.fanSpeed >= speed
        }
        return false;
    }

    function tempWidth(){
        if (hasLoaded){
            return 8.7 * (climate.temp - 50)
        }
        return 70 * 21.5
    }

    function tempText(){
        if (hasLoaded){
            return climate.temp + "°F"
        }
        return "0°F"
    }

    function tempColor(){
        if (hasLoaded){
            return Qt.rgba(red(climate.temp - 50) , green(climate.temp - 50), blue(climate.temp - 50), 1)
        }
        return Qt.rgba(1,1,1,1)
    }

    Connections{
         target: climate
         onFanSpeedChanged: {
             fan1.visible = visableFan(1)
             fan2.visible = visableFan(2)
             fan3.visible = visableFan(3)
             fan4.visible = visableFan(4)
             fan5.visible = visableFan(5)
             fan6.visible = visableFan(6)
         }
         onTempChanged: {
             tempFill.width = tempWidth()
         }
    }

    function red(temp){
        if (temp >= 15){
            return (255 - (temp - 15) * 5)/255.0
        } else {
            return (255 - (15 - temp) * 15)/255.0
        }
    }
    function green(temp){
        if (temp >= 15){
            return (255 - (temp - 15) * 15)/255.0
        } else {
            return (255 - (15 - temp) * 15)/255.0
        }
    }
    function blue(temp){

        if (temp >= 15){
            return (255 - (temp - 15) * 15)/255.0
        } else {
            return (255 - (15 - temp) * 5)/255.0
        }
    }
}
