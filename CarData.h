#ifndef CARDATA_H
#define CARDATA_H
#include <QtCore>


/**
 * @brief The CarData class
 *
 * This class is all data that is expected to come from the car (OBD2 or otherwise).
 * It has only basic getters and setters for these properties and the appropriate
 * QML interfaces. The copy constructor and equivalence operator are added to allow
 * for meta objects in Qt. This is filled by the controller and simulator currently.
 *
 */
class CarData : public QObject {
    Q_OBJECT
    Q_PROPERTY(double currentSpeed READ currentSpeed WRITE setCurrentSpeed NOTIFY speedChanged)
    Q_PROPERTY(int speedLimit READ speedLimit WRITE setSpeedLimit NOTIFY limitChanged)
    Q_PROPERTY(double fuelPercent READ fuelPercent WRITE setFuelPercent NOTIFY fuelChanged)
    Q_PROPERTY(float currentDistance READ currentDistance WRITE setCurrentDistance NOTIFY currentDistanceChanged)
    Q_PROPERTY(double oilTemp READ oilTemp WRITE setOilTemp NOTIFY oilTempChanged)
    Q_PROPERTY(float outdoorTemp READ outdoorTemp WRITE setOutdoorTemp NOTIFY outdoorTempChanged)
    Q_PROPERTY(int tachometer READ tachometer WRITE setTachometer NOTIFY tachometerChanged)
    Q_PROPERTY(int gear READ gear WRITE setGear NOTIFY gearChanged)
	Q_PROPERTY(bool signalLeft READ signalLeft WRITE setSignalLeft NOTIFY signalLeftChanged)
	Q_PROPERTY(bool signalRight READ signalRight WRITE setSignalRight NOTIFY signalRightChanged)
	Q_PROPERTY(double throttle READ throttle WRITE setThrottle NOTIFY throttleChanged)
	Q_PROPERTY(double brake READ brake WRITE setBrake NOTIFY brakeChanged)

public:
    CarData(QObject *parent = 0) : QObject(parent) {
        _currentSpeed = 0;
        _speedLimit = 0;
		_fuelPercent = 70;
        _currentDistance = 0;
		_oilTemp = 40;
        _outdoorTemp = 0;
        _tachometer = 0;
        _gear = 0;
		_signalLeft = false;
		_signalRight = false;
		_throttle = 0;
		_brake = 0;
    }

	CarData (const CarData& rhs) : QObject(){
        _currentSpeed = rhs._currentSpeed;
        _speedLimit = rhs._speedLimit;
        _fuelPercent = rhs._fuelPercent;
        _currentDistance = rhs._currentDistance;
        _oilTemp = rhs._oilTemp;
        _outdoorTemp = rhs._outdoorTemp;
        _tachometer = rhs._tachometer;
        _gear = rhs._gear;
		_signalLeft = rhs._signalLeft;
		_signalRight = rhs._signalRight;
		_throttle = rhs._throttle;
		_brake = rhs._brake;
    }

    CarData& operator= (const CarData& rhs){
        _currentSpeed = rhs._currentSpeed;
        _speedLimit = rhs._speedLimit;
        _fuelPercent = rhs._fuelPercent;
        _currentDistance = rhs._currentDistance;
        _oilTemp = rhs._oilTemp;
        _outdoorTemp = rhs._outdoorTemp;
        _tachometer = rhs._tachometer;
        _gear = rhs._gear;
		_signalLeft = rhs._signalLeft;
		_signalRight = rhs._signalRight;
		_throttle = rhs._throttle;
		_brake = rhs._brake;
        return *this;
    }

    void setCurrentSpeed(double currentSpd) {
        _currentSpeed = currentSpd;
        speedChanged();
    }

    double currentSpeed() {
        return _currentSpeed;
    }

    void setSpeedLimit(int spdLimit) {
        _speedLimit = spdLimit;
        limitChanged();
    }

    int speedLimit(){
        return _speedLimit;
    }

    void setFuelPercent(double fuel) {
        _fuelPercent = fuel;
        fuelChanged();
    }

    double fuelPercent(){
        return _fuelPercent;
    }

    void setCurrentDistance(double currentDist) {
        _currentDistance = currentDist;
        currentDistanceChanged();
    }

    float currentDistance(){
        return _currentDistance;
    }

    void setOilTemp(double temp) {
        _oilTemp = temp;
        oilTempChanged();
    }

    double oilTemp(){
        return _oilTemp;
    }

    void setOutdoorTemp(double temp) {
        _outdoorTemp = temp;
        outdoorTempChanged();
    }

    double outdoorTemp(){
        return _outdoorTemp;
    }

    void setTachometer(int tach) {
        _tachometer = tach;
        tachometerChanged();
    }

    double tachometer(){
        return _tachometer;
    }

    void setGear(int gear) {
        _gear = gear;
        gearChanged();
    }

    double gear(){
        return _gear;
    }

	void setSignalRight(bool signalRight){
		_signalRight = signalRight;
		signalRightChanged();
	}

	bool signalRight(){
		return _signalRight;
	}

	void setSignalLeft(bool signalLeft){
		_signalLeft = signalLeft;
		signalLeftChanged();
	}

	bool signalLeft(){
		return _signalLeft;
	}

	void setThrottle(double throttle){
		_throttle = throttle;
		throttleChanged();
	}

	double throttle(){
		return _throttle;
	}

	void setBrake(double brake){
		_brake = brake;
		brakeChanged();
	}

	double brake(){
		return _brake;
	}

signals:
    void speedChanged();
    void limitChanged();
    void fuelChanged();
    void currentDistanceChanged();
    void oilTempChanged();
    void outdoorTempChanged();
    void tachometerChanged();
	void gearChanged();
	void signalLeftChanged();
	void signalRightChanged();
	void throttleChanged();
	void brakeChanged();

private:
    double _currentSpeed;
    int _speedLimit;
    double _fuelPercent;
    float _currentDistance;
    double _oilTemp;
    float _outdoorTemp;
    int _tachometer;
    int _gear;
	bool _signalLeft;
	bool _signalRight;
	double _throttle;
	double _brake;
};
#endif
