import QtQuick 2.5
import QtQuick.Window 2.0
import QtQuick.Controls 1.4
import QtQml 2.2
import QtQuick.Layouts 1.1

Item {
    id:windows9
    visible: true
    width: 800
    height: 480


    signal closedEvent(var trigger)

    Timer{
        id: timer
        interval: 250
        running: false
        repeat: false
        onTriggered: post()
    }

    function recog() {
        timer.start()
    }

    Image {

        id: image
        x: 0
        y: 0
        width: 800
        height: 480
        source: "img/ac.png"
            }
    Image {
        id: image2
        x: 48
        y: 116
        width: 300
        height: 312
        source: "img/user.png"
    }
    Button {
            id: button
            x: 578
            y: 368
            width: 200
            height: 80

            Image {
                width: 300
                height: 300
                anchors.leftMargin: 28
                anchors.topMargin: -34
                anchors.rightMargin: 28
                anchors.bottomMargin: -30
                anchors.fill: parent
                source: "img/prob.png"
                fillMode: Image.PreserveAspectFit
            }
            checkable: false
            checked: false
            Layout.minimumWidth: 300
            Layout.minimumHeight: 300
            z: 1
            scale: 1
            opacity: 0.9

            onClicked: {
                //phase2 page

                closedEvent(0)
                windows9.visible=false;


            }

                }
    Text {
        id: text1
        x: 401
        y: 158
        width: 326
        height: 179
        text: qsTr("Please position your face in ")
        font.bold: true
        clip: true
        font.pixelSize: 20

        Text {
            id: text2
            x: 0
            y: 45
            width: 370
            height: 104
            text: qsTr("front of the camera.")
            font.bold: true
            font.pixelSize: 21
        }
    }
    Loader
    {
        id: loader
        anchors.fill: parent
       }

    Timer{
        id: timer2
        interval: 5000
        running: false
        repeat: false
        onTriggered: faceRecognition.offLED()
    }

    function post(){
        console.log("posting to API")

        var xhr = new XMLHttpRequest()
                var link = "http://192.168.1.25:3000/classlog/pi"
                xhr.open("POST",link,true);
                xhr.setRequestHeader("Content-Type", "application/json")
                xhr.send(JSON.stringify({
                    "ipaddr": faceRecognition.getIpaddr(),
                    "idEmployee": faceRecognition.faceRecog(),
                    "transactionType": 0
                }));

        xhr.onreadystatechange = function () {
            if(xhr.readyState === XMLHttpRequest.DONE) {
                console.log(xhr.responseText)

                var res = JSON.parse(xhr.responseText);
                faceRecognition.setLogID(res.logID);
                console.log(faceRecognition.getLogID());

                if(res.result === 1) {
                    faceRecognition.onLED()
                    timer2.start()
                    closedEvent(1)
                }

            }
        }

        console.log("post function done")
    }
}
