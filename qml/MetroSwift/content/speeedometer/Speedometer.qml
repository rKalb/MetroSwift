import QtQuick 1.1

Item {
    //too self explainitory to comment
    id: speedometer
    property double currentSpeed : allData.carData.currentSpeed
    property int speedLimit : allData.carData.speedLimit * 5
    property double fuelPerent : allData.carData.fuelPercent


    width: 450
    height: 480

    Image {
        id: speedNeedle
        x: 223; y: 110
        z: 1
        scale: 1
        rotation: 0
        smooth: true
        source: "current_speed_needle.png"
        transform: Rotation {
            id: speedNeedleRotation
            origin.x: 1; origin.y: 165
            angle: Math.min(Math.max(-131, currentSpeed * (260 / allData.config.topSpeed) - 131), 130)
            Behavior on angle {
                SpringAnimation {
                    spring: 1.4
                    damping: .15
                }
            }
        }
    }

    Image {
        id: limitNeedle
        x: 225; y: 94
        z: 1
        scale: 1
        visible: speedLimit != 0
        rotation: 0
        smooth: true
        source: "speed_limit_needle.png"
        transform: Rotation {
            id: limitNeedleRotation
            origin.x: 0; origin.y: 180
            angle: Math.min(Math.max(-131, speedLimit * (260 / allData.config.topSpeed) - 131), 130)
            Behavior on angle {
                SpringAnimation {
                    spring: 1.4
                    damping: .15
                }
            }
        }
    }

    Image {
        id: fuelNeedle
        x: 224; y: 53
        z: 1
        scale: 1
        rotation: 0
        smooth: true
        source: "fuel_needle.png"
        transform: Rotation {
            id: fuelNeedleRotation
            origin.x: 0; origin.y: 221

            angle: Math.min(Math.max(41, 95 - fuelPercent * .54), 94)
            Behavior on angle {
                SpringAnimation {
                    spring: 1.4
                    damping: .15
                }
            }
        }
    }

    Image {
        id: oilTempNeedle
        x: 225; y: 53
        z: 1
        scale: 1
        rotation: 0
        smooth: true
        source: "fuel_needle.png"
        transform: Rotation {
            id: oilTempNeedleRotation
            origin.x: 0; origin.y: 221
            angle: 266 + carData.oilTemp * .53
            Behavior on angle {
                SpringAnimation {
                    spring: 1.4
                    damping: .15
                }
            }
        }
    }

    Image {
        id: background
        source: "speedometer_background.png"

        Text {
            id: currentSpeedText
            x: 215
            y: 259
            width: 20
            height: 0
            color: "#d9d9d9"
            text: speedText()
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "Segoe UI"
            smooth: false
            visible: true
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 72
        }

        Text {
            id: speedLimitText
            x: 190
            y: 308
            width: 20
            height: 0
            color: "#d9d9d9"
            visible: speedLimit != 0
            text: speedLimit
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.family: "Segoe UI"
            font.pixelSize: 24
        }

        Text {
            id: unitText
            x: 188
            y: 331
            width: 20
            height: 0
            color: "#d9d9d9"
            text: allData.settings.speedometerUnits
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "Segoe UI"
            anchors.horizontalCenterOffset: 0
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
        }
    }

    Image {
        id: yellowGlow
        visible: speedLimit !== 0
        opacity: Math.min(1, Math.max(0, (currentSpeed - speedLimit) / 10.0))
        source: "yellow_glow.png"
    }

    Image {
        id: redGlow
        visible: speedLimit !== 0
        opacity: Math.min(1, Math.max(0, (currentSpeed - speedLimit - 5) / 10.0))
        source: "red_glow.png"
   }

    Text {
        id: fullLabel
        x: 351
        y: 96
        color: "#ffffff"
        text: qsTr("F")
        font.family: "Segoe UI"
        font.pixelSize: 20
    }

    Text {
        id: emptyLabel
        x: 428
        y: 285
        color: "#ffffff"
        text: qsTr("E")
        font.pixelSize: 20
        font.family: "Segoe UI"
    }

    Text {
        id: hotLabel
        x: 88
        y: 96
        color: "#ffffff"
        text: qsTr("H")
        font.family: "Segoe UI"
        font.pixelSize: 20
    }

    Text {
        id: coldLabel
        x: 7
        y: 285
        color: "#ffffff"
        text: qsTr("C")
        font.pixelSize: 20
        font.family: "Segoe UI"
    }

    Text {
        id: fuelPercentageLabel
        x: 424
        y: 257
        width: 20
        color: "#ffffff"
        text:  Math.round(fuelPercent)
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 15
        font.family: "Segoe UI"
    }

    Image {
        visible: fuelPercent <= 20 && fuelPercent >10
        source: "low_fuel_yellow.png"
    }
    Image {
        visible: fuelPercent <= 10
        source: "low_fuel.png"
    }
    Image {
        visible: carData.oilTemp >= 85
        source: "hot_oil_temp.png"
    }
    Image {
        opacity: Math.max(0, 1 - carData.oilTemp / 20)
        source: "cold_oil_bar.png"
    }
    Image {
        opacity: Math.min(1, Math.max(0, (carData.oilTemp - 60) / 25))
        source: "hot_oil_bar.png"
    }

    function speedText(){
        if (allData.settings.speedometerUnits == "kph"){
            return Math.round(currentSpeed * 1.609344)
        }
        return Math.round(currentSpeed)
    }
}
