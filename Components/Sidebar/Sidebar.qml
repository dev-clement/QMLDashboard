import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Material

Page {
    id: control

    background: null

    header: SidebarHeader {
        height: 70
        width: parent.width
    }

    footer: SidebarFooter {
        height: 100
    }

    SidebarList {
        anchors.fill: parent
    }
}
