#include "radio.h"

Radio::Radio(QString filename)
{
	_currentTrack = 0;

	QFile configFile(filename);
	if(!configFile.open(QIODevice::ReadOnly)){
		qDebug() << "error";
	}

	QTextStream in(&configFile);

    QStringList abc = in.readAll().split(QRegExp("[|\\r\\n]+"));
	_numTracks = abc.length()/5;

	for(int i = 0; i < _numTracks; i++){
		_songArtists.append(abc[i*5]);
		_songTitles.append(abc[i*5 + 1]);
		_songPaths.append(abc[i*5 + 2]);
		_coverArt.append(abc[i*5 + 3]);
		_description.append(abc[i*5 + 4]);
	}

	configFile.close();
}


QString Radio::artist(){
	return _songArtists[_currentTrack];
}

int Radio::length(){
	return _numTracks;
}

QString Radio::currentTrack(){
	return _songTitles[_currentTrack];
}

int Radio::trackNumber(){
	return _currentTrack;
}

QString Radio::nextSong(){
	_currentTrack = (_currentTrack + 1) % _numTracks;
	return _songPaths[_currentTrack];
}

QString Radio::previousSong(){
	if(_currentTrack <= 0){
		_currentTrack = _numTracks - 1;
	}else{
		_currentTrack--;
	}
	return _songPaths[_currentTrack];
}

QString Radio::coverArt(){
	return _coverArt[_currentTrack];
}

QString Radio::description(){
	return _description[_currentTrack];
}
