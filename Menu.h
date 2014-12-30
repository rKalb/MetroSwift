#ifndef MENU_H
#define MENU_H

#include <QtCore>
#include <iostream>

class Menu : public QObject {
    Q_OBJECT
    Q_PROPERTY(QString buttonLeftTopSrc READ buttonLeftTopSrc WRITE setButtonLeftTopSrc NOTIFY updated)
    Q_PROPERTY(QString buttonLeftMidSrc READ buttonLeftMidSrc WRITE setButtonLeftMidSrc NOTIFY updated)
    Q_PROPERTY(QString buttonLeftBottomSrc READ buttonLeftBottomSrc WRITE setButtonLeftBottomSrc NOTIFY updated)
    Q_PROPERTY(QString buttonLeftToggleSrc READ buttonLeftToggleSrc WRITE setButtonLeftToggleSrc NOTIFY updated)
    Q_PROPERTY(QString buttonRightTopSrc READ buttonRightTopSrc WRITE setButtonRightTopSrc NOTIFY updated)
    Q_PROPERTY(QString buttonRightMidSrc READ buttonRightMidSrc WRITE setButtonRightMidSrc NOTIFY updated)
    Q_PROPERTY(QString buttonRightBottomSrc READ buttonRightBottomSrc WRITE setButtonRightBottomSrc NOTIFY updated)

    Q_PROPERTY(QString buttonLeftTopTitle READ buttonLeftTopTitle WRITE setButtonLeftTopTitle NOTIFY updated)
    Q_PROPERTY(QString buttonLeftMidTitle READ buttonLeftMidTitle WRITE setButtonLeftMidTitle NOTIFY updated)
    Q_PROPERTY(QString buttonLeftBottomTitle READ buttonLeftBottomTitle WRITE setButtonLeftBottomTitle NOTIFY updated)
    Q_PROPERTY(QString buttonLeftToggleTitle READ buttonLeftToggleTitle WRITE setButtonLeftToggleTitle NOTIFY updated)
    Q_PROPERTY(QString buttonRightTopTitle READ buttonRightTopTitle WRITE setButtonRightTopTitle NOTIFY updated)
    Q_PROPERTY(QString buttonRightMidTitle READ buttonRightMidTitle WRITE setButtonRightMidTitle NOTIFY updated)
    Q_PROPERTY(QString buttonRightBottomTitle READ buttonRightBottomTitle WRITE setButtonRightBottomTitle NOTIFY updated)

    Q_PROPERTY(QString leftQml READ leftQml NOTIFY a)
    Q_PROPERTY(QString rightQml READ rightQml NOTIFY a)

    Q_PROPERTY(QString menuLeftTop READ menuLeftTop NOTIFY a)
    Q_PROPERTY(QString menuLeftMid READ menuLeftMid NOTIFY a)
    Q_PROPERTY(QString menuLeftBottom READ menuLeftBottom NOTIFY a)
    Q_PROPERTY(QString menuLeftToggle READ menuLeftToggle NOTIFY a)
    Q_PROPERTY(QString menuRightTop READ menuRightTop NOTIFY a)
    Q_PROPERTY(QString menuRightMid READ menuRightMid NOTIFY a)
    Q_PROPERTY(QString menuRightBottom READ menuRightBottom NOTIFY a)

public:
    Menu(QObject *parent = 0) : QObject(parent){
        _buttonLeftTopSrc = "";
        _buttonLeftMidSrc = "";
        _buttonLeftBottomSrc = "";
        _buttonLeftToggleSrc = "";
        _buttonRightTopSrc = "";
        _buttonRightMidSrc = "";
        _buttonRightBottomSrc = "";

        _buttonLeftTopTitle = "";
        _buttonLeftMidTitle = "";
        _buttonLeftBottomTitle = "";
        _buttonLeftToggleTitle = "";
        _buttonRightTopTitle = "";
        _buttonRightMidTitle = "";
        _buttonRightBottomTitle = "";
    }

