import QtQuick 1.1
import CarData 1.0
import Entertainment 1.0
import Data 1.0

Rectangle {
    id: rectangle2
    width: 325
    height: 440
    color: "#00000000"

    property Data allData
    property CarData carData
    property bool hasLoaded : false

    Image {
        source: "menus\\main_left.png"
        opacity: 1
    }

    Image {
        id: tachOpacity
        source: "menus\\red_glow.png"
        opacity: setOpacity()
    }

    Text {
        x: 229
        y: 311
        color: "#ffffff"
        text: "RPM"
        anchors.horizontalCenter: parent.horizontalCenter
        verticalAlignment: Text.AlignVCenter
        anchors.horizontalCenterOffset: 83
        font.family: "Segoe UI Light"
        font.pointSize: 12
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        x: 155
        y: 274
        color: "#ffffff"
        text: setTachText()
        anchors.horizontalCenterOffset: 83
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: "Segoe UI Light"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pointSize: 20

    }

    Image {
        id: tachometerNeedle
        x: 244
        y: 151
        rotation: 0
        smooth: true
        source: "menus\\needle_small.png"
        transform: Rotation {
            id: tachNeedleRotation
            origin.x: 0; origin.y: 140
            angle: tachAngle()
            Behavior on angle {
                SpringAnimation {
                    spring: 1.4
                    damping: .15
                }
            }
        }
    }

    Rectangle {
        id: rectangle1
        x: 0
        y: 0
        width: 300
        height: 100
        color: "#50000000"
        anchors.right: parent.right
        anchors.rightMargin: 0

        Image {
            id: image1
            width: 90
            height: 90
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            source: albumSrc()
        }

        Text {
            x: 86
            y: 53
            color: "#ffffff"
            text: trackText()
            anchors.right: parent.right
            anchors.rightMargin: 5
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 5
            horizontalAlignment: Text.AlignRight
            font.pointSize: 14
            verticalAlignment: Text.AlignVCenter
            font.family: "Segoe UI Light"
        }

        Text {
            x: 9
            width: 200
            height: 64
            color: "#ffffff"
            text: artistText()
            font.bold: true
            anchors.top: parent.top
            anchors.topMargin: 7
            wrapMode: Text.WordWrap
            font.pointSize: 18
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.family: "Segoe UI Light"
            anchors.left: parent.left
            anchors.leftMargin: 100
        }

        Text {
            x: 100
            y: 0
            width: 200
            height: 64
            color: "#ffffff"
            text: stationText()
            font.bold: true
            font.pointSize: 14
            anchors.topMargin: 0
            anchors.top: parent.top
            horizontalAlignment: Text.AlignRight
            anchors.leftMargin: 95
            anchors.left: parent.left
            wrapMode: Text.WordWrap
            verticalAlignment: Text.AlignTop
            font.family: "Segoe UI Light"
        }
    }

    Image {
        id: image2
        x: 120
        y: 54
        width: 39
        height: 41
        source: "menus/entertainment/cd/Pause.png"
        visible: isPaused()
    }
    function loaded(){
        carData = allData.carData
        hasLoaded = true
    }

    function setOpacity(){
        if (hasLoaded)
            return Math.max(0,(carData.tachometer - (allData.config.redLine - (allData.config.redLineArea + 500))) / (allData.config.redLineArea))
        else
            return 0;
    }

    function setTachText(){
        if (hasLoaded)
            return carData.tachometer
        else
            return "";
    }

    function tachAngle(){
        if (hasLoaded)
            return 230 + carData.tachometer * (154 / allData.config.redLine)
        else
            return 230
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

    function albumSrc(){
        if (hasLoaded)
            return allData.entertainment.albumArt
        else
            return ""
    }

    function isPaused(){
        if (hasLoaded)
            return allData.entertainment.paused
        else
            return ""
    }

    function stationText(){
        if (hasLoaded && allData.entertainment.mode == Entertainment.Radios)
            return allData.entertainment.station
        else
            return ""
    }

    function lm(){}

    function lu(){
        allData.entertainment.next()
    }

    function ld(){
        allData.entertainment.previous()
    }
}
