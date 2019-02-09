#ifndef FACE_H
#define FACE_H

#include <QObject>
#include "opencv2/core.hpp"
#include "opencv2/face.hpp"
#include "opencv2/highgui.hpp"
#include "opencv2/objdetect.hpp"
#include "opencv2/imgproc.hpp"

using namespace cv;
using namespace cv::face;

class face : public QObject
{
    Q_OBJECT
public:
    explicit face(QObject *parent = 0);

//    Q_INVOKABLE void faceRecog();

signals:

public slots:

private:
//    QString faceXmlPath = "/home/pi/Documents/QTProj/detectRecog/haarcascade_frontalface_alt.xml";
//    CascadeClassifier faceCascade;

};

#endif // FACE_H
