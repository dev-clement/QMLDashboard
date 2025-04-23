import QtQuick

BasePage {
    id: control

    Text {
        anchors.centerIn: parent
        text: qsTr("Generic page")
        color: "#fff"
        font {
            pointSize: 14
            weight: Font.DemiBold
        }
    }
}
