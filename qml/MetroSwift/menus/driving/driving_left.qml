import QtQuick 1.1
import Data 1.0
import Climate 1.0

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
            x: 4
            y: 2
            width: 310
            height: 81
            color: "#ffffff"
            text: "Driving Information"
            style: Text.Normal
            wrapMode: Text.WordWrap
            font.pixelSize: 50
            font.family: "Segoe UI Light"
        }

        Text {
            x: 41
            y: 150
            width: 226
            height: 39
            color: "#ffffff"
            text: "Driving Score"
            wrapMode: Text.WordWrap
            font.family: "Segoe UI Light"
            font.pixelSize: 29
            style: Text.Normal

            Text {
                x: 34
                y: 40
                width: 226
                height: 39
                color: "#ffffff"
                text: delta()
                wrapMode: Text.WordWrap
                font.family: "Segoe UI Light"
                font.pixelSize: 25
                style: Text.Normal
            }
        }

        Text {
            x: 41
            y: 230
            width: 226
            height: 39
            color: "#ffffff"
            text: "Trip Score"
            wrapMode: Text.WordWrap
            font.family: "Segoe UI Light"
            font.pixelSize: 29
            style: Text.Normal

            Text {
                x: 34
                y: 40
                width: 226
                height: 39
                color: "#ffffff"
                text: score()
                wrapMode: Text.WordWrap
                font.family: "Segoe UI Light"
                font.pixelSize: 25
                style: Text.Normal
            }
        }

        Text {
            x: 41
            y: 310
            width: 226
            height: 39
            color: "#ffffff"
            text: "Average MPG"
            wrapMode: Text.WordWrap
            font.family: "Segoe UI Light"
            font.pixelSize: 29
            style: Text.Normal

            Text {
                x: 34
                y: 40
                width: 226
                height: 39
                color: "#ffffff"
                text: mpg()
                wrapMode: Text.WordWrap
                font.family: "Segoe UI Light"
                font.pixelSize: 25
                style: Text.Normal
            }
        }

    }

    function loaded(){
        hasLoaded = true
    }

    function lt(){
        allData.game.score = 1000;
    }

    function lb(){
        allData.game.avgMpg = 0
    }

    function lu(){
        allData.entertainment.next()
    }

    function ld(){
        allData.entertainment.previous()
    }

    function rt(){

    }
    function rm(){

    }
    function rb(){

    }



    function delta(){
        if (hasLoaded)
            return allData.game.delta
        else
            return 0
    }

    function score(){
        if (hasLoaded)
            return allData.game.score
        else
            return 0
    }

    function mpg(){
        if (hasLoaded)
            return Math.round(allData.game.avgMpg*10)/10
        else
            return 0
    }
}
