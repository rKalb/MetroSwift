#include "cd.h"

/**
 * @brief The Cd class
 *
 * This class mocks up a CD. The CD is initiated from a file.
 *
 * The file is very specific:
 * Line 1: n # of songs
 * Line 2: location of album art (from qml/metroswift)
 * Lines 3-(n+3): Artist|Title|Song Location from C:\audio\
 * Line n+4: CD description
 *
 */
Cd::Cd(QString filename)
{
	_currentTrack = 0;

	QFile configFile(filename);
	if(!configFile.open(QIODevice::ReadOnly)){
		qDebug() << "error";
	}

	QTextStream in(&configFile);

    QStringList abc = in.readAll().split(QRegExp("[|\\r\\n]+"));
	_numTracks = abc[0].toInt();
	_coverArt = abc[1];



	for(int i = 0; i < _numTracks; i++){
		_songArtists.append(abc[i*3 + 2]);
		_songTitles.append(abc[i*3 + 3]);
		_songPaths.append(abc[i*3 + 4]);
	}

	_description = abc[abc.length()-1];

	configFile.close();
}

/**
 * @brief Cd::artist
 * @return current song's artist
 */
QString Cd::artist(){
	return _songArtists[_currentTrack];
}

/**
 * @brief Cd::length
 * @return number of songs
 */
int Cd::length(){
	return _numTracks;
}

/**
 * @brief Cd::nextSong
 * @return increments to the next song (wraps).
 */
QString Cd::nextSong(){
	_currentTrack = (_currentTrack + 1) % _numTracks;
	return _songPaths[_currentTrack];
}

/**
 * @brief Cd::previousSong
 * @return decrements to previous song (wraps).
 */
QString Cd::previousSong(){
	if(_currentTrack <= 0){
		_currentTrack = _numTracks - 1;
	}else{
		_currentTrack--;
	}
	return _songPaths[_currentTrack];
}

/**
 * @brief Cd::currentTrack
 * @return current track title
 */
QString Cd::currentTrack(){
	return _songTitles[_currentTrack];
}

/**
 * @brief Cd::trackNumber
 * @return track number
 */
int Cd::trackNumber(){
	return _currentTrack;
}

/**
 * @brief Cd::coverArt
 * @return cover art location
 */
QString Cd::coverArt(){
	return _coverArt;
}

/**
 * @brief Cd::description
 * @return cd description
 */
QString Cd::description(){
	return _description;
}
