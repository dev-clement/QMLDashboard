import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Material

Item {
    id: control

    Rectangle {
        anchors {
            left: parent.left
            right: parent.right
            leftMargin: 15
            rightMargin: 15
            verticalCenter: parent.verticalCenter
        }

        radius: 10
        height: 40
        color: footerMouseArea.containsMouse ? Qt.darker("#5641f4", 1.5) : "#5641f4"

        Behavior on color {
            ColorAnimation { duration: 300 }
        }

        RowLayout {
            anchors {
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: 10
            }
            spacing: 10

            Image {
                Layout.preferredWidth: 24
                Layout.preferredHeight: 24

                source: "qrc:/images/plus.svg"
                fillMode: Image.PreserveAspectFit
            }

            Text {
                Layout.alignment: Qt.AlignVCenter
                text: "Add item"
                font {
                    pointSize: 12
                    weight: Font.DemiBold
                }
                color: "#fff"
            }
        }

        MouseArea {
            id: footerMouseArea

            hoverEnabled: true
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
        }
    }
}
