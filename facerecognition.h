#ifndef FACERECOGNITION_H
#define FACERECOGNITION_H
#define FRAMES 10

#include <QObject>
#include "opencv2/core.hpp"
#include "opencv2/face.hpp"
#include "opencv2/highgui.hpp"
#include "opencv2/objdetect.hpp"
#include "opencv2/imgproc.hpp"
#include "wiringPi.h"
#include <QDebug>
#include <QNetworkInterface>


using namespace cv;
using namespace cv::face;

class faceRecognition : public QObject
{
    Q_OBJECT
public:
    explicit faceRecognition(QObject *parent = 0);

    Q_INVOKABLE int faceRecog();

signals:

public slots:

private:
    QString faceXmlPath = "/home/pi/Documents/QTProj/detectRecog/haarcascade_frontalface_alt.xml";
    CascadeClassifier faceCascade;
    QString msg;
    VideoCapture cap;
    Mat frame;
    Mat testImage;
    int label;
    double confidence;
    int count;
    int recognized [FRAMES] = {};
    int reoccuringLabel;
    QString ipaddr;
    int logID;
    int rpiPin;


public:
    Mat detect(Mat frame);
    int getReoccuringLabel(int arr[10]);

    Q_INVOKABLE QString getIpaddr() const;
    void setIpaddr(const QString &value);
    Q_INVOKABLE int getLogID() const;
    Q_INVOKABLE void setLogID(int value);
    Q_INVOKABLE void offLED();
    Q_INVOKABLE void onLED();
};

#endif // FACERECOGNITION_H
