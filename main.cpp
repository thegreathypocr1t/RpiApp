#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QScopedPointer>
#include "facerecognition.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QScopedPointer<faceRecognition> faceRecog (new faceRecognition);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("faceRecognition", faceRecog.data());
    engine.load(QUrl::fromLocalFile("/home/pi/Documents/QTProj/RpiAPP/main.qml"));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
