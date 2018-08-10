import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3


ApplicationWindow {
    id: window
    title: "QuickText"
    visible: true
    minimumHeight: contentItem.childrenRect.height + (menuBar._contentItem ? menuBar._contentItem.height : 0)

    menuBar: MenuBar {
        Menu {
            title: qsTr("&File")
            Action {
                id: newAction
                text: qsTr("&New")
                icon.name: "new-icon"
                shortcut: StandardKey.New
                onTriggered: area.text = "ToDo - New"
            }
        }
    }

    Item {
        anchors.margins: 10
        anchors.fill: parent
        GridLayout{
            anchors.fill: parent
            columns: 2

            Label {
                id: invoice_lbl
                text: qsTr("Invoice Number")
            }

            TextField {
                id: invoice_field
                Layout.fillWidth: true
            }

            Label {
                id: phone_lbl
                text: qsTr("Phone Number")
            }

            TextField {
                id: phone_field
                Layout.fillWidth: true
            }

            TextArea {
                id: area
                Layout.columnSpan: 2
            }

            Item{
                Layout.columnSpan: 2
                Layout.fillWidth: true
                implicitHeight: send_btn.height

                Button {
                    id: send_btn
                    anchors.centerIn: parent
                    anchors.bottom:
                    text: "Send SMS"
                }
            }
        }
    }
}

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
