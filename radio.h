#ifndef RADIO_H
#define RADIO_H

#include <QtCore>

class Radio
{
public:
	Radio(QString filename);

	QString artist();

	int length();

	QString nextSong();

	QString previousSong();

	QString currentTrack();

	int trackNumber();

	QString coverArt();

	QString description();


private:
	int _numTracks;
	QList<QString> _songArtists;
	QList<QString> _songTitles;
	QList<QString> _songPaths;
	int _currentTrack;
	QList<QString> _coverArt;
	QList<QString> _description;
};

#endif // RADIO_H
