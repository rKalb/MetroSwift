import QtQuick 1.1
import CarData 1.0
import Config 1.0
import Racer 1.0


Rectangle {
    id: controller
    color: "#222222"
    width: 1000
    height: 330

    property Racer racer: allData.racer
    property bool switcher: false

    Rectangle {
        id: speedLimitSliderContainer
        y: 20
        height: 16

        radius: 8
        anchors.right: parent.right
        anchors.rightMargin: 100
        anchors.left: parent.left
        anchors.leftMargin: 150
        anchors.top: parent.top
        anchors.topMargin: 20
        opacity: 0.7
        smooth: true
        gradient: Gradient {
            GradientStop { position: 0.0; color: "gray" }
            GradientStop { position: 1.0; color: "white" }
        }


        Item {
            id: keyHandler
            focus: true
            Keys.onPressed:  {
                if (event.key == Qt.Key_E) {
                    Qt.quit()
                }
            }
        }

        Rectangle {
            id: speedLimitSlider
            x: 1; y: 1; width: 30; height: 14
            radius: 6
            smooth: true
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#424242" }
                GradientStop { position: 1.0; color: "black" }
            }

            MouseArea {
                anchors.fill: parent
                anchors.margins: -16 // Increase mouse area a lot outside the slider
                drag.target: parent
                drag.axis: Drag.XAxis
                drag.minimumX: 2
                drag.maximumX: speedLimitSliderContainer.width - 32
                onPositionChanged: {
                    allData.carData.speedLimit = (speedLimitSlider.x * 16 / (speedLimitSliderContainer.width - 32))
                }
            }
        }

        Text {
            id: speedLimitText
            y: 622
            width: 25
            height: 14
            color: "#ffffff"
            text: qsTr("Speed Limit")
            anchors.left: parent.left
            anchors.leftMargin: -120
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            font.pixelSize: 14
            font.bold: true
        }
    }
    Rectangle {
        id: currentSpeedSliderContainer
        height: 16

        radius: 8
        anchors.right: parent.right
        anchors.rightMargin: 100
        anchors.left: parent.left
        anchors.leftMargin: 150
        anchors.top: parent.top
        anchors.topMargin: 60
        opacity: 0.7
        smooth: true
        gradient: Gradient {
            GradientStop { position: 0.0; color: "gray" }
            GradientStop { position: 1.0; color: "white" }
        }
        Rectangle {
            id: currentSpeedSlider
            x: 1; y: 1; width: 30; height: 14
            radius: 6
            smooth: true
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#424242" }
                GradientStop { position: 1.0; color: "black" }
            }

            MouseArea {
                anchors.fill: parent
                anchors.margins: -16 // Increase mouse area a lot outside the slider
                drag.target: parent
                drag.axis: Drag.XAxis
                drag.minimumX: 2
                drag.maximumX: currentSpeedSliderContainer.width - 32
                onPositionChanged: {
                    allData.carData.currentSpeed = currentSpeedSlider.x * allData.config.topSpeed / (currentSpeedSliderContainer.width - 32.0)
                }
            }
        }

        Text {
            id: currentSpeedText
            y: 593
            width: 25
            height: 14
            color: "#ffffff"
            text: qsTr("Current Speed")
            anchors.left: parent.left
            anchors.leftMargin: -120
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            font.pixelSize: 14
            font.bold: true
        }

        CheckBox{
            id: currentSpeedCheckBox
            anchors.right: parent.right
            anchors.rightMargin: -25
        }

    }

    Rectangle {
        id: fuelSliderContainer
        height: 16

        radius: 8
        anchors.right: parent.right
        anchors.rightMargin: 100
        anchors.left: parent.left
        anchors.leftMargin: 150
        anchors.top: parent.top
        anchors.topMargin: 100
        opacity: 0.7
        smooth: true
        gradient: Gradient {
            GradientStop { position: 0.0; color: "gray" }
            GradientStop { position: 1.0; color: "white" }
        }
        Rectangle {
            id: fuelSlider
            x: 1; y: 1; width: 30; height: 14
            radius: 6
            smooth: true
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#424242" }
                GradientStop { position: 1.0; color: "black" }
            }

            MouseArea {
                anchors.fill: parent
                anchors.margins: -16 // Increase mouse area a lot outside the slider
                drag.target: parent
                drag.axis: Drag.XAxis
                drag.minimumX: 2
                drag.maximumX: fuelSliderContainer.width - 32
                onPositionChanged: {
                    allData.carData.fuelPercent = fuelSlider.x * 100.0 / (fuelSliderContainer.width - 32.0)
                }
            }
        }

        Text {
            id: fuelText
            y: 593
            width: 25
            height: 14
            color: "#ffffff"
            text: qsTr("Fuel Percent")
            anchors.left: parent.left
            anchors.leftMargin: -120
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            font.pixelSize: 14
            font.bold: true
        }
    }

    Rectangle {
        id: oilTempSliderContainer
        x: 150
        y: 140
        height: 16

        radius: 8
        anchors.right: parent.right
        anchors.rightMargin: 100
        anchors.left: parent.left
        anchors.leftMargin: 150
        anchors.top: parent.top
        anchors.topMargin: 140
        opacity: 0.7
        smooth: true
        gradient: Gradient {
            GradientStop { position: 0.0; color: "gray" }
            GradientStop { position: 1.0; color: "white" }
        }
        Rectangle {
            id: oilTempSlider
            x: 1; y: 1; width: 30; height: 14
            radius: 6
            smooth: true
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#424242" }
                GradientStop { position: 1.0; color: "black" }
            }

            MouseArea {
                anchors.fill: parent
                anchors.margins: -16 // Increase mouse area a lot outside the slider
                drag.target: parent
                drag.axis: Drag.XAxis
                drag.minimumX: 2
                drag.maximumX: oilTempSliderContainer.width - 32
                onPositionChanged: {
                    allData.carData.oilTemp = oilTempSlider.x * 100.0 / (oilTempSliderContainer.width - 32.0)
                }
            }
        }

        Text {
            id: oilTempText
            y: 793
            width: 25
            height: 14
            color: "#ffffff"
            text: qsTr("Oil Temperature")
            anchors.left: parent.left
            anchors.leftMargin: -120
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            font.pixelSize: 14
            font.bold: true
        }
    }

    Rectangle {
        id: currentDistanceSliderContainer
        height: 16

        radius: 8
        anchors.right: parent.right
        anchors.rightMargin: 100
        anchors.left: parent.left
        anchors.leftMargin: 150
        anchors.top: parent.top
        anchors.topMargin: 180
        opacity: 0.7
        smooth: true
        gradient: Gradient {
            GradientStop { position: 0.0; color: "gray" }
            GradientStop { position: 1.0; color: "white" }
        }
        Rectangle {
            id: currentDistanceSlider
            x: 1; y: 1; width: 30; height: 14
            radius: 6
            smooth: true
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#424242" }
                GradientStop { position: 1.0; color: "black" }
            }

            MouseArea {
                anchors.fill: parent
                anchors.margins: -16 // Increase mouse area a lot outside the slider
                drag.target: parent
                drag.axis: Drag.XAxis
                drag.minimumX: 2
                drag.maximumX: currentDistanceSliderContainer.width - 32
                onPositionChanged: {
                    allData.carData.currentDistance = (allData.carData.currentDistance + 1.1)
                }
            }
        }

        Text {
            id: currentDistanceText
            y: 793
            width: 25
            height: 14
            color: "#ffffff"
            text: qsTr("Current Distance")
            anchors.left: parent.left
            anchors.leftMargin: -120
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            font.pixelSize: 14
            font.bold: true
        }
    }

    Rectangle {
        id: tachSliderContainer
        height: 16

        radius: 8
        anchors.right: parent.right
        anchors.rightMargin: 100
        anchors.left: parent.left
        anchors.leftMargin: 150
        anchors.top: parent.top
        anchors.topMargin: 220
        opacity: 0.7
        smooth: true
        gradient: Gradient {
            GradientStop { position: 0.0; color: "gray" }
            GradientStop { position: 1.0; color: "white" }
        }
        Rectangle {
            id: tachSlider
            x: 1; y: 1; width: 30; height: 14
            radius: 6
            smooth: true
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#424242" }
                GradientStop { position: 1.0; color: "black" }
            }

            MouseArea {
                anchors.fill: parent
                anchors.margins: -16 // Increase mouse area a lot outside the slider
                drag.target: parent
                drag.axis: Drag.XAxis
                drag.minimumX: 2
                drag.maximumX: tachSliderContainer.width - 32
                onPositionChanged: {
                    allData.carData.tachometer = Math.round((tachSlider.x * allData.config.redLine / 10) / (tachSliderContainer.width - 32.0)) * 10
                }
            }
        }

        Text {
            id: tachText
            y: 793
            width: 25
            height: 14
            color: "#ffffff"
            text: qsTr("Tachometer")
            anchors.left: parent.left
            anchors.leftMargin: -120
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            font.pixelSize: 14
            font.bold: true
        }

        CheckBox{
            id: tachCheckBox
            anchors.right: parent.right
            anchors.rightMargin: -25
        }
    }

    Rectangle {
        id: gearSliderContainer
        x: 150
        y: 257
        height: 16

        radius: 8
        anchors.right: parent.right
        anchors.rightMargin: 100
        anchors.left: parent.left
        anchors.leftMargin: 150
        anchors.top: parent.top
        anchors.topMargin: 260
        opacity: 0.7
        smooth: true
        gradient: Gradient {
            GradientStop { position: 0.0; color: "gray" }
            GradientStop { position: 1.0; color: "white" }
        }
        Rectangle {
            id: gearSlider
            x: 1; y: 1; width: 30; height: 14
            radius: 6
            smooth: true
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#424242" }
                GradientStop { position: 1.0; color: "black" }
            }

            MouseArea {
                anchors.fill: parent
                anchors.margins: -16 // Increase mouse area a lot outside the slider
                drag.target: parent
                drag.axis: Drag.XAxis
                drag.minimumX: 2
                drag.maximumX: gearSliderContainer.width - 32
                onPositionChanged: {
                    allData.carData.gear = gearSlider.x * 7 / (gearSliderContainer.width - 32.0)
                }
            }
        }

        Text {
            id: gearText
            y: 793
            width: 25
            height: 14
            color: "#ffffff"
            text: qsTr("Gear")
            anchors.left: parent.left
            anchors.leftMargin: -120
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            font.pixelSize: 14
            font.bold: true
        }
    }
    Item{
        id: signalContainer
        opacity: 0.7
        Text {
            id: leftSignalText
            x: 30
            width: 25
            height: 14
            color: "#ffffff"
            text: qsTr("Left Signal")
            anchors.top: parent.top
            anchors.topMargin: 300
            font.pixelSize: 14
            anchors.left: parent.left
            anchors.leftMargin: 30
            font.bold: true
        }

        CheckBox {
            id: leftSignalCheckBox
            y: 300
            anchors.left: parent.left
            anchors.leftMargin: 115
            onCheckedChanged: {
                allData.carData.signalLeft = leftSignalCheckBox.checked
                if (rightSignalCheckBox.checked){
                    if (switcher)
                        switcher = false
                    else{
                        switcher = true
                        rightSignalCheckBox.checked = false
                    }
                }
            }
        }

        Text {
            id: rightSignalText
            x: 38
            y: -7
            width: 25
            height: 14
            color: "#ffffff"
            text: qsTr("Right Signal")
            font.pixelSize: 14
            anchors.top: parent.top
            anchors.topMargin: 300
            anchors.left: parent.left
            font.bold: true
            anchors.leftMargin: 150
        }

        CheckBox {
            id: rightSignalCheckBox
            y: 300
            anchors.left: parent.left
            anchors.leftMargin: 244
            onCheckedChanged: {
                allData.carData.signalRight = rightSignalCheckBox.checked
                if (leftSignalCheckBox.checked){
                    if (switcher)
                        switcher = false
                    else{
                        switcher = true
                        leftSignalCheckBox.checked = false
                    }
                }
            }
        }
        Text {
            id: manualText
            y: -7
            width: 119
            height: 14
            color: "#ffffff"
            text: qsTr("Manual Gear Box")
            anchors.left: parent.left
            anchors.leftMargin: 400
            font.pixelSize: 14
            anchors.top: parent.top
            anchors.topMargin: 300
            font.bold: true
        }

        CheckBox {
            id: manualCheckBox
            y: 300
            width: 15
            anchors.left: parent.left
            anchors.leftMargin: 525
            checked: true
            onCheckedChanged: {
                allData.config.manual = manualCheckBox.checked
            }
        }
    }



    Item{
        Connections{
            target: racer
            onUpdated:{
                if (currentSpeedCheckBox.checked == false)
                    allData.carData.currentSpeed = racer.speed
                if (tachCheckBox.checked == false)
                    allData.carData.tachometer = racer.rpm
                allData.carData.throttle = racer.throttle
                allData.carData.brake = racer.brake
                allData.carData.gear = racer.gear
            }
        }
    }
}
