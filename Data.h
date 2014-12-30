#ifndef DATA_H
#define DATA_H

#include <QtCore>
#include "Menu.h"
#include "CarData.h"
#include "Odometer.h"
#include "Entertainment.h"
#include "Climate.h"
#include "Settings.h"
#include "Config.h"
#include "Racer.h"
#include "Game.h"

/**
 * @brief The Data class
 *
 * This is the meta object which gets passed around through all QML objects.
 * It contains all information for the whole program.
 * i.e. it has pointers to each type of object which the system uses.
 * This has getters for each type which the car needs.
 *
 * It is a meta-object so that each item can be retrieved and viewed from QML.
 *
 * See main.cpp for how meta-objects are defined.
 *
 */
class Data : public QObject {
    Q_OBJECT
    Q_PROPERTY(CarData* carData READ carData NOTIFY carDataChanged)
    Q_PROPERTY(Menu* menu READ menu NOTIFY menuChanged)
    Q_PROPERTY(Odometer* odometer READ odometer NOTIFY odometerChanged)
    Q_PROPERTY(Entertainment* entertainment READ entertainment NOTIFY entertainmentChanged)
    Q_PROPERTY(Climate* climate READ climate NOTIFY climateChanged)
    Q_PROPERTY(Settings* settings READ settings NOTIFY settingsChanged)
    Q_PROPERTY(Config* config READ config NOTIFY configChanged)
	Q_PROPERTY(Racer* racer READ racer NOTIFY racerChanged)
	Q_PROPERTY(Game* game READ game NOTIFY theGameHasChanged)

public:

    /**
     * @brief Data
     * @param parent
     *
     * This is the ctor for the Data object.
     *
     * Menu, Odometer, Config, Racer, and Game all need to point to respected files.
     *
     * The odometer takes in the settings object to connect to the reset trip signal.
     *
     * The gamification object uses info from the carData and the config file to determine the score.
     *
     */
    Data(QObject *parent = 0) : QObject(parent) {
        _carData = new CarData();
        _menu = new Menu("qml\\MetroSwift\\menus\\main.menu");
        _entertainment = new Entertainment();
        _climate = new Climate();
        _settings = new Settings();
		_odometer = new Odometer("qml\\MetroSwift\\miles.config", _settings);
        _config = new Config("qml\\MetroSwift\\config.config");
		_racer = new Racer("qml\\MetroSwift\\racer.config");
        _game = new Game(_carData, _config, "qml\\MetroSwift\\highscores.config");
    }

    CarData* carData(){
        return _carData;
    }

    Menu* menu(){
        return _menu;
    }

    Odometer* odometer(){
        return _odometer;
    }

    Entertainment* entertainment(){
        return _entertainment;
    }

    Climate* climate(){
        return _climate;
    }

    Settings* settings(){
        return _settings;
    }

    Config* config(){
        return _config;
    }

	Racer* racer(){
		return _racer;
	}

	Game* game(){
		return _game;
	}

signals:
    void carDataChanged();
    void menuChanged();
    void odometerChanged();
    void entertainmentChanged();
    void climateChanged();
    void settingsChanged();
    void configChanged();
	void racerChanged();
	void theGameHasChanged();

private:
    CarData *_carData;
    Menu *_menu;
    Odometer *_odometer;
    Entertainment *_entertainment;
    Climate *_climate;
    Settings *_settings;
    Config *_config;
	Racer *_racer;
	Game *_game;
};
#endif // DATA_H
