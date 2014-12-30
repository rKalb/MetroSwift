import QtQuick 1.1
import Data 1.0

Rectangle {
    id: rectangle1
    width: 325
    height: 440
    color: "#00000000"

    property Data allData
    property bool hasLoaded: false

    Rectangle {
        id: rectangle2
        x: 0
        y: 10
        width: 314
        height: 420
        color: "#a0000000"

        anchors.horizontalCenterOffset: -2
        anchors.horizontalCenter: parent.horizontalCenter

        Image {
            id: fanBoth
            x: 212
            y: 8
            width: 80
            height: 80
            anchors.horizontalCenterOffset: 40
            anchors.horizontalCenter: parent.horizontalCenter
            source: "menus/climate/fan_both.png"
            visible: fan(2)
        }

        Image {
            id: fanHigh
            x: 209
            y: 8
            width: 80
            height: 80
            anchors.horizontalCenterOffset: 40
            anchors.horizontalCenter: parent.horizontalCenter
            source: "menus/climate/fan_high.png"
            visible: fan(0)
        }

        Image {
            id: fanLow
            x: 215
            y: 8
            width: 80
            height: 80
            anchors.horizontalCenterOffset: 40
            anchors.horizontalCenter: parent.horizontalCenter
            source: "menus/climate/fan_low.png"
            visible: fan(1)
        }

        Text {
            id: fanOff
            x: 218
            y: 39
            width: 40
            color: "#ffffff"
            text: qsTr("Off")
            anchors.horizontalCenterOffset: 40
            anchors.horizontalCenter: parent.horizontalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 32
            visible: ventOff()
        }

        Image {
            id: defrostFront
            x: 215
            y: 120
            width: 80
            height: 80
            anchors.horizontalCenterOffset: 40
            anchors.horizontalCenter: parent.horizontalCenter
            source: "menus/climate/front_defrost.png"
            visible: defrost(1)
        }

        Image {
            id: defrostBoth
            x: 220
            y: 115
            width: 100
            height: 100
            anchors.horizontalCenterOffset: 40
            anchors.horizontalCenter: parent.horizontalCenter
            visible: defrost(3)
            source: "menus/climate/both_defrost.png"
        }

        Image {
            id: defrostBack
            x: 216
            y: 120
            width: 80
            height: 80
            anchors.horizontalCenterOffset: 40
            anchors.horizontalCenter: parent.horizontalCenter
            source: "menus/climate/rear_defrost.png"
            visible: defrost(2)
        }

        Text {
            id: defrostOff
            x: 145
            y: 150
            width: 40
            color: "#ffffff"
            text: qsTr("Off")
            anchors.horizontalCenterOffset: 40
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 32
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            visible: defrost(0)
        }

        Text {
            id: acOff
            x: 217
            y: 260
            width: 40
            color: "#ffffff"
            text: qsTr("Off")
            anchors.horizontalCenterOffset: 40
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 32
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            visible: ac(false)
        }

        Text {
            id: acOn
            x: 222
            y: 260
            width: 40
            color: "#ffffff"
            text: qsTr("On")
            anchors.horizontalCenterOffset: 40
            anchors.horizontalCenter: parent.horizontalCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: 32
            horizontalAlignment: Text.AlignHCenter
            visible: ac(true)
        }

        Text {
            id: fanMode
            x: 217
            y: 40
            width: 40
            color: "#ffffff"
            text: qsTr("Fan Mode:")
            font.family: "Segoe UI Light"
            visible: true
            font.pixelSize: 32
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: -130
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
        }

        Text {
            id: defrostLabel
            x: 208
            y: 150
            width: 40
            color: "#ffffff"
            text: qsTr("Defrost:")
            font.family: "Segoe UI Light"
            visible: true
            font.pixelSize: 32
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: -130
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
        }

        Text {
            id: defrost1
            x: 213
            y: 260
            width: 40
            color: "#ffffff"
            text: qsTr("A/C:")
            font.family: "Segoe UI Light"
            visible: true
            font.pixelSize: 32
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: -130
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignTop
        }
    }

    function fan(mode){
        if (hasLoaded){
            return (allData.climate.fanMode===mode && allData.climate.fanSpeed != 0)
        }
        return false
    }

    function defrost(mode){
        if (hasLoaded){
            return (allData.climate.defrost===mode)
        }
        return false
    }

    function ac(isOn){
        if (hasLoaded){
            if (isOn){
                return (allData.climate.ac && allData.climate.fanSpeed != 0)
            }
            return (!allData.climate.ac || allData.climate.fanSpeed == 0)
        }
        return false
    }

    function ventOff(){
        if (hasLoaded){
            return (allData.climate.fanSpeed == 0)
        }
        return false
    }

    function loaded(){
        hasLoaded = true
    }
}
