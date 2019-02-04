import QtQuick 2.5
import QtQuick.Window 2.0
import QtQuick.Controls 1.4
import QtQml 2.2
import QtQuick.Layouts 1.1

Item {
    id:windows2
    visible: true
    width: 800
    height: 480

    signal closedEvent(var trigger)
    Image {

        id: image
        x: 0
        y: 0
        width: 800
        height: 480
        source: "img/ac.png"

        Rectangle {
            id: rectangle
            x: 372
            y: 117
            width: 399
            height: 247
            color: "#fee1e1"

            Text {
                id: text1
                x: 16
                y: 32
                width: 368
                height: 76
                text: "There is a class during these hour."
                font.capitalization: Font.AllUppercase
                renderType: Text.NativeRendering
                font.weight: Font.DemiBold
                style: Text.Raised
                fontSizeMode: Text.HorizontalFit
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 19
            }

            Text {
                id: text2
                x: 16
                y: 78
                width: 368
                height: 76
                text: "DO YOU WANT TO PROCEED?"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                style: Text.Raised
                font.capitalization: Font.AllUppercase
                fontSizeMode: Text.HorizontalFit
                renderType: Text.NativeRendering
                font.pixelSize: 19
                font.weight: Font.DemiBold
            }
        }

        Image {
            id: image1
            x: 76
            y: 117
            width: 264
            height: 247
            source: "img/images (1).png"
        }
    }

    Button {
        id: button
            x: 28
            y: 376
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
                source: "img/y.png"
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

//                loader.source = "last.qml"
                closedEvent(0)
                windows2.visible=false;

            }

                }

       Button {
           id: button1
           x: 573
           y: 376
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
               source: "img/n.png"
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

//               loader.source = "extend.qml"
               closedEvent(1)
               windows2.visible=false;

           }
       }


}
