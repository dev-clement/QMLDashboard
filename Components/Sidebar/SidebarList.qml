import QtQuick
import Dashboard 1.0
import QtQuick.Layouts
import QtQuick.Controls.Material

Item {
    id: control

    ListModel {
        id: sidebarListModel

        ListElement {
            name: "Dashboard"
            imageSource: "qrc:/images/mail.svg"
        }
        ListElement {
            name: "Collections"
            imageSource: "qrc:/images/database.svg"
        }
        ListElement {
            name: "Statistics"
            imageSource: "qrc:/images/chart.svg"
        }
        ListElement {
            name: "Posts"
            imageSource: "qrc:/images/post.svg"
        }
        ListElement {
            name: "Admin Panel"
            imageSource: "qrc:/images/admin.svg"
        }
    }

    Component {
        id: sidebarListDelegate
        Rectangle {
            id: sidebarItemRectangle
            required property string name
            required property string imageSource
            required property int index

            width: parent.width
            height: 40
            radius: 10

            color: index === sidebarListView.currentIndex ? "#5641f4"
                    : sidebarItemMouseArea.containsMouse ?
                        Qt.lighter("#1b1b1b", 1.5) : "#1b1b1b"

            Behavior on color {
                ColorAnimation { duration: 300 }
            }

            RowLayout {
                anchors {
                    left: parent.left
                    leftMargin: 20
                    verticalCenter: parent.verticalCenter
                }

                spacing: 10
                Image {
                    Layout.alignment: Qt.AlignVCenter
                    Layout.preferredWidth: 24
                    Layout.preferredHeight: 24

                    source: sidebarItemRectangle.imageSource
                    fillMode: Image.PreserveAspectFit
                }

                Text {
                    text: sidebarItemRectangle.name
                    color: "#fff"
                    font {
                        pointSize: 12
                        weight: Font.DemiBold
                    }
                }
            }

            MouseArea {
                id: sidebarItemMouseArea

                hoverEnabled: true
                anchors.fill: parent
                onHoveredChanged: cursorShape = Qt.PointingHandCursor
                onClicked: BackendHelper.selectedSection = index
            }
        }
    }

    ListView {
        id: sidebarListView

        currentIndex: BackendHelper.selectedSection

        anchors {
            fill: parent
            leftMargin: 15
            rightMargin: 15
            topMargin: 50
            bottomMargin: 50
        }
        spacing: 10
        model: sidebarListModel
        delegate: sidebarListDelegate
    }
}
