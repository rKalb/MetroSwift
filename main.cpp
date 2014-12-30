#include <QApplication>
#include <QtDeclarative>
#include "qmlapplicationviewer.h"
#include "Menu.h"
#include "CarData.h"
#include "Odometer.h"
#include "Entertainment.h"
#include "Data.h"
#include "Climate.h"
#include "Settings.h"
#include "Config.h"
#include "setting.h"
#include "Racer.h"
#include "game.h"

/**
 * This is the entry for the program. This starts the main view and the controller view.
 * 
 * It also sets up the data object which is information about everything. The data object is a
 * meta object which contains all the other types of data. Thus, each type must be registered as a
 * meta-type. Also, for the QML to access the objects, each object must be registered.
 */
Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));

	//Register types as meta-types so that they can sit inside the data object.
    qRegisterMetaType<CarData>("CarData");
    qRegisterMetaType<Menu>("Menu");
    qRegisterMetaType<Odometer>("Odometer");
    qRegisterMetaType<Entertainment>("Entertainment");
    qRegisterMetaType<Climate>("Climate");
    qRegisterMetaType<Settings>("Settings");
    qRegisterMetaType<Config>("Config");
	qRegisterMetaType<Racer>("Racer");
	qRegisterMetaType<Game>("Game");

	//Register the types with QML so you can access the information.
    qmlRegisterType<CarData>("CarData", 1, 0, "CarData");
    qmlRegisterType<Menu>("Menu", 1, 0, "Menu");
    qmlRegisterType<Odometer>("Odometer", 1, 0, "Odometer");
    qmlRegisterType<Entertainment>("Entertainment", 1, 0, "Entertainment");
    qmlRegisterType<Climate>("Climate", 1, 0, "Climate");
    qmlRegisterType<Settings>("Settings", 1, 0, "Settings");
    qmlRegisterType<Config>("Config", 1, 0, "Config");
    qmlRegisterType<Data>("Data", 1, 0, "Data");
	qmlRegisterType<Racer>("Racer", 1, 0, "Racer");
	qmlRegisterType<Game>("Game", 1, 0, "Game");

	//Create the data object.
    Data data;

	//Set up the main viewer
	QmlApplicationViewer mainViewer;
    mainViewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
	//Give it the data object called "allData"
	mainViewer.rootContext()->setContextProperty("allData", &data);
	//Sets the startup file
    mainViewer.setMainQmlFile(QLatin1String("qml/MetroSwift/main.qml"));
	mainViewer.showFullScreen();

	//Set up the controller viewer
	QmlApplicationViewer controllerViewer;
    controllerViewer.setOrientation(QmlApplicationViewer::ScreenOrientationAuto);
	//Sets the startup file
	controllerViewer.setMainQmlFile(QLatin1String("qml/MetroSwift/controller.qml"));
	//Give it the data object called "allData"
	controllerViewer.rootContext()->setContextProperty("allData", &data);
    controllerViewer.showExpanded();

    return app->exec();
}

