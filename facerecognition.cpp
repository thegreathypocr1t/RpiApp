#include "facerecognition.h"

faceRecognition::faceRecognition(QObject *parent) : QObject(parent)
{
    label = -1;
    confidence = 0;
    count = 0;

    rpiPin = 21;

    wiringPiSetup();
    pinMode(rpiPin,OUTPUT);

    offLED();

    foreach (const QHostAddress &address, QNetworkInterface::allAddresses()) {
        if (address.protocol() == QAbstractSocket::IPv4Protocol && address != QHostAddress(QHostAddress::LocalHost)){
//            FileName = FileName + address.toString();
            ipaddr = address.toString();
        }
    }
}

int faceRecognition::faceRecog()
{
    qDebug()<<"Inside faceRecog()"<<endl;

    Ptr<LBPHFaceRecognizer> model = LBPHFaceRecognizer::create();
    model->read("/home/pi/Documents/QTProj/detectAndRecog/recog.xml");

    // LOADING TYHE XML CASCADE FILES
    if(!faceCascade.load(faceXmlPath.toStdString()))
        qDebug()<<"Cannot load face cascade xml file"<<endl;
//    if(!eyesCascade.load(eyesXmlPath))
//        qDebug()<<"Cannot load eyes cascade xml file"<<endl;

    // OPENING CAMERA
    cap.open(0);
    if(!cap.isOpened()) {
        qDebug()<<"Could not open camera."<<endl;
    }
    while(cap.read(frame)) {
        if(frame.empty()) {
            qDebug()<<"Current frame is empty"<<endl;
            break;
        }

        testImage = detect(frame);

        if(count < FRAMES)
            count++;
        else
            break;

        model->predict(testImage, label, confidence);

        recognized[count] = label;

        msg = QString("Predicted Label = ").arg(QString::number(recognized[count]));
        qDebug()<< msg <<endl;
//        qDebug()<<confidence<<endl;

//        int c = waitKey(10);
//        if((char)c == 27) {
//            break;
//        }
    }
    cap.release();
    reoccuringLabel = recognized[getReoccuringLabel(recognized)];
    qDebug()<<"After gettingReoccuringLabel fucntion."<<endl;
    qDebug()<<"Most reoccuring label is " << reoccuringLabel <<endl;

    return reoccuringLabel;
}

int faceRecognition::getLogID() const
{
    return logID;
}

void faceRecognition::setLogID(int value)
{
    logID = value;
}

void faceRecognition::offLED()
{
    qDebug()<<"Turning off GPIO";
    digitalWrite(rpiPin,LOW);
}

void faceRecognition::onLED()
{
    qDebug()<<"Turning on GPIO";
    digitalWrite(rpiPin,HIGH);
}

QString faceRecognition::getIpaddr() const
{
    return ipaddr;
}

void faceRecognition::setIpaddr(const QString &value)
{
    ipaddr = value;
}

Mat faceRecognition::detect(Mat frame)
{
    Mat grayFrame;
    Mat faceROI;
    Mat imgToRecog;
    std::vector<Rect>  faces;

    cvtColor(frame, grayFrame, COLOR_BGR2GRAY);
    equalizeHist(grayFrame, grayFrame);

    faceCascade.detectMultiScale(grayFrame, faces, 1.2, 3, 0, Size(30, 30));
    for(unsigned int i = 0; i < faces.size(); i++) {
        rectangle(frame, faces[i], Scalar(0, 255, 0), 2, 8, 0);

        faceROI = grayFrame(faces[i]);
//        std::vector<Rect> eyes;

//        eyesCascade.detectMultiScale(faceROI, eyes, 1.2, 3, 0, Size(30, 30));
//        for(unsigned int j = 0; j < eyes.size(); j++) {

//            Point eye_center( faces[i].x + eyes[j].x + eyes[j].width/2, faces[i].y + eyes[j].y + eyes[j].height/2 );
//            int radius = cvRound( (eyes[j].width + eyes[j].height)*0.25 );
//            circle( frame, eye_center, radius, Scalar( 255, 0, 0 ), 4, 8, 0 );
//        }
        resize(faceROI, imgToRecog, Size(128, 128), 1.0, 1.0, INTER_CUBIC);
//        namedWindow("Face Detection");
//        imshow("Face Detection", frame);
//        qDebug() << "HERE BEORE RET"<<endl;
        return imgToRecog;
    }
}

int faceRecognition::getReoccuringLabel(int arr[])
{
    int reoccuringIndex;
    int reoccuring = 0;
    int tempCount = 1;

    for(int i = 0; i < 10; i++) {
//        qDebug()<<"Outer LOOP: "<< i <<endl;
//        qDebug()<<"Value: "<< arr[i] <<endl;
        if(arr[i] != 0) {
//            qDebug()<<"Value at index "<< i <<" is not 0"<<endl;
            tempCount = 1;
            for(int j = 0; j < 10; j++) {
                if(i != j) {
//                    qDebug()<<"Index "<< i <<" is not equal to index "<< j <<endl;
                    if(arr[i] == arr[j]) {
//                        qDebug()<<"Value "<< arr[i] <<" is equal to value "<< arr[j] <<endl;
                        tempCount++;
//                        qDebug()<<"tempCount is now: "<< tempCount <<endl;
                        arr[j] = 0;
                    }
                }
            }
//            qDebug()<<"tempCount is: "<< tempCount <<endl;
            if(reoccuring <= tempCount) {
                reoccuring = tempCount;
                reoccuringIndex = i;
            }
//            qDebug()<<"reoccuring is now: "<< reoccuring <<endl;
//            qDebug()<<"reoccuringIndex is now: "<< reoccuringIndex <<endl;
        }
    }

//    qDebug()<<reoccuring<<endl;
//    qDebug()<<reoccuringIndex<<endl;
    return reoccuringIndex;
}
