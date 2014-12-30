import QtQuick 1.1
import Data 1.0

Rectangle {
    id: rectangle1
    width: 325
    height: 440
    color: "#00000000"

    property Data allData


    Rectangle {
        id: rectangle2
        x: 0
        y: 10
        width: 314
        height: 420
        color: "#a0000000"

        anchors.horizontalCenterOffset: -2
        anchors.horizontalCenter: parent.horizontalCenter
        Text {

            width: 283
            height: 81
            color: "#ffffff"
            text: "Web Radio"
            horizontalAlignment: Text.AlignRight
            wrapMode: Text.WordWrap
            anchors.top: parent.top
            anchors.topMargin: 25
            anchors.right: parent.right
            anchors.rightMargin: 6
            font.family: "Segoe UI Light"
            font.pixelSize: 60
        }

        Text {
            color: "#ffffff"
            text: "Auxillary"
            anchors.top: parent.top
            anchors.topMargin: 135
            anchors.right: parent.right
            anchors.rightMargin: 20
            font.pixelSize: 60
            font.family: "Segoe UI Light"
        }

        Text {
            color: "#ffffff"
            text: "Settings"
            anchors.top: parent.top
            anchors.topMargin: 245
            anchors.right: parent.right
            anchors.rightMargin: 20
            font.pixelSize: 60
            font.family: "Segoe UI Light"
        }
    }

    function loaded(){}
}
