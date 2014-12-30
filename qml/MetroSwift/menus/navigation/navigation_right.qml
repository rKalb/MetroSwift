import QtQuick 1.1
import Data 1.0
import Climate 1.0

Rectangle {
    id: rectangle1
    width: 325
    height: 440
    color: "#00000000"

    property Data allData
    property bool hasLoaded : false

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
            id: text1
            x: 120
            y: 0
            color: "#ffffff"
            text: qsTr("W")
            font.family: "Segoe UI Light"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 80
        }

        Text {
            id: text2
            x: 13
            y: 127
            color: "#ffffff"
            text: qsTr("44° 34' 01\" N, 123° 16' 32\" W")
            verticalAlignment: Text.AlignVCenter
            font.family: "Segoe UI Light"
            font.pixelSize: 24
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: text3
            x: 14
            y: 194
            color: "#ffffff"
            text: qsTr("11 ft. Above Sea Level")
            anchors.horizontalCenter: parent.horizontalCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Segoe UI Light"
            font.pixelSize: 24
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: text4
            x: 47
            y: 260
            color: "#ffffff"
            text: qsTr("SE Campus Way")
            anchors.horizontalCenterOffset: 0
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "Segoe UI Light"
            font.pixelSize: 24
            horizontalAlignment: Text.AlignHCenter
        }
    }

    function loaded(){
        hasLoaded = true
    }
}
