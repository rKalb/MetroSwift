import QtQuick 1.1
import Data 1.0

Rectangle {
    id: rectangle1
    width: 1100
    height: 40
    color: "#e1000000"

    property double currentDistance : 0.0
    property double tripDistance : 0.0
    property int gear: 0
    property bool manual: false
    //property Data allData : 0

    Text {
        id: odometer
        x: 245
        y: 1
        color: "#ffffff"
        text: currentDistance + " mi"
        anchors.horizontalCenterOffset: -280
        anchors.top: parent.top
        anchors.topMargin: 1
        font.family: "Segoe UI Light"
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 21
    }

    Text {
        id: thermometer
        color: "#ffffff"
        text: "58°"
        font.family: "Segoe UI Light"
        anchors.right: parent.right
        anchors.rightMargin: 18
        font.pointSize: 26
    }

    Text {
        id: fuelEconomy
        x: 18
        y: -2
        color: "#ffffff"
        text: allData.game.fuelEcon
        anchors.left: parent.left
        anchors.leftMargin: 18
        font.family: "Segoe UI Light"
        font.pointSize: 26
    }

    Text {
        id: fuelEconomyMPGText
        x: 55
        y: 15
        color: "#ffffff"
        text: "mpg"
        anchors.left: parent.left
        anchors.leftMargin: 55
        font.family: "Segoe UI Light"
        font.pointSize: 13
    }

    Text {
        id: tripText
        x: 835
        y: 15
        color: "#ffffff"
        text: tripDistance + " mi"
        anchors.horizontalCenterOffset: 280
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 13
        font.family: "Segoe UI Light"
    }

    Text {
        id: parkText
        x: 570
        y: 0
        width: 25
        height: 40
        color: "#ffffff"
        text: qsTr("P")
        style: Text.Normal
        anchors.horizontalCenterOffset: -75
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignBottom
        styleColor: "#000000"
        font.family: "Segoe UI"
        font.pixelSize: gear == 0 ? 30 : 18
        visible: !manual
    }

    Text {
        id: reverseText
        x: 590
        y: 0
        width: 25
        height: 40
        color: "#ffffff"
        text: qsTr("R")
        anchors.horizontalCenterOffset: -50
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignBottom
        font.pixelSize: gear == 1 ? 30 : 18
        font.family: "Segoe UI"
        styleColor: "#ffffff"
        visible: !manual
    }

    Text {
        id: nuetralText
        x: 611
        y: 0
        width: 25
        height: 40
        color: "#ffffff"
        text: qsTr("N")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignBottom
        anchors.horizontalCenterOffset: -25
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: gear == 2 ? 30 : 18
        font.family: "Segoe UI"
        styleColor: "#ffffff"
        visible: !manual
    }

    Text {
        id: driveText
        x: 634
        y: 0
        width: 25
        height: 40
        color: "#ffffff"
        text: qsTr("D")
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignBottom
        font.pixelSize: gear == 3 ? 30 : 18
        font.family: "Segoe UI"
        styleColor: "#ffffff"
        visible: !manual
    }

    Text {
        id: gear4Text
        x: 656
        y: 0
        width: 25
        height: 40
        color: "#ffffff"
        text: qsTr("4")
        anchors.horizontalCenterOffset: 25
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignBottom
        font.pixelSize: gear == 4 ? 30 : 18
        font.family: "Segoe UI"
        styleColor: "#ffffff"
        visible: !manual
    }

    Text {
        id: gear3Text
        x: 675
        y: 0
        width: 25
        height: 40
        color: "#ffffff"
        text: qsTr("3")
        anchors.horizontalCenterOffset: 50
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignBottom
        font.pixelSize: gear == 5 ? 30 : 18
        font.family: "Segoe UI"
        styleColor: "#ffffff"
        visible: !manual
    }

    Text {
        id: gear2Text
        x: 693
        y: 0
        width: 25
        height: 40
        color: "#ffffff"
        text: qsTr("2")
        anchors.horizontalCenterOffset: 75
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignBottom
        font.pixelSize: gear == 6 ? 30 : 18
        font.family: "Segoe UI"
        styleColor: "#ffffff"
        visible: !manual
    }

    Text {
        id: gear1Text
        x: 709
        y: 0
        width: 25
        height: 40
        color: "#ffffff"
        text: qsTr("1")
        anchors.horizontalCenterOffset: 100
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignBottom
        font.pixelSize: gear == 7 ? 30 : 18
        font.family: "Segoe UI"
        styleColor: "#ffffff"
        visible: !manual
    }

    Text {
        id: reverseManText
        x: 590
        y: 0
        width: 25
        height: 40
        color: "#ffffff"
        text: qsTr("R")
        anchors.horizontalCenterOffset: -75
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignBottom
        font.pixelSize: gear == 0 ? 30 : 18
        font.family: "Segoe UI"
        styleColor: "#ffffff"
        visible: manual
    }

    Text {
        id: nuetralManText
        x: 611
        y: 0
        width: 25
        height: 40
        color: "#ffffff"
        text: qsTr("N")
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignBottom
        anchors.horizontalCenterOffset: -50
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: gear == 1 ? 30 : 18
        font.family: "Segoe UI"
        styleColor: "#ffffff"
        visible: manual
    }

    Text {
        id: gearMan5Text
        x: 656
        y: 0
        width: 25
        height: 40
        color: "#ffffff"
        text: qsTr("5")
        anchors.horizontalCenterOffset: 75
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignBottom
        font.pixelSize: gear == 6 ? 30 : 18
        font.family: "Segoe UI"
        styleColor: "#ffffff"
        visible: manual
    }

    Text {
        id: gearMan4Text
        x: 656
        y: 0
        width: 25
        height: 40
        color: "#ffffff"
        text: qsTr("4")
        anchors.horizontalCenterOffset: 50
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignBottom
        font.pixelSize: gear == 5 ? 30 : 18
        font.family: "Segoe UI"
        styleColor: "#ffffff"
        visible: manual
    }

    Text {
        id: gearMan3Text
        x: 675
        y: 0
        width: 25
        height: 40
        color: "#ffffff"
        text: qsTr("3")
        anchors.horizontalCenterOffset: 25
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignBottom
        font.pixelSize: gear == 4 ? 30 : 18
        font.family: "Segoe UI"
        styleColor: "#ffffff"
        visible: manual
    }

    Text {
        id: gearMan2Text
        x: 693
        y: 0
        width: 25
        height: 40
        color: "#ffffff"
        text: qsTr("2")
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignBottom
        font.pixelSize: gear == 3 ? 30 : 18
        font.family: "Segoe UI"
        styleColor: "#ffffff"
        visible: manual
    }

    Text {
        id: gearMan1Text
        x: 709
        y: 0
        width: 25
        height: 40
        color: "#ffffff"
        text: qsTr("1")
        anchors.horizontalCenterOffset: -25
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignBottom
        font.pixelSize: gear == 2 ? 30 : 18
        font.family: "Segoe UI"
        styleColor: "#ffffff"
        visible: manual
    }
}
