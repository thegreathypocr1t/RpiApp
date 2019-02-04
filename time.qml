import QtQuick 2.5
import QtQuick.Window 2.0
import QtQuick.Controls 1.4
import QtQml 2.2
import QtQuick.Layouts 1.1

Window {
    id:windows3
    visible: true
    width: 800
    height: 480
    title: qsTr("Hello World")

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
            x: 562
            y: 282
            width: 200
            height: 80
            checkable: false
            checked: false
            Layout.minimumWidth: 300
            Layout.minimumHeight: 300
            z: 1
            scale: 1
            opacity: 0.9
            Image {
                width: 300
                height: 300
                anchors.leftMargin: 28
                anchors.topMargin: -34
                anchors.rightMargin: 28
                anchors.bottomMargin: -30
                anchors.fill: parent
                source: "img/pro.png"
                fillMode: Image.PreserveAspectFit
            }

            onClicked: {

                loader.source = "choice.qml"
                windows3.visible=false;

            }

        }


        Button {
            id: button1
            x: 562
            y: 368
            width: 200
            height: 80
            z: 1
            scale: 1
            Layout.minimumHeight: 300
            checkable: false
            opacity: 0.9
            checked: false
            Layout.minimumWidth: 300
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
            onClicked: {

                loader.source = "choice.qml"
                windows3.visible=false;

            }


        }
        Loader
        {
            id: loader
            anchors.fill: parent

        }
}
