import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Material
import Dashboard

Page {
    id: control

    background: Rectangle {
        color: "#101010"
    }

    header: Item {
        height: 70

        RowLayout {
            anchors {
                left: parent.left
                right: parent.right
                verticalCenter: parent.verticalCenter
                rightMargin: 20
                leftMargin: 20
            }

            Label {
                text: BackendHelper.getSelectedName()
                color: "#fff"
                font {
                    pointSize: 20
                    weight: Font.DemiBold
                }
            }

            Item {
                Layout.fillWidth: true
            }

            Rectangle {
                Layout.preferredWidth: 40
                Layout.preferredHeight: 40

                color: profileMouseArea.containsMouse ? "#fff" : "#101010"
                radius: 20

                antialiasing: true

                border {
                    width: 1
                    color: "#fff"
                }

                Behavior on color {
                    ColorAnimation { duration: 300 }
                }

                Text {
                    id: txt
                    anchors.centerIn: parent
                    text: "A"
                    color: profileMouseArea.containsMouse ? "#000" : "#fff"
                    font {
                        bold: true
                        pointSize: 16
                        weight: Font.DemiBold
                    }
                    Behavior on color { ColorAnimation { duration: 300 } }
                }

                MouseArea {
                    id: profileMouseArea

                    hoverEnabled: true
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                }
            }
        }
    }
}
