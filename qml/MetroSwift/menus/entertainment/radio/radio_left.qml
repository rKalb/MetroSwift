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
            x: 7
            y: 100
            color: "#ffffff"
            text: stationText()
            font.family: "Segoe UI Light"
            font.pixelSize: 47
        }

        Text {
            x: 26
            y: 162
            width: 274
            height: 117
            color: "#ffffff"
            text: artistText()
            wrapMode: Text.WordWrap
            font.family: "Segoe UI Light"
            font.pixelSize: 38
        }

        Text {
            x: 63
            y: 279
            width: 232
            height: 92
            color: "#ffffff"
            text: trackText()
            anchors.right: parent.right
            anchors.rightMargin: 20
            wrapMode: Text.WordWrap
            horizontalAlignment: Text.AlignRight
            font.family: "Segoe UI Light"
            font.pixelSize: 24
        }

        Text {
            x: 7
            y: -9
            color: "#ffffff"
            text: "Radio"
            font.pixelSize: 70
            font.family: "Segoe UI Light"
        }
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

    function stationText(){
        if (hasLoaded)
            return allData.entertainment.station
        else
            return ""
    }

    function loaded(){
        allData.entertainment.mode = Entertainment.Radios
        hasLoaded = true
    }


    function lb(){

    }

    function lu(){
        allData.entertainment.next()
    }

    function ld(){
        allData.entertainment.previous()
    }

    function rt(){
        if (allData.menu.buttonLeftToggleTitle == "Scan +/-"){
            allData.menu.buttonLeftToggleTitle = "Preset +/-"
            allData.menu.buttonRightTopTitle = "Scan"
        }
        else {
            allData.menu.buttonLeftToggleTitle = "Scan +/-"
            allData.menu.buttonRightTopTitle = "Presets"
        }
    }

    function rm(){

    }

    function rb(){

    }
}
