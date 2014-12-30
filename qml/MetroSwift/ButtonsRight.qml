import QtQuick 1.1
import Menu 1.0

Rectangle {
    width: 90
    height: 480
    color: "#82000000"

    property string slash : "\\"

    property string rightTopImgProp : "menus" + slash + menu.buttonRightTopSrc
    property string rightMidImgProp : "menus" + slash + menu.buttonRightMidSrc
    property string rightBottomImgProp : "menus" + slash + menu.buttonRightBottomSrc

    property string rightTopTextProp : menu.buttonRightTopTitle
    property string rightMidTextProp : menu.buttonRightMidTitle
    property string rightBottomTextProp : menu.buttonRightBottomTitle

    Image {
        id: rightTopImg
        width: 80
        height: 80
        anchors.right: parent.right
        anchors.rightMargin: 5
        anchors.top: parent.top
        anchors.topMargin: 0
        source: rightTopImgProp
    }

    Image {
        id: rightMidImg
        y: 120
        width: 80
        height: 80
        anchors.right: parent.right
        anchors.rightMargin: 5
        source: rightMidImgProp
    }

    Image {
        id: rightBottomImg
        y: 240
        width: 80
        height: 80
        anchors.right: parent.right
        anchors.rightMargin: 5
        source: rightBottomImgProp
    }

    Image {
        id: volumeImage
        y: 360
        width: 80
        height: 80
        source: "content/images/main/volume.png"
        anchors.rightMargin: 5
        anchors.right: parent.right
    }

    Text {
        id: rightTopText
        y: 70
        width: 88
        height: 40
        color: "#ffffff"
        text: rightTopTextProp
        wrapMode: Text.WordWrap
        anchors.right: parent.right
        anchors.rightMargin: 0
        font.pixelSize: 14
        font.family: "Segoe UI Light"
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        id: rightMidText
        y: 190
        width: 88
        height: 40
        color: "#ffffff"
        text: rightMidTextProp
        wrapMode: Text.WordWrap
        anchors.right: parent.right
        anchors.rightMargin: 0
        font.pixelSize: 14
        font.family: "Segoe UI Light"
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        id: rightBottomText
        y: 310
        width: 88
        height: 40
        color: "#ffffff"
        text: rightBottomTextProp
        wrapMode: Text.WordWrap
        anchors.right: parent.right
        anchors.rightMargin: 0
        font.pixelSize: 14
        font.family: "Segoe UI Light"
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        id: volumeText
        y: 430
        width: 88
        height: 40
        color: "#ffffff"
        text: qsTr("Volume +/-")
        wrapMode: Text.WordWrap
        anchors.right: parent.right
        anchors.rightMargin: 0
        font.pixelSize: 14
        font.family: "Segoe UI Light"
        horizontalAlignment: Text.AlignHCenter
    }
}
