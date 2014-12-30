import QtQuick 1.1
import Data 1.0



Rectangle {
    width: 325
    height: 440
    color: "#00000000"

    property Data allData
    property bool hasLoaded: false
    Rectangle {
        x: 0
        y: 10
        width: 314
        height: 420
        color: "#a0000000"
        anchors.horizontalCenterOffset: 2
        anchors.horizontalCenter: parent.horizontalCenter
        Text {
            id: settingTitle
            x: 20
            y: 89
            width: 2
            height: 0
            color: "#ffffff"
            text: "Settings"
            verticalAlignment: Text.AlignBottom
            horizontalAlignment: Text.AlignLeft
            font.family: "Segoe UI"
            font.pixelSize: 59
        }

        Text {
            id: modifying
            x: 20
            y: 160
            width: 2
            height: 0
            color: "#ffffff"
            text: "Modifying:"
            verticalAlignment: Text.AlignBottom
            horizontalAlignment: Text.AlignLeft
            font.family: "Segoe UI"
            font.pixelSize: 34
        }

        Text {
            id: settingTypeText
            x: 40
            y: 190
            width: 2
            height: 0
            color: "#ffffff"
            text: getTitleText()
            verticalAlignment: Text.AlignBottom
            horizontalAlignment: Text.AlignLeft
            font.family: "Segoe UI"
            font.pixelSize: 22
        }

        Text {
            id: optionText
            x: 40
            y: 310
            width: 2
            height: 0
            color: "#ffffff"
            text: getOptionText()
            verticalAlignment: Text.AlignBottom
            horizontalAlignment: Text.AlignLeft
            font.family: "Segoe UI"
            font.pixelSize: 22
        }

        Text {
            id: modifying1
            x: 20
            y: 280
            width: 2
            height: 0
            color: "#ffffff"
            text: "Current Option:"
            verticalAlignment: Text.AlignBottom
            horizontalAlignment: Text.AlignLeft
            font.family: "Segoe UI"
            font.pixelSize: 34
        }
    }
    function loaded(){
        hasLoaded = true;
    }

    function lt(){
        allData.settings.nextOption()
    }

    function lb(){
        allData.settings.previousOption()
    }

    function lu(){
        allData.entertainment.next()
    }

    function ld(){
        allData.entertainment.previous()
    }

    function rt(){
        allData.settings.nextSetting()
    }

    function rb(){
        allData.settings.previousSetting()
    }

    function getOptionText(){
        if (!hasLoaded){
            return ""
        }
        return allData.settings.currentOption
    }

    function getTitleText(){
        if (!hasLoaded){
            return ""
        }
        return allData.settings.currentSettingTitle
    }
}
