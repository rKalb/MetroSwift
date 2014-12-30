import QtQuick 1.1

//Check box item. Has property checked as boolean. Default is unchecked. Gets lighter when checked.
Rectangle {
    id: checkbox
    property bool checked : false

    width: 15
    height: 15
    color: checked ? "#d3d3d3" : "#222222"
    border.width: 3
    border.color: "#000000"

    MouseArea{
        anchors.fill: parent
        anchors.margins: -6
        onClicked: {
            checked = !checked
        }
    }
}
