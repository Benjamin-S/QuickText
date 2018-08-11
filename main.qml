import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

ApplicationWindow {
    id: window
    title: "QuickText"
    visible: true
    height: 300
    width: 400
    minimumHeight: 250

    //minimumHeight: mainItem.implicitHeight + contentItem.childrenRect.height

    Component.onCompleted: print(mainItem.width, mainItem.height, contentItem.childrenRect.height, window.minimumHeight)

    function updateText(invoiceNumber)
    {
        if(invoiceNumber !== "")
        {
         area.text = "Hello. Please contact us on 00000000 and quote invoice number " + invoiceNumber;
        }
    }

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

    Rectangle {
        id: mainItem
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
                onFocusChanged: updateText(invoice_field.text)
            }

            Label {
                id: phone_lbl
                text: qsTr("Phone Number")
            }

            TextField {
                id: phone_field
                Layout.fillWidth: true
            }

            Rectangle {
                border.color: "#bfbfbf"
                border.width: 1
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.columnSpan: 2
                TextArea {
                    id: area
                    anchors.margins: 5
                    anchors.fill: parent
                    wrapMode: Text.WordWrap
                }
            }

            Item{
                id: item1
                Layout.alignment: Qt.AlignLeft | Qt.AlignBottom
                Layout.columnSpan: 2
                Layout.fillWidth: true
                implicitHeight: send_btn.height

                Button {
                    id: send_btn

//                    anchors.centerIn: parent
                    text: "Send SMS"
                    anchors.right: parent.right
                    anchors.rightMargin: 0
                }
            }
        }
    }
}
