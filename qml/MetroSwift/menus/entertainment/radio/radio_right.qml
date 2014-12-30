import QtQuick 1.1
import Data 1.0

Rectangle {
    id: rectangle2
    width: 325
    height: 440
    color: "#00000000"

    property Data allData
    property bool hasLoaded : false

    Rectangle {
        id: rectangle1
        x: 0
        y: 10
        width: 314
        height: 420
        color: "#a0000000"

        anchors.horizontalCenterOffset: -2
        anchors.horizontalCenter: parent.horizontalCenter

        Text {
            id: text1
            x: 7
            y: 150
            width: 300
            height: 260
            color: "#ffffff"

            text: description()
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "Segoe UI Light"
            wrapMode: Text.WordWrap
            font.pixelSize: 18
            lineHeight: 0.8
            maximumLineCount: 13
        }

        Image {
            x: 84
            y: 4
            width: 149
            height: 141
            anchors.horizontalCenter: parent.horizontalCenter
            source: albumSrc()
        }
    }

    function loaded(){
        hasLoaded = true
    }

    function albumSrc(){
        if (hasLoaded)
            return allData.entertainment.albumArt
        else
            return ""
    }
    function description(){
        if (hasLoaded)
            return allData.entertainment.description
        else
            return ""
    }
}
