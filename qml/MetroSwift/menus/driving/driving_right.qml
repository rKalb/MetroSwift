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
        x: 6
        y: 10
        width: 314
        height: 420
        color: "#a0000000"

        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Text {
        x: 14
        y: 24
        width: 226
        height: 39
        color: "#ffffff"
        text: "Previous Scores"
        wrapMode: Text.WordWrap
        font.family: "Segoe UI Light"
        font.pixelSize: 32
        style: Text.Normal
    }

    Text {
        x: 30
        y: 80
        width: 284
        height: 39
        color: "#ffffff"
        text: score(0)
        font.pixelSize: 20
        style: Text.Normal
        wrapMode: Text.WordWrap
        font.family: "Segoe UI Light"
    }

    Text {
        x: 30
        y: 120
        width: 284
        height: 39
        color: "#ffffff"
        text: score(1)
        font.pixelSize: 20
        style: Text.Normal
        wrapMode: Text.WordWrap
        font.family: "Segoe UI Light"
    }

    Text {
        x: 30
        y: 160
        width: 284
        height: 39
        color: "#ffffff"
        text: score(2)
        font.pixelSize: 20
        style: Text.Normal
        wrapMode: Text.WordWrap
        font.family: "Segoe UI Light"
    }

    Text {
        x: 30
        y: 200
        width: 284
        height: 39
        color: "#ffffff"
        text: score(3)
        font.pixelSize: 20
        style: Text.Normal
        wrapMode: Text.WordWrap
        font.family: "Segoe UI Light"
    }

    Text {
        x: 30
        y: 240
        width: 284
        height: 39
        color: "#ffffff"
        text: score(4)
        font.pixelSize: 20
        style: Text.Normal
        wrapMode: Text.WordWrap
        font.family: "Segoe UI Light"
    }

    Text {
        x: 30
        y: 280
        width: 284
        height: 39
        color: "#ffffff"
        text: score(5)
        font.pixelSize: 20
        style: Text.Normal
        wrapMode: Text.WordWrap
        font.family: "Segoe UI Light"
    }

    Text {
        x: 30
        y: 320
        width: 284
        height: 39
        color: "#ffffff"
        text: score(6)
        font.pixelSize: 20
        style: Text.Normal
        wrapMode: Text.WordWrap
        font.family: "Segoe UI Light"
    }

    function loaded(){
        hasLoaded = true
    }

    function score(i){
        if (hasLoaded)
            return allData.game.getScore(i)
        return ""
    }
}
