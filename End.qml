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

        Image {
            id: image1
            x: 25
            y: 106
            width: 750
            height: 337
            source: "img/at.png"

                }
            }



}
