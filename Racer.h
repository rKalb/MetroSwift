#ifndef RACER_H
#define RACER_H

#include <QtCore>
#include <QUdpSocket>

class Racer : public QObject {
	Q_OBJECT
	Q_PROPERTY(double speed READ speed NOTIFY updated)
	Q_PROPERTY(int rpm READ rpm NOTIFY updated)
	Q_PROPERTY(double throttle READ throttle NOTIFY updated)
	Q_PROPERTY(double brake READ brake NOTIFY updated)
	Q_PROPERTY(int gear READ gear NOTIFY updated)

public:
	Racer(QObject *parent = 0) : QObject(parent){}


	Racer(const Racer& racer) : QObject(){
		_socket = racer._socket;
		_speed = racer._speed;
		_throttle = racer._throttle;
		_brake = racer._brake;
		_rpm = racer._rpm;
		_gear = racer._gear;
	}

	Racer& operator =(const Racer& racer){
		_socket = racer._socket;
		_speed = racer._speed;
		_throttle = racer._throttle;
		_brake = racer._brake;
		_rpm = racer._rpm;
		_gear = racer._gear;
		return *this;
	}

	Racer(char *ip, int port);
	Racer(QString filename);

	double speed();
	int rpm();
	double throttle();
	double brake();
	int gear();


public slots:
	void read();

signals:
	void updated();

private:
	QUdpSocket *_socket;
	double _speed;
	int _rpm;
	double _throttle;
	double _brake;
	int _gear;
};

#endif // RACER_H
