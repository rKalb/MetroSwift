#ifndef CLIMATE_H
#define CLIMATE_H
#include <QtCore>

class Climate : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int temp READ temp WRITE setTemp NOTIFY tempChanged)
    Q_PROPERTY(int fanSpeed READ fanSpeed WRITE setFanSpeed NOTIFY fanSpeedChanged)
	Q_PROPERTY(int fanMode READ fanMode NOTIFY fanModeChanged)
	Q_PROPERTY(int defrost READ defrost NOTIFY defrostChanged)
	Q_PROPERTY(bool ac READ ac NOTIFY acChanged)


public:
    Climate(QObject *parent = 0) : QObject(parent) {
        _temp = 69;
		_fanSpeed = 4;
		_fanMode = 0;
		_defrost = 0;
		_ac = false;
    }

	Climate(const Climate& ent) : QObject(){
        _temp = ent._temp;
        _fanSpeed = ent._fanSpeed;
		_fanMode = ent._fanMode;
		_defrost = ent._defrost;
		_ac = ent._ac;
    }

    Climate& operator=(const Climate& ent){
        _temp = ent._temp;
        _fanSpeed = ent._fanSpeed;
		_fanMode = ent._fanMode;
		_defrost = ent._defrost;
		_ac = ent._ac;
        return *this;
    }

    int temp() {
        return _temp;
    }

    /**
     * @brief setTemp
     * @param temp
     *
     * Sets the temp, doesn't let it go outside the range 50-80.
     */
    void setTemp(int temp){
        if (temp > 80)
            _temp = 80;
        else if (temp < 50)
            _temp = 50;
        else
            _temp = temp;
        tempChanged();
    }

    int fanSpeed() {
        return _fanSpeed;
    }

    /**
     * @brief setFanSpeed
     * @param fanSpeed
     *
     * Sets the fan speed, doesn't allow it outside the range 0-6.
     */
    void setFanSpeed(int fanSpeed){
        if (fanSpeed > 6)
            _fanSpeed = 6;
        else if (fanSpeed < 0)
            _fanSpeed = 0;
        else
            _fanSpeed = fanSpeed;
        fanSpeedChanged();
    }

    /**
     * @brief fanMode
     * @return fan mode.
     *
     * 0 = head
     * 1 = feet
     * 2 = head and feet
     *
     */
	int fanMode(){
		return _fanMode;
	}

    /**
     * Rotates through fan modes.
     *
     * 0 = head
     * 1 = feet
     * 2 = head and feet
     *
     */
	Q_INVOKABLE void nextFanMode(){
		if (_fanMode == 2){
			_fanMode = 0;
		}
		else {
			_fanMode++;
		}
		fanModeChanged();
	}


    /**
     * @brief defrost
     * @return defrost mode
     *
     * 0 = off
     * 1 = front
     * 2 = back
     * 3 = front and back
     *
     */
	int defrost(){
		return _defrost;
	}

    /**
     * Rotates defrost modes
     *
     * 0 = off
     * 1 = front
     * 2 = back
     * 3 = front and back
     */
	Q_INVOKABLE void nextDefrostMode(){
		if (_defrost == 3){
			_defrost = 0;
		}
		else {
			_defrost++;
		}
		defrostChanged();
	}

    /**
     * @brief ac
     * @return is ac on
     */
	bool ac(){
		return _ac;
	}

    /**
     * Flips ac on/off
     */
	Q_INVOKABLE void switchAC(){
		_ac = !_ac;
		acChanged();
	}



signals:
    void tempChanged();
    void fanSpeedChanged();
	void fanModeChanged();
	void defrostChanged();
	void acChanged();

private:
    int _temp;
    int _fanSpeed;
	int _fanMode;
	int _defrost;
	bool _ac;

};

#endif // CLIMATE_H
