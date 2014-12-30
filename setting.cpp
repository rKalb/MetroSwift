#include "setting.h"

Setting::Setting()
{
    _title = "";
    _numOptions = 0;
    _currentOption = 0;
    _settingNames = QList<QString>();
    _settingValues = QList<QString>();
}

Setting::Setting(const QString &filename, bool wrap)
{
    _numOptions = 0;
    _currentOption = 0;
    _settingNames = QList<QString>();
    _settingValues = QList<QString>();
    _wrap = wrap;

    QFile configFile(filename);
    if(!configFile.open(QIODevice::ReadOnly)){
        qDebug() << "error";
    }

    QTextStream in(&configFile);

    QStringList abc = in.readAll().split(QRegExp("[,\\r\\n]+"));
    _title = abc[0];

    _numOptions = (abc.count() - 1) / 2;

    for(int i = 0; i < _numOptions; i++){
        _settingValues.append(abc[i*2 + 1]);
        _settingNames.append(abc[i*2 + 2]);
    }
    configFile.close();
}

void Setting::next(){
    if (!_wrap){
        if (_currentOption == _numOptions - 1)
            return;
    }
    _currentOption = (_currentOption + 1) % _numOptions;
}

void Setting::previous(){
    if(_currentOption <= 0){
        if (!_wrap){
            return;
        }
        _currentOption = _numOptions - 1;
    }else{
        _currentOption--;
    }
}

QString Setting::getName(){
    return _settingNames[_currentOption];
}

QString Setting::getValue(){
    return _settingValues[_currentOption];
}

QString Setting::getTitle(){
    return _title;
}
