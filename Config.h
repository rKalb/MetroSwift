#ifndef CONFIG_H
#define CONFIG_H

#include <QtCore>

/**
 * @brief The Config class
 *
 * Reads a config file to set various parameters.
 * A bunch of getters.
 *
 *
 * See read config.
 *
 */
class Config : public QObject {
    Q_OBJECT
    Q_PROPERTY(int redLine READ redLine NOTIFY updated)
    Q_PROPERTY(int redLineArea READ redLineArea NOTIFY updated)
    Q_PROPERTY(int topSpeed READ topSpeed NOTIFY updated)
	Q_PROPERTY(bool manual READ manual WRITE setManual NOTIFY updated)
	Q_PROPERTY(double avgMpg READ avgMpg NOTIFY updated)
	Q_PROPERTY(double fuelCapacity READ fuelCapacity NOTIFY updated)
    Q_PROPERTY(double drivingCoefficient READ drivingCoefficient NOTIFY updated)
public:
    Config(QObject *parent = 0) : QObject(parent){
        _redLine = 0;
        _redLineArea = 0;
		_topSpeed = 0;
		_avgMpg = 4;
		_manual = false;
		_fuelCapacity = 0;
        _drivingCoefficient = 0;
    }

	Config(QString filename){
        readConfig(filename);
    }

	Config(const Config& config) : QObject(){
        _redLine = config._redLine;
        _redLineArea = config._redLineArea;
        _topSpeed = config._topSpeed;
		_manual = config._manual;
		_avgMpg = config._avgMpg;
		_fuelCapacity = config._fuelCapacity;
    }

    Config& operator =(const Config &config){
        _redLine = config._redLine;
        _redLineArea = config._redLineArea;
        _topSpeed = config._topSpeed;
		_manual = config._manual;
		_avgMpg = config._avgMpg;
		_fuelCapacity = config._fuelCapacity;
        return *this;
    }



    /**
     * File Format
     *
     * ::Tachometer Peak::
     * ####
     * ::Red Line Area::
     * ####
     * ::Top Speed::
     * ###
     * ::Automatic(0)/Manual(1)::
     * #
     * ::Average MPG::
     * ##
     * ::Fuel Tank (Gallons)::
     * ##
     * ::Driving Coefficient::
     * 0.#
     *
     * Driving coefficient is the percent of throttle which gets positive driving score.
     *
     * If it takes 60% throttle to get a vehicle moving. 0.7 may be appropriate.
     * If it takes 10% throttle, 0.2 may be appropriate.
     *
     * Red line area is the ammount of area which the tach is pure red from the top of the tach.
     *
     * If tack peak is 7000 and area is 1500, the car red lines from 5500-7000
     *
     */
    Q_INVOKABLE void readConfig(const QString &filename) {
        QFile configFile(filename);
        if(!configFile.open(QIODevice::ReadOnly)){
            qDebug() << "error";
        }

        QTextStream in(&configFile);

        in.readLine();
        _redLine = in.readLine().toInt();
        in.readLine();
        _redLineArea = in.readLine().toInt();
        in.readLine();
        _topSpeed = in.readLine().toInt();
		in.readLine();
		_manual = in.readLine().toInt() == 1;
		in.readLine();
		_avgMpg = in.readLine().toDouble();
		in.readLine();
		_fuelCapacity = in.readLine().toDouble();
        in.readLine();
        _drivingCoefficient = in.readLine().toDouble();

        updated();
        configFile.close();
    }

    int redLine(){
        return _redLine;
    }

    int redLineArea(){
        return _redLineArea;
    }

    int topSpeed(){
        return _topSpeed;
    }

	bool manual(){
		return _manual;
	}

	void setManual(bool manual){
		_manual = manual;
		updated();
	}

	double avgMpg(){
		return _avgMpg;
	}

	double fuelCapacity(){
		return _fuelCapacity;
	}

    double drivingCoefficient(){
        return _drivingCoefficient;
    }

signals:
    void updated();
private:
    int _redLine;
    int _topSpeed;
    int _redLineArea;
	bool _manual;
	double _avgMpg;
	double _fuelCapacity;
    double _drivingCoefficient;
};

#endif // CONFIG_H
