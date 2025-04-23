import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Material

Item {
    id: control

    RowLayout {
        anchors {
            left: parent.left
            right: parent.right
            leftMargin: 15
            rightMargin: 15
            verticalCenter: parent.verticalCenter
        }
        spacing: 5

        Image {
            Layout.preferredWidth: 32
            Layout.preferredHeight: 32

            source: "qrc:/images/logo.svg"
            fillMode: Image.PreserveAspectFit
        }

        Label {
            Layout.alignment: Qt.AlignVCenter
            text: "DASHBOARD"
            color: "#fff"
            font {
                pointSize: 16
                weight: Font.DemiBold
            }
        }

        Item {
            Layout.fillWidth: true
        }

        Image {
            Layout.preferredWidth: 32
            Layout.preferredHeight: 32

            source: "qrc:/images/sidebar_collapse.svg"
            fillMode: Image.PreserveAspectFit

            MouseArea {
                id: mouseArea

                anchors.fill: parent
                hoverEnabled: true
                onHoveredChanged: cursorShape = Qt.PointingHandCursor
            }
        }
    }
}
