import QtQuick 1.1
import Data 1.0
import Entertainment 1.0

Rectangle {
    id: rectangle2
    width: 325
    height: 440
    color: "#00000000"

    property Data allData

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
            x: 4
            y: 22
            color: "#ffffff"
            text: "Radio"
            anchors.top: parent.top
            anchors.topMargin: 15
            anchors.left: parent.left
            anchors.leftMargin: 20
            font.family: "Segoe UI Light"
            font.pixelSize: 60
        }

        Text {
            x: 2
            y: 160
            color: "#ffffff"
            text: "Back"
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.top: parent.top
            anchors.topMargin: 135
            font.pixelSize: 60
            font.family: "Segoe UI Light"
        }

        Text {
            x: 4
            y: 290
            color: "#ffffff"
            text: "CD"
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.top: parent.top
            anchors.topMargin: 245
            font.pixelSize: 60
            font.family: "Segoe UI Light"
        }
    }
    function loaded(){}

    function lt(){
        allData.entertainment.mode = Entertainment.Radios
        menu.updateMenu("qml/MetroSwift/menus/entertainment/entertainment.menu")
    }

    function lb(){
        allData.entertainment.mode = Entertainment.Cds
        menu.updateMenu("qml/MetroSwift/menus/entertainment/entertainment.menu")
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