	Menu(const Menu& menu) : QObject(){
        _buttonLeftTopSrc = menu._buttonLeftTopSrc;
        _buttonLeftMidSrc = menu._buttonLeftMidSrc;
        _buttonLeftBottomSrc = menu._buttonLeftBottomSrc;
        _buttonLeftToggleSrc = menu._buttonLeftToggleSrc;
        _buttonRightTopSrc = menu._buttonRightTopSrc;
        _buttonRightMidSrc = menu._buttonRightMidSrc;
        _buttonRightBottomSrc = menu._buttonRightBottomSrc;

        _buttonLeftTopTitle = menu._buttonLeftTopTitle;
        _buttonLeftMidTitle = menu._buttonLeftMidTitle;
        _buttonLeftBottomTitle = menu._buttonLeftBottomTitle;
        _buttonLeftToggleTitle = menu._buttonLeftToggleTitle;
        _buttonRightTopTitle = menu._buttonRightTopTitle;
        _buttonRightMidTitle = menu._buttonRightMidTitle;
        _buttonRightBottomTitle = menu._buttonRightBottomTitle;
    }

    Menu& operator =(const Menu &menu){
        _buttonLeftTopSrc = menu._buttonLeftTopSrc;
        _buttonLeftMidSrc = menu._buttonLeftMidSrc;
        _buttonLeftBottomSrc = menu._buttonLeftBottomSrc;
        _buttonLeftToggleSrc = menu._buttonLeftToggleSrc;
        _buttonRightTopSrc = menu._buttonRightTopSrc;
        _buttonRightMidSrc = menu._buttonRightMidSrc;
        _buttonRightBottomSrc = menu._buttonRightBottomSrc;

        _buttonLeftTopTitle = menu._buttonLeftTopTitle;
        _buttonLeftMidTitle = menu._buttonLeftMidTitle;
        _buttonLeftBottomTitle = menu._buttonLeftBottomTitle;
        _buttonLeftToggleTitle = menu._buttonLeftToggleTitle;
        _buttonRightTopTitle = menu._buttonRightTopTitle;
        _buttonRightMidTitle = menu._buttonRightMidTitle;
        _buttonRightBottomTitle = menu._buttonRightBottomTitle;

        return *this;
    }

	Menu(QString filename){
		updateMenu(filename);
	}

    Q_INVOKABLE void updateMenu(const QString &filename) {
        QFile menufile(filename);
        if(!menufile.open(QIODevice::ReadOnly)){
            qDebug() << "error";
        }

        QTextStream in(&menufile);

        _buttonLeftTopSrc = in.readLine();
        _buttonLeftMidSrc = in.readLine();
        _buttonLeftBottomSrc = in.readLine();
        _buttonLeftToggleSrc = in.readLine();
        _buttonRightTopSrc = in.readLine();
        _buttonRightMidSrc = in.readLine();
        _buttonRightBottomSrc = in.readLine();

        in.readLine();
        _buttonLeftTopTitle = in.readLine();
        _buttonLeftMidTitle = in.readLine();
        _buttonLeftBottomTitle = in.readLine();
        _buttonLeftToggleTitle = in.readLine();
        _buttonRightTopTitle = in.readLine();
        _buttonRightMidTitle = in.readLine();
        _buttonRightBottomTitle = in.readLine();

        in.readLine();
        _leftQml = in.readLine();
        _rightQml = in.readLine();

        in.readLine();
        _menuLeftTop = in.readLine();
        _menuLeftMid = in.readLine();
        _menuLeftBottom = in.readLine();
        _menuLeftToggle = in.readLine();
        _menuRightTop = in.readLine();
        _menuRightMid = in.readLine();
        _menuRightBottom = in.readLine();
        finished();
        menufile.close();
    }



    QString buttonLeftTopSrc(){
        return _buttonLeftTopSrc;
    }

    void setButtonLeftTopSrc(QString src){
        _buttonLeftTopSrc = src;
        updated();
    }

    QString buttonLeftMidSrc(){
        return _buttonLeftMidSrc;
    }

    void setButtonLeftMidSrc(QString src){
        _buttonLeftMidSrc = src;
        updated();
    }

