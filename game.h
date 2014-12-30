#ifndef GAME_H
#define GAME_H

#include <QtCore>
#include <stdlib.h>
#include <algorithm>
#include "CarData.h"
#include "Config.h"

class Game  : public QObject {
	Q_OBJECT
	Q_PROPERTY(int score READ score WRITE setScore NOTIFY scoreUpdated)
	Q_PROPERTY(int delta READ delta NOTIFY deltaUpdated)
	Q_PROPERTY(int fuelEcon READ fuelEcon NOTIFY deltaUpdated)
	Q_PROPERTY(double avgMpg READ avgMpg WRITE setAvgMpg NOTIFY deltaUpdated)

public:
	Game (QObject *parent = 0) : QObject(parent){}

    Game(CarData *data, Config* config, QString file){
		_score = 1000;
		_data = data;
		_delta = 0;
		_alpha = 0.012;
		_config = config;
		_mpg = 0;
		_mpgAlpha = 0.05;
		_nMPG = 0;
		_totalMPG = 0;
        _file = file;
        readFile();
		connect(_data,SIGNAL(throttleChanged()),this,SLOT(updateDelta()));
	}

	Game(const Game& game) : QObject(){
		_score = game._score;
		_data = game._data;
	}

	Game& operator=(const Game& game){
		_score = game._score;
		_data = game._data;
		return *this;
	}

	int score(){
		return _score;
	}

	void setScore(int score){
		_score = score;
	}

	int delta(){
		return _delta;
	}

	int fuelEcon(){
		return _mpg;
	}

	double avgMpg(){
		return _totalMPG/_nMPG;
	}

	void setAvgMpg(double mpg){
		_nMPG = 0;
		_totalMPG = mpg;
	}

	Q_INVOKABLE void updateScore(){
        _score += _delta/10;
		if (_score <= 0){
			_score = 0;
		}
        scoreUpdated();
	}

    Q_INVOKABLE void writeFile(){
        if (_file == ""){
            qDebug() << "error";
        } else {
            QFile odomfile(_file);
            if(!odomfile.open(QIODevice::WriteOnly | QIODevice::Truncate)){
                qDebug() << "error";
            }

            QTextStream out(&odomfile);

            out << QDateTime::currentDateTime().toString("MMM d h:mm ap") << "\tScore:" << _score << endl;

            for (int i = 0; i < _highscores.length(); i++ ){
                out << _highscores[i] << endl;
            }

            odomfile.close();
        }
    }

    Q_INVOKABLE QString getScore(int i){
        if (i>=_highscores.length()){
            return "";
        }
        return _highscores[i];
    }

private:
	int speedDelta(){
		if (_data->speedLimit()>0){
			if (_data->currentSpeed() > (_data->speedLimit()*5 + 2)){
				int over = (_data->speedLimit()*5 - _data->currentSpeed()) * 15;
				return (over < -100) ? -100 : over;
			}
			else if (_data->currentSpeed() > (_data->speedLimit()*5 - 10)){
				return (10 - abs(_data->speedLimit()*5 - _data->currentSpeed())) * 10;
			}
		}
		return 0;
	}

	double throttleDelta(){
		if ((_data->currentSpeed()>15) && (_data->throttle() > 0)){
            return (_config->drivingCoefficient() - _data->throttle()) * 200;
		}
		return 0;
	}

	double brakeDelta(){
		if (_data->currentSpeed()>10){
			int brake = (.4 - _data->brake()) * 200;
			return (brake<0) ? brake : 0;
		}
		return 0;
	}

    void readFile(){
        QFile file(_file);
        if(!file.open(QIODevice::ReadOnly)){
            qDebug() << "error";
        }
        QTextStream in(&file);
        QStringList temp = in.readAll().split(QRegExp("[\\r\\n]+"));

        for (int i = 0; i < temp.length(); i++){
            _highscores.append(temp[i]);
        }
        file.close();
    }



public slots:
	void updateDelta(){
		int n = 1;
		if (_data->speedLimit()>0){
			n++;
		}
		_delta = _alpha * (1.0/n) * (throttleDelta() + speedDelta() + brakeDelta()) + (1 - _alpha) * _delta;
        _mpg = _mpgAlpha * (((_data->currentSpeed())/_config->topSpeed()) * _config->avgMpg() * (1 - _data->throttle()+0.05) * 5) + (1 - _mpgAlpha) * _mpg;
		_totalMPG += _mpg;
		_nMPG++;
		deltaUpdated();
	}



signals:
	void scoreUpdated();
	void deltaUpdated();

private:
	double _score;
	double _delta;
	double _alpha;
	Config* _config;
	int _mpg;
	double _totalMPG;
	long _nMPG;
	double _mpgAlpha;
	CarData* _data;
    QString _file;
    QList<QString> _highscores;
};

#endif // GAME_H
