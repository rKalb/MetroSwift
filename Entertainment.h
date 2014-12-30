#ifndef ENTERTAINMENTMODE_H
#define ENTERTAINMENTMODE_H
#include <QtCore>
#include <phonon/phonon>
#include "cd.h"
#include "radio.h"


class Entertainment : public QObject
{
    Q_OBJECT
    Q_ENUMS(Mode)
    Q_PROPERTY(Mode mode READ mode WRITE setMode NOTIFY modeChanged)
	Q_PROPERTY(QString currentArtist READ currentArtist NOTIFY songUpdated)
	Q_PROPERTY(QString currentTitle READ currentTitle NOTIFY songUpdated)
	Q_PROPERTY(QString albumArt READ albumArt NOTIFY songUpdated)
	Q_PROPERTY(QString description READ description NOTIFY songUpdated)
	Q_PROPERTY(QString station READ station NOTIFY stationUpdated)
	Q_PROPERTY(bool paused READ paused NOTIFY pauseChanged)


public:
    Entertainment(QObject *parent = 0) : QObject(parent) {
		qsrand(QTime::currentTime().msec());
		_isPlaying = false;
		_mode = Mode(Cds);
		_out = new Phonon::AudioOutput(Phonon::MusicCategory, this);
		_audio = new Phonon::MediaObject();
		Phonon::createPath(_audio, _out);
		_out->setVolume(0.5);

		initRadio();
		initCd();
		playCd();

		connect(_audio,SIGNAL(finished()),this, SLOT(songFinished()));
    }


	Entertainment(const Entertainment& ent) : QObject (){
        _mode = ent._mode;
    }

    Entertainment& operator=(const Entertainment& ent){
        _mode = ent._mode;

        return *this;
    }

	enum Mode { InvalidValue, Radios, Cds } ;

    Mode mode() {
        return _mode;
    }

    void setMode(Mode mode){
		if (mode == Cds && _mode != Cds){
			playCd();
		} else if (mode == Radios && _mode != Radios){
			playRadio();
		}
        _mode = mode;
		songUpdated();
    }

	void play(QString filepath);

	Q_INVOKABLE void setVolume(double vol);

	Q_INVOKABLE void playPause();

	Q_INVOKABLE void nextCd();

	Q_INVOKABLE void next();

	Q_INVOKABLE void previous();

	QString albumArt(){
		if (_mode == Cds)
			return _cd->coverArt();
		else if (_mode == Radios)
			return _radio->coverArt();
		return "";
	}

	QString currentTitle(){
		if (_mode == Cds)
			return _cd->currentTrack();
		else if (_mode == Radios)
			return _radio->currentTrack();
		return "";
	}

	QString currentArtist(){
		if (_mode == Cds)
			return _cd->artist();
		else if (_mode == Radios)
			return _radio->artist();
		return "";
	}

	QString description(){
		if (_mode == Cds)
			return _cd->description();
		else if (_mode == Radios)
			return _radio->description();
		return "";
	}

	QString station(){
		return _stationNames[_currentRadio];
	}

	bool paused(){
		return !_isPlaying;
	}


private:
	void initCd();
	void initRadio();
	void playCd();
	void playRadio();

public slots:
	void songFinished();

signals:
    void modeChanged();
	void songUpdated();
	void pauseChanged();
	void stationUpdated();

private:
    Mode _mode;
	Phonon::MediaObject *_audio;
	Phonon::AudioOutput *_out;
	Cd *_cd;
	QStringList _cds;
	int _currentCd;
	Radio *_radio;
	int _currentRadio;
	QStringList _stations;
	QStringList _stationNames;
	bool _isPlaying;

};
#endif // ENTERTAINMENTMODE_H
