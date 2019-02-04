import QtQuick 2.5
import QtQuick.Window 2.0
import QtQuick.Controls 1.4
import QtQml 2.2
import QtQuick.Layouts 1.1

Item {
    id:windows1
    visible: true
    width: 800
    height: 480

    signal closedEvent()

    Image {

        id: image
        x: 0
        y: 0
        width: 800
        height: 480
        source: "img/ac.png"
            }

        Button {
            id: button
            x: 127
            y: 236
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
                source: "img/extend.png"
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

//                loader.source = "addtime.qml"

                windows1.visible=false;

                closedEvent()

            }

                }

       Button {
           id: button1
           x: 480
           y: 236
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
               source: "img/end.png"
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
                windows1.visible=false;

            }
                }


}
