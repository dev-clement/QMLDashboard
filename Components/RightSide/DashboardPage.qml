import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Material

BasePage {
    id: control

    ColumnLayout {
        id: dashboardColumnLayout

        anchors {
            fill: parent
            margins: 10
            topMargin: 30
        }

        spacing: 20

        ListModel {
            id: cardsModel

            ListElement {
                cardName: "Today's interactions"
                cardValue: 300
            }

            ListElement {
                cardName: "This week's interactions"
                cardValue: 2343
            }

            ListElement {
                cardName: "This month's interactions"
                cardValue: 23543
            }

            ListElement {
                cardName: "This year's interactions"
                cardValue: 854653
            }

            ListElement {
                cardName: "Total interactions"
                cardValue: 9543333
            }
        }

        Component {
            id: cardsDelegate

            Item {
                id: cardsGridItem

                required property string cardName
                required property int cardValue
                required property int index

                width: cardGridView.cellWidth
                height: cardGridView.cellHeight

                x: index === 4 ? (cardGridView.cellWidth / 2) : 0

                onXChanged: {
                    if (index === 4 && x != (cardGridView.cellWidth / 2)) {
                        x = (cardGridView.cellWidth / 2)
                    }
                }

                Rectangle {
                    anchors {
                        fill: parent
                        margins: 10
                    }

                    color: "#1b1b1b"
                    radius: 10

                    RowLayout {
                        anchors {
                            left: parent.left
                            right: parent.right
                            top: parent.top
                            leftMargin: 10
                            rightMargin: 10
                            topMargin: 15
                        }

                        spacing: 5

                        Image {
                            Layout.preferredHeight: 16
                            Layout.preferredWidth: 16

                            source: "qrc:/images/click.svg"
                            fillMode: Image.PreserveAspectFit
                        }

                        Text {
                            text: cardsGridItem.cardName
                            color: "#777"
                            font {
                                pointSize: 11
                                weight: Font.DemiBold
                            }
                        }

                    }

                    Text {
                        anchors.centerIn: parent
                        text: cardsGridItem.cardValue
                        color: "#fff"
                        font {
                            pointSize: 15
                            weight: Font.DemiBold
                        }
                    }
                }
            }
        }

        GridView {
            id: cardGridView

            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: cellWidth * 2
            Layout.fillHeight: true

            cellWidth: 300
            cellHeight: 150

            model: cardsModel
            delegate: cardsDelegate
        }

        Item {
            Layout.fillHeight: true
        }
    }
}
