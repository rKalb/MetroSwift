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
        anchors.horizontalCenterOffset: 2
        anchors.horizontalCenter: parent.horizontalCenter

        Image {
            id: map
            anchors.rightMargin: 8
            anchors.leftMargin: 8
            anchors.bottomMargin: 5
            anchors.topMargin: 5
            anchors.fill: parent
            source: "menus/navigation/map.png"
        }
    }


    function loaded(){
        hasLoaded = true
    }

    function lt(){}
    function lb(){}
    function rt(){}
    function rm(){}
    function rb(){}

    function lu(){
        allData.entertainment.next()
    }

    function ld(){
        allData.entertainment.previous()
    }
}
