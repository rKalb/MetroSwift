import QtQuick 1.1
import Menu 1.0

Rectangle {
    width: 90
    height: 480
    color: "#82000000"


    property string slash : "\\"
    property string leftTopImgProp : "menus" + slash + menu.buttonLeftTopSrc
    property string leftMidImgProp : "menus" + slash + menu.buttonLeftMidSrc
    property string leftBottomImgProp : "menus" + slash + menu.buttonLeftBottomSrc
    property string leftToggleImgProp : "menus" + slash + menu.buttonLeftToggleSrc

    property string leftTopTextProp : menu.buttonLeftTopTitle
    property string leftMidTextProp : menu.buttonLeftMidTitle
    property string leftBottomTextProp : menu.buttonLeftBottomTitle
    property string leftToggleTextProp : menu.buttonLeftToggleTitle

    Image {
        id: leftTopImg
        width: 80
        height: 80
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 5
        source: leftTopImgProp
    }

   Image {
        id: leftMidImg
        y: 120
        width: 80
        height: 80
        anchors.left: parent.left
        anchors.leftMargin: 5
        source: leftMidImgProp
    }

    Image {
        id: leftBottomImg
        y: 240
        width: 80
        height: 80
        anchors.left: parent.left
        anchors.leftMargin: 5
        source: leftBottomImgProp
    }

    Image {
        id: leftToggleImg
        x: 5
        y: 360
        width: 80
        height: 80
        source: leftToggleImgProp
    }

    Text {
        id: leftTopText
        x: 0
        y: 70
        width: 88
        height: 40
        color: "#ffffff"
        text: leftTopTextProp
        wrapMode: Text.WordWrap
        anchors.left: parent.left
        anchors.leftMargin: 0
        horizontalAlignment: Text.AlignHCenter
        font.family: "Segoe UI Light"
        font.pixelSize: 14
    }

    Text {
        id: leftMidText
        y: 190
        width: 88
        height: 40
        color: "#ffffff"
        text: leftMidTextProp
        wrapMode: Text.WordWrap
        anchors.left: parent.left
        anchors.leftMargin: 0
        font.pixelSize: 14
        font.family: "Segoe UI Light"
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        id: leftBottomText
        y: 310
        width: 88
        height: 40
        color: "#ffffff"
        text: leftBottomTextProp
        wrapMode: Text.WordWrap
        anchors.left: parent.left
        anchors.leftMargin: 0
        font.pixelSize: 14
        font.family: "Segoe UI Light"
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        id: leftToggleText
        y: 430
        width: 88
        height: 40
        color: "#ffffff"
        text: leftToggleTextProp
        wrapMode: Text.WordWrap
        anchors.left: parent.left
        anchors.leftMargin: 0
        font.pixelSize: 14
        font.family: "Segoe UI Light"
        horizontalAlignment: Text.AlignHCenter
    }
}
