import QtQuick 1.1
import CarData 1.0
import "content/speeedometer"


Rectangle {
    id: center
    width: 450
    height: 480
    color: "#00000000"

    property double fuelPercent : 70
    property bool signalLeftOn: false
    property bool signalRightOn: false
    property double previousSpeed: 0
    property double temp : 0

    Speedometer {
        id: speedometer
    }

    Rectangle {
        id: verticalBarSmall
        x: 75
        y: 397
        width: 250
        height: 2
        visible: false
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Text {
        id: time
        x: 136
        y: 341
        color: "#ffffff"
        anchors.horizontalCenter: parent.horizontalCenter
        text: (allData.settings.clockMode === "12") ? Qt.formatDateTime(new Date(), "h:mm AP") : Qt.formatDateTime(new Date(), "hh:mm")
        anchors.horizontalCenterOffset: 0
        font.family: "Segoe UI Light"
        font.pointSize: 38
    }

    Text {
        id: date
        x: 133
        y: 400
        color: "#ffffff"
        anchors.horizontalCenter: parent.horizontalCenter
        text: Qt.formatDateTime(new Date(), "dddd, MMMM d, yyyy")
        anchors.horizontalCenterOffset: 0
        font.family: "Segoe UI Light"
        font.pointSize: 14
    }

    Timer {
        //Updates time, date, game score, distance, and fuel every quarter second.
        //Most of these number are quite contrived and need more accuracy
        interval: 250; running: true; repeat: true;
        onTriggered: {
            time.text = (allData.settings.clockMode === "12") ? Qt.formatDateTime(new Date(), "h:mm AP") : Qt.formatDateTime(new Date(), "hh:mm")
            date.text = Qt.formatDateTime(new Date(), "dddd, MMMM d, yyyy")
            allData.game.updateScore();
            //Average of currend speed and previous speed / (1/quarter second in hours)
            allData.carData.currentDistance += (previousSpeed + allData.carData.currentSpeed)/28800
            previousSpeed = allData.carData.currentSpeed
            temp = allData.carData.fuelPercent - (allData.carData.throttle / (allData.config.fuelCapacity * 5))
            if (temp>=0)
                allData.carData.fuelPercent = temp
            else
                allData.carData.fuelPercent = 0
        }
    }


    Image {
        id: signalLeft
        y: 60
        width: 50
        height: 60
        anchors.left: parent.left
        anchors.leftMargin: 10
        visible: signalLeftOn
        opacity: 0.7
        source: "menus/signal_left.png"
    }

    Image {
        id: signalRight
        x: 440
        y: 60
        width: 50
        height: 60
        anchors.right: parent.right
        anchors.rightMargin: 10
        visible: signalRightOn
        opacity: 0.7
        source: "menus/signal_right.png"
    }

    Item {
        Timer {
            //Signal flashing
            interval: 500; running: true; repeat: true
            onTriggered: {
                signalLeftOn = (!signalLeftOn && allData.carData.signalLeft)
                signalRightOn = (!signalRightOn && allData.carData.signalRight)
            }
        }
    }
}
