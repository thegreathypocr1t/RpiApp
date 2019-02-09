import QtQuick 2.5
import QtQuick.Window 2.0
import QtQuick.Controls 1.4
import QtQml 2.2
import QtQuick.Layouts 1.1

Window {
    id:windows6
    visible: true
    width: 800
    height: 480
    title: qsTr("Extension")

    Item{
        id:stackView
        anchors.fill: parent

        FirstPage{
            id:firstPage
            anchors.fill:parent
            visible:true

            onClosedEvent: {
                firstPage.visible = false
                secondPage.visible=true
                console.log("Phase2 Visible")
            }

        }

        Phase2{
            id:secondPage
            anchors.fill: parent
            visible: false

            onClosedEvent: {
                secondPage.visible=false
                thirdPage.visible=true
                console.log("ThirdPage Visible")
                thirdPage.recog()
            }
        }

        ThirdPage{
            id:thirdPage
            anchors.fill: parent
            visible: false

            onClosedEvent: {

                thirdPage.visible = false

                if(trigger === 0 ) {
                    secondPage.visible=true
                    console.log("Phase2 Visible")
                }

                if(trigger === 1) {
                    endPage.visible=true
                    console.log("End Visible")
                }

            }
        }





        End{
            id:endPage
            anchors.fill: parent
            visible: false

            onClosedEvent: {
                endPage.visible=false
                ext.visible=true
                console.log("Extend Visible")
            }
        }

        Extend{
            id:ext
            anchors.fill: parent
            visible: false

            onClosedEvent: {
                ext.visible=false

                time.visible=true
                console.log("AddTime Visible")

            }
        }

        AddTime{
            id:time
            anchors.fill: parent
            visible: false

            onClosedEvent: {
                time.visible= false

                if(trigger === 0){
                    choi.visible= true
                    console.log("Choice Visible")
                }


                if(trigger === 1){
                    ext.visible=true
                    console.log("Extend Visible")
                }


            }
        }

        Choice{
            id:choi
            anchors.fill:parent
            visible: false

            onClosedEvent: {
                choi.visible=false

                if(trigger === 0) {
                    las.visible=true
                    console.log("Last Visible")
                }


                if(trigger === 1){
                    ext.visible=true
                    console.log("Extend Visible")
                }
            }
        }

        Last{
            id:las
            anchors.centerIn: parent
            visible:  false

        }

    }
}
