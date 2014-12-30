#include "Racer.h"



Racer::Racer(char *ip, int port){
	_socket = new QUdpSocket(this);
	_socket->bind(QHostAddress(ip),port);
	connect(_socket,SIGNAL(readyRead()),this,SLOT(read()));
}

Racer::Racer(QString filename){
	QFile configFile(filename);
	if(!configFile.open(QIODevice::ReadOnly)){
		qDebug() << "error";
	}
	QTextStream in(&configFile);
	in.readLine();
	QString ip = in.readLine();
	in.readLine();
	int port = in.readLine().toInt();

	_socket = new QUdpSocket(this);
	_socket->bind(QHostAddress(ip),port);
	connect(_socket,SIGNAL(readyRead()),this,SLOT(read()));
}


void Racer::read() {
	QByteArray buffer;
	buffer.resize(_socket->pendingDatagramSize());
	QHostAddress sender;
	quint16 senderPort;
	_socket->readDatagram(buffer.data(),buffer.size(),&sender,&senderPort);

	if(buffer[0]=='R' && buffer[1]=='='){
		double temp = buffer.right(buffer.size()-2).toDouble();
		_rpm = temp;
		updated();
	}
	else if(buffer[0]=='S' && buffer[1]=='='){
		double temp = buffer.right(buffer.size()-2).toDouble();
		_speed = temp * 2.23694;  //mps to mph
	}else if(buffer[0]=='T' && buffer[1]=='='){
		double temp = buffer.right(buffer.size()-2).toDouble();
		_throttle = temp;
	}else if(buffer[0]=='B' && buffer[1]=='='){
		double temp = buffer.right(buffer.size()-2).toDouble();
		_brake = temp;
	}else if(buffer[0]=='G' && buffer[1]=='='){
		int temp = buffer.right(buffer.size()-2).toDouble();
		if (temp == 1){
			_gear = 0;
		}
		else if(temp == 0){
			_gear = 1;
		} else {
			_gear = temp;
		}
		updated();
	}
}

double Racer::speed(){
	return _speed;
}

int Racer::rpm(){
	return _rpm;
}

double Racer::throttle(){
	return _throttle;
}

double Racer::brake(){
	return _brake;
}

int Racer::gear(){
	return _gear;
}
