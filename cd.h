#ifndef CD_H
#define CD_H

#include <QtCore>

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
class Cd
{
public:
	Cd(QString filename);

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
	QString _artist;
	QList<QString> _songArtists;
	QList<QString> _songTitles;
	QList<QString> _songPaths;
	int _currentTrack;
	QString _coverArt;
	QString _description;
};

#endif // CD_H
