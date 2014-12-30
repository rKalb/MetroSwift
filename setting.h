#ifndef SETTING_H
#define SETTING_H

#include <QtCore>

class Setting
{
public:
    Setting();
    Setting(const QString &filename, bool wrap);
    void next();
    void previous();
    QString getName();
    QString getValue();
    QString getTitle();
private:
    QString _title;
    int _numOptions;
    int _currentOption;
    QList<QString> _settingNames;
    QList<QString> _settingValues;
    bool _wrap;
};

#endif // SETTING_H