    QString buttonLeftBottomSrc(){
        return _buttonLeftBottomSrc;
    }

    void setButtonLeftBottomSrc(QString src){
        _buttonLeftBottomSrc = src;
        updated();
    }

    QString buttonLeftToggleSrc(){
        return _buttonLeftToggleSrc;
    }

    void setButtonLeftToggleSrc(QString src){
        _buttonLeftToggleSrc = src;
        updated();
    }

    QString buttonRightTopSrc(){
        return _buttonRightTopSrc;
    }

    void setButtonRightTopSrc(QString src){
        _buttonRightTopSrc = src;
        updated();
    }

    QString buttonRightMidSrc(){
        return _buttonRightMidSrc;
    }

    void setButtonRightMidSrc(QString src){
        _buttonRightMidSrc = src;
        updated();
    }

    QString buttonRightBottomSrc(){
        return _buttonRightBottomSrc;
    }

    void setButtonRightBottomSrc(QString src){
        _buttonRightBottomSrc = src;
        updated();
    }



    QString buttonLeftTopTitle(){
        return _buttonLeftTopTitle;
    }

    void setButtonLeftTopTitle(QString title){
        _buttonLeftTopTitle = title;
        updated();
    }

    QString buttonLeftMidTitle(){
        return _buttonLeftMidTitle;
    }

    void setButtonLeftMidTitle(QString title){
        _buttonLeftMidTitle = title;
        updated();
    }

    QString buttonLeftBottomTitle(){
        return _buttonLeftBottomTitle;
    }

    void setButtonLeftBottomTitle(QString title){
        _buttonLeftBottomTitle = title;
        updated();
    }

    QString buttonLeftToggleTitle(){
        return _buttonLeftToggleTitle;
    }

    void setButtonLeftToggleTitle(QString title){
        _buttonLeftToggleTitle = title;
        updated();
    }

    QString buttonRightTopTitle(){
        return _buttonRightTopTitle;
    }

    void setButtonRightTopTitle(QString title){
        _buttonRightTopTitle = title;
        updated();
    }

    QString buttonRightMidTitle(){
        return _buttonRightMidTitle;
    }

    void setButtonRightMidTitle(QString title){
        _buttonRightMidTitle = title;
        updated();
    }

    QString buttonRightBottomTitle(){
        return _buttonRightBottomTitle;
    }

    void setButtonRightBottomTitle(QString title){
        _buttonRightBottomTitle = title;
        updated();
    }



    QString leftQml(){
        return _leftQml;
    }

    QString rightQml(){
        return _rightQml;
    }



    QString menuLeftTop(){
        return _menuLeftTop;
    }

    QString menuLeftMid(){
        return _menuLeftMid;
    }

    QString menuLeftBottom(){
        return _menuLeftBottom;
    }

    QString menuLeftToggle(){
        return _menuLeftToggle;
    }

    QString menuRightTop(){
        return _menuRightTop;
    }

    QString menuRightMid(){
        return _menuRightMid;
    }

    QString menuRightBottom(){
        return _menuRightBottom;
    }

signals:
    void a();
    void finished();
    void updated();

private:
    QString _buttonLeftTopSrc;
    QString _buttonLeftMidSrc;
    QString _buttonLeftBottomSrc;
    QString _buttonLeftToggleSrc;
    QString _buttonRightTopSrc;
    QString _buttonRightMidSrc;
    QString _buttonRightBottomSrc;

    QString _buttonLeftTopTitle;
    QString _buttonLeftMidTitle;
    QString _buttonLeftBottomTitle;
    QString _buttonLeftToggleTitle;
    QString _buttonRightTopTitle;
    QString _buttonRightMidTitle;
    QString _buttonRightBottomTitle;

    QString _leftQml;
    QString _rightQml;

    QString _menuLeftTop;
    QString _menuLeftMid;
    QString _menuLeftBottom;
    QString _menuLeftToggle;
    QString _menuRightTop;
    QString _menuRightMid;
    QString _menuRightBottom;


};
#endif // MENU_H
