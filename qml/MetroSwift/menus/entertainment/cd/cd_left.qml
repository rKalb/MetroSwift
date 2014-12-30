import QtQuick 1.1
import Data 1.0
import Entertainment 1.0


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
        anchors.horizontalCenterOffset: 2
        anchors.horizontalCenter: parent.horizontalCenter

        Text {
            x: 16
            y: 110
            width: 287
            height: 137
            color: "#ffffff"
            text: artistText()
            wrapMode: Text.WordWrap
            font.bold: true
            font.family: "Segoe UI Light"
            font.pixelSize: 48
        }

        Text {
            x: 16
            y: 311
            width: 288
            height: 102
            color: "#ffffff"
            text: trackText()
            wrapMode: Text.WordWrap
            anchors.right: parent.right
            anchors.rightMargin: 10
            horizontalAlignment: Text.AlignRight
            font.family: "Segoe UI Light"
            font.pixelSize: 36
        }

        Text {
            x: 4
            y: 11
            color: "#ffffff"
            text: "CD"
            font.pixelSize: 72
            font.family: "Segoe UI Light"
        }

        Image {
            id: pause
            x: 222
            y: 21
            width: 71
            height: 77
            source: "menus/entertainment/cd/Pause.png"
            visible: isPaused()
        }
    }
    function loaded(){
        allData.entertainment.mode = Entertainment.Cds
        hasLoaded = true
    }

    function trackText(){
        if (hasLoaded)
            return allData.entertainment.currentTitle
        else
            return ""
    }

    function artistText(){
        if (hasLoaded)
            return allData.entertainment.currentArtist
        else
            return ""
    }

    function isPaused(){
        if (hasLoaded)
            return allData.entertainment.paused
        else
            return ""
    }

    function rt(){
        allData.entertainment.playPause()
    }

    function rm(){
    }

    function rb(){
    }

    function lb(){
        allData.entertainment.nextCd();
    }

    function lu(){
        allData.entertainment.next()
    }

    function ld(){
        allData.entertainment.previous()
    }

}
