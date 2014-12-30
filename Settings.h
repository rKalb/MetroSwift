#ifndef SETTINGS_H
#define SETTINGS_H

#include <QtCore>
#include "setting.h"

class Settings : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString currentSettingTitle READ currentSettingTitle NOTIFY settingChanged)
    Q_PROPERTY(QString currentOption READ currentOption NOTIFY optionChanged)
    Q_PROPERTY(QString backgroundImageValue READ backgroundImageValue NOTIFY backgroundImageValueChanged)
	Q_PROPERTY(QString speedometerUnits READ speedometerUnits NOTIFY speedometerUnitsChanged)
	Q_PROPERTY(QString clockMode READ clockMode NOTIFY clockModeChanged)
    Q_PROPERTY(double brightness READ brightness NOTIFY brightnessChanged)

public:
    Settings(QObject *parent = 0) : QObject(parent) {
        _backgroundImage = new Setting("qml\\MetroSwift\\settings\\background.config", true);
        _resetTrip = new Setting("qml\\MetroSwift\\settings\\trip.config", true);
        _speedometerUnits = new Setting("qml\\MetroSwift\\settings\\speedometerUnits.config", true);
        _clockMode = new Setting("qml\\MetroSwift\\settings\\clockMode.config", true);
        _brightness = new Setting("qml\\MetroSwift\\settings\\brightness.config", false);
		_currentSetting = _backgroundImage;
        _cur = 0;
        _currentTitle = 0;
        _numSettings = 5;
    }

    Settings(const Settings& ent) : QObject(){
        _backgroundImage = ent._backgroundImage;
        _currentSetting = ent._currentSetting;
		_speedometerUnits = ent._speedometerUnits;
    }

    Settings& operator=(const Settings& ent){
        _backgroundImage = ent._backgroundImage;
        _currentSetting = ent._currentSetting;
		_speedometerUnits = ent._speedometerUnits;
        return *this;
    }

    QString currentSettingTitle(){
        return _currentSetting->getTitle();
    }

    QString currentOption(){
        return _currentSetting->getName();
    }

    QString backgroundImageValue() {
		return _backgroundImage->getValue();
    }

	QString speedometerUnits(){
		return _speedometerUnits->getValue();
	}

	QString clockMode(){
		return _clockMode->getValue();
	}

    double brightness(){
        return _brightness->getValue().toDouble();
    }

    Q_INVOKABLE void nextSetting(){
		_cur = (_cur + 1) % _numSettings;
		_currentSetting = getSetting(_cur);
        settingChanged();
		optionChanged();
    }

    Q_INVOKABLE void previousSetting(){
        if(_cur <= 0){
            _cur = _numSettings - 1;
        }else{
            _cur--;
        }
		_currentSetting = getSetting(_cur);
        settingChanged();
		optionChanged();
    }

    Q_INVOKABLE void nextOption(){
        _currentSetting->next();
        notifySettingChanged(_cur);
        optionChanged();
    }

    Q_INVOKABLE void previousOption(){
        _currentSetting->previous();
        notifySettingChanged(_cur);
        optionChanged();
    }

    Q_INVOKABLE void resetTitleCount(){
        _currentTitle = _cur;
    }

	Setting* getSetting(int settingNum){
        switch(settingNum){
        case 0:
            return _backgroundImage;
		case 1:
			return _resetTrip;
		case 2:
			return _speedometerUnits;
		case 3:
			return _clockMode;
        case 4:
            return _brightness;
        }
		return NULL;
    }

    void notifySettingChanged(int settingNum){
        switch(settingNum){
        case 0:
            backgroundImageValueChanged();
            break;
		case 1:
			resetTrip();
			break;
		case 2:
			speedometerUnitsChanged();
			break;
		case 3:
			clockModeChanged();
			break;
        case 4:
            brightnessChanged();
            break;
        }
    }

	Q_INVOKABLE QString getNextTitle(){
		_currentTitle = (_currentTitle + 1) % _numSettings;
		return getSetting(_currentTitle)->getTitle();
    }

signals:
    void backgroundImageValueChanged();
	void resetTrip();
	void speedometerUnitsChanged();
	void clockModeChanged();
    void brightnessChanged();
    void settingChanged();
    void optionChanged();

private:
	Setting *_backgroundImage;
	Setting *_resetTrip;
    Setting *_currentSetting;
	Setting *_speedometerUnits;
    Setting *_brightness;
	Setting *_clockMode;
    int _cur;
    int _numSettings;
    int _currentTitle;
};

#endif // SETTINGS_H
