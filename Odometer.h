#ifndef ODOMETER_H
#define ODOMETER_H

#include <QtCore>
#include "Settings.h"

class Odometer : public QObject {
    Q_OBJECT
    Q_PROPERTY(double odom READ odom NOTIFY odometerChanged)
    Q_PROPERTY(double trip READ trip NOTIFY tripChanged)



public:

    Odometer(QObject *parent = 0) : QObject(parent) {
        _odometer = 0;
        _trip = 0;
    }

    /**
     * @brief Odometer
     * @param filename
     * @param settings - needs the settings param to connect to the reset trip signal.
     */
	Odometer(const QString filename, Settings* settings){
        _odometer = 0;
        _trip = 0;
		connect(settings, SIGNAL(resetTrip()), this, SLOT(resetTrip()));
        readFromFile(filename);
    }

	Odometer(const Odometer& odometer) : QObject(){
        _odometer = 0;
        _trip = 0;
        _filename = odometer._filename;
        readFromFile(_filename);
    }

    Odometer& operator=(const Odometer& odometer){
        _odometer = 0;
        _trip = 0;
        _filename = odometer._filename;
        readFromFile(_filename);

        return *this;
    }

    double odom(){
        return _odometer;
    }

    double trip(){
        return _trip;
    }

    Q_INVOKABLE void writeMileage(const double odometer, const double trip) {
        writeToFile(odometer, trip);
    }

    Q_INVOKABLE void readMileage(const QString filename) {
        readFromFile(filename);
    }

    void readFromFile(const QString filename){
        _filename = filename;
        QFile odomfile(filename);
        if(!odomfile.open(QIODevice::ReadOnly)){
            qDebug() << "error";
        }

        QTextStream in(&odomfile);

        _odometer = in.readLine().toDouble();
        _trip = in.readLine().toDouble();

        odomfile.close();
    }

    void writeToFile(const double odometer, const double trip){
        if (_filename == ""){
            qDebug() << "error";
        } else {
            QFile odomfile(_filename);
            if(!odomfile.open(QIODevice::WriteOnly | QIODevice::Truncate)){
                qDebug() << "error";
            }

            QTextStream out(&odomfile);

            out << odometer << endl;
            out << trip << endl;

            odomfile.close();
        }
    }

private slots:
	void resetTrip(){
		_trip = 0;
		writeToFile(_odometer, 0);
		tripChanged();
	}


signals:
    void odometerChanged();
    void tripChanged();

private:
    QString _filename;
    double _odometer;
    double _trip;


};
#endif // ODOMETER_H
