import QtQuick 1.1
import Data 1.0
import Settings 1.0

Rectangle {
    id: rectangle1
    width: 325
    height: 440
    color: "#00000000"
	
    property Data allData
    property Settings settings
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
    }

    Text {
        id: setting1
        y: 30
        color: "#ffffff"
        font.bold: true
        font.pixelSize: 35
        font.family: "Segoe UI Light"
        text: setting1Title()
        anchors.left: parent.left
        anchors.leftMargin: 15
    }

    Text {
        id: setting2
        y: 100
        color: "#ffffff"
        anchors.left: parent.left
        anchors.leftMargin: 35
        font.pixelSize: 23
        font.family: "Segoe UI Light"
    }

    Text {
        id: setting3
        y: 170
        color: "#ffffff"
        anchors.left: parent.left
        anchors.leftMargin: 35
        font.pixelSize: 23
        font.family: "Segoe UI Light"
    }

    Text {
        id: setting4
        y: 240
        color: "#ffffff"
        anchors.left: parent.left
        anchors.leftMargin: 35
        font.pixelSize: 23
        font.family: "Segoe UI Light"
    }

    Text {
        id: setting5
        y: 310
        color: "#ffffff"
        anchors.left: parent.left
        anchors.leftMargin: 35
        font.pixelSize: 23
        font.family: "Segoe UI Light"
    }

    function loaded(){
        hasLoaded = true
        settings = allData.settings
        updateTitles()
    }

    function setting1Title(){
        if (hasLoaded) {
            return allData.settings.currentSettingTitle
        }
        return ""
    }


    function updateTitles(){
        allData.settings.resetTitleCount()
        setting2.text = allData.settings.getNextTitle()
        setting3.text = allData.settings.getNextTitle()
        setting4.text = allData.settings.getNextTitle()
        setting5.text = allData.settings.getNextTitle()
    }

    Connections{
        target: settings
        onSettingChanged:{
            updateTitles()
        }
    }
}
