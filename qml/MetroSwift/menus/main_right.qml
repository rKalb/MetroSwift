import QtQuick 1.1
import Data 1.0

Rectangle {
    id: rectangle1
    width: 325
    height: 440
    color: "#00000000"

    property Data allData
    property bool hasLoaded : false

    Image {
        id: dial
        source: "menus\\main_right.png"
    }

    Text {
        id: scoreText1
        x: 53
        y: 305
        width: 100
        color: "#ffffff"
        text: score()
        font.pixelSize: 24
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.horizontalCenterOffset: -83
        font.family: "Segoe UI Light"
    }

    Text {
        id: scoreText
        x: 45
        y: 290
        width: 100
        color: "#ffffff"
        text: "Driving Score"
        anchors.horizontalCenterOffset: -83
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 16
        verticalAlignment: Text.AlignVCenter
        font.family: "Segoe UI Light"
    }

    Text {
        id: deltaText
        x: 45
        y: 245
        width: 100
        color: "#ffffff"
        text: delta()
        anchors.horizontalCenterOffset: -83
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 38
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.family: "Segoe UI Light"
    }

    Image {
        id: needle
        x: 81
        y: 151
        rotation: 0
        smooth: true
        source: "menus\\needle_small.png"
        transform: Rotation {
            id: tachNeedleRotation
            origin.x: 0; origin.y: 140
            angle: needleAngle()
            Behavior on angle {
                SpringAnimation {
                    spring: 1.4
                    damping: .15
                }
            }
        }
    }

    Rectangle {
        id: climateBox
        x: 0
        y: 0
        width: 300
        height: 100
        color: "#50000000"

        Text {
            id: tempLabel
            x: 8
            y: 17
            width: 100
            color: "#ffffff"
            text: tempText()
            verticalAlignment: Text.AlignBottom
            font.family: "Segoe UI Light"
            font.pixelSize: 50
        }

        Text {
            id: insideText
            x: 10
            y: -6
            width: 100
            color: "#ffffff"
            text: "Inside"
            verticalAlignment: Text.AlignBottom
            font.family: "Segoe UI Light"
            font.pixelSize: 30
        }

        Image {
            id: fanImg
            x: 110
            y: 74
            width: 25
            height: 27
            source: "menus/climate/fan.png"
        }

        Rectangle {
            id: bar1
            x: 110
            y: 65
            width: 25
            height: 6
            color: "#ffffff"
            visible: visableFan(1)
        }


        Rectangle {
            id: bar2
            x: 110
            y: 55
            width: 25
            height: 6
            color: "#ffffff"
            visible: visableFan(2)
        }

        Rectangle {
            id: bar3
            x: 110
            y: 45
            width: 25
            height: 6
            color: "#ffffff"
            visible: visableFan(3)
        }

        Rectangle {
            id: bar4
            x: 110
            y: 35
            width: 25
            height: 6
            color: "#ffffff"
            visible: visableFan(4)
        }

        Rectangle {
            id: bar5
            x: 110
            y: 25
            width: 25
            height: 6
            color: "#ffffff"
            visible: visableFan(5)
        }

        Rectangle {
            id: bar6
            x: 110
            y: 15
            width: 25
            height: 6
            color: "#ffffff"
            visible: visableFan(6)
        }

        Image {
            id: fanMode
            width: 60
            height: 60
            anchors.top: parent.top
            anchors.topMargin: 20
            anchors.left: parent.left
            anchors.leftMargin: 140
            source: fanModeSource()
        }

        Image {
            id: rearDefrost
            x: 8
            y: -6
            width: 50
            height: 50
            anchors.right: parent.right
            anchors.rightMargin: 0
            source: "menus/climate/rear_defrost.png"
            anchors.topMargin: 0
            anchors.top: parent.top
            visible: rearDefrostVisible()
        }

        Image {
            id: frontDefrost
            x: 5
            y: 2
            width: 50
            height: 50
            anchors.right: parent.right
            anchors.rightMargin: 55
            source: "menus/climate/front_defrost.png"
            anchors.topMargin: 0
            anchors.top: parent.top
            visible: frontDefrostVisible()
        }

        Image {
            id: ac
            x: 8
            y: 10
            width: 46
            height: 46
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.rightMargin: 33
            source: "menus/climate/ac.png"
            anchors.right: parent.right
            visible: acVisible()
        }

        Text {
            id: offLabel
            x: 149
            y: 17
            width: 100
            color: "#ffffff"
            text: "off"
            horizontalAlignment: Text.AlignHCenter
            anchors.right: parent.right
            anchors.rightMargin: 95
            verticalAlignment: Text.AlignBottom
            font.family: "Segoe UI Light"
            font.pixelSize: 50
            visible: offTextVisible()
        }

    }

    function loaded(){
        hasLoaded = true
    }

    function needleAngle(){
        if (hasLoaded)
            return Math.min(130,55 - allData.game.delta)
        else
            return 55
    }

    function delta(){
        if (hasLoaded)
            return allData.game.delta
        else
            return 0
    }

    function score(){
        if (hasLoaded)
            return allData.game.score
        else
            return 0
    }

    function visableFan(speed){
        if (hasLoaded){
            return allData.climate.fanSpeed >= speed
        }
        return false;
    }

    function tempText(){
        if (hasLoaded){
            return allData.climate.temp + "°F"
        }
        return "0°F"
    }

    function fanModeSource(){
        if (hasLoaded){
            if (allData.climate.fanSpeed == 0){
                return ""
            }else if (allData.climate.fanMode==0){
                return "menus/climate/fan_high.png"
            }else if (allData.climate.fanMode==1){
                return "menus/climate/fan_high.png"
            }else if (allData.climate.fanMode==2){
                return "menus/climate/fan_both.png"
            }
        }
        return "";
    }

    function offTextVisible(){
        if (hasLoaded){
            return allData.climate.fanSpeed == 0
        }
        return false;
    }

    function acVisible(){
        if (hasLoaded){
            return allData.climate.ac && allData.climate.fanSpeed != 0
        }
        return false;
    }

    function rearDefrostVisible(){
        if (hasLoaded){
            return (allData.climate.defrost == 2 || allData.climate.defrost == 3)
        }
        return false;
    }

    function frontDefrostVisible(){
        if (hasLoaded){
            return (allData.climate.defrost == 1 || allData.climate.defrost == 3)
        }
        return false;
    }
}
