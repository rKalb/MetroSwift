#include "Entertainment.h"

void Entertainment::play(QString filename){
	_audio->stop();
	_audio->setCurrentSource(Phonon::MediaSource("C:\\audio\\"+filename));
	_audio->play();
	_isPlaying = true;
	pauseChanged();
}


void Entertainment::setVolume(double vol){
	_out->setVolume(vol);
}

void Entertainment::playPause(){
	if(_isPlaying){
		_audio->pause();
		_isPlaying = false;
	}else{
		_audio->play();
        _isPlaying = true;
	}
	pauseChanged();
}

void Entertainment::songFinished(){
    if (_mode == Cds)
        play(_cd->nextSong());
    if (_mode == Radios)
        play(_radio->nextSong());
    songUpdated();
}


void Entertainment::next(){
	if (_mode == Cds)
		play(_cd->nextSong());
	if (_mode == Radios){
		_currentRadio = (_currentRadio + 1) % _stationNames.length();
		_radio = new Radio(_stations[_currentRadio]);
		stationUpdated();
		playRadio();
	}
	songUpdated();

}

void Entertainment::previous(){
	if (_mode == Cds)
		play(_cd->previousSong());
	if (_mode == Radios){
		if (_currentRadio == 0){
			_currentRadio = _stationNames.length() - 1;
		} else {
			_currentRadio--;
		}
		_radio = new Radio(_stations[_currentRadio]);
		stationUpdated();
		playRadio();
	}
	songUpdated();
}

void Entertainment::initCd(){
	QFile file("qml\\MetroSwift\\menus\\entertainment\\cd\\cds.txt");
	if(!file.open(QIODevice::ReadOnly)){
		qDebug() << "error";
	}
	QTextStream in(&file);
    _cds = in.readAll().split(QRegExp("[|\\r\\n]+"));

	_currentCd = qrand() % _cds.length();
	_cd = new Cd(_cds[_currentCd]);
}

void Entertainment::playCd(){
	for (int i = 0; i < qrand() % _cd->length(); i++)
		_cd->nextSong();
	play(_cd->previousSong());
}


void Entertainment::initRadio(){
	QFile file("qml\\MetroSwift\\menus\\entertainment\\radio\\stations.txt");
	if(!file.open(QIODevice::ReadOnly)){
		qDebug() << "error";
	}
	QTextStream in(&file);
    QStringList temp = in.readAll().split(QRegExp("[|\\r\\n]+"));

	for (int i = 0; i < temp.length()/2; i++){
		_stations.append(temp[i*2]);
		_stationNames.append(temp[i*2+1]);
	}

	_currentRadio = qrand() % (_stations.length());
	_radio = new Radio(_stations[_currentRadio]);
}


void Entertainment::playRadio(){
	for (int i = 0; i < qrand() % _radio->length(); i++)
		_radio->nextSong();
	play(_radio->previousSong());
}



void Entertainment::nextCd(){
	if (_currentCd >= _cds.length() - 1){
		_currentCd = 0;
	}
	else {
		_currentCd++;
	}

	_cd = new Cd(_cds[_currentCd]);

	for (int i = 0; i < qrand() % _cd->length(); i++)
		_cd->nextSong();
	play(_cd->previousSong());
	songUpdated();
}
