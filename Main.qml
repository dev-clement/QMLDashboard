import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Material

import Dashboard 1.0

ApplicationWindow {
    id: root
    width: 1024
    height: 800
    visible: true

    color: "#1b1b1b"

    RowLayout {
        anchors.fill: parent
        spacing: 0

        // Left sidebar
        Sidebar {
            id: sidebarPage

            Layout.preferredWidth: 0.3 * root.width
            Layout.preferredHeight: root.height
        }

        // Right page -> Vary
        StackView {
            id: rightSideStackView

            Layout.fillWidth: true
            Layout.fillHeight: true

            initialItem: BackendHelper.selectedSection == 0 ? dashboardPage : genericPage

            // Remove all transitions
            popEnter: null
            pushEnter: null
            pushExit: null
            popExit: null
            replaceEnter: null
            replaceExit: null
        }
    }

    Component {
        id: dashboardPage
        DashboardPage { }
    }

    Component {
        id: genericPage
        GenericPage { }
    }

    Connections {
        target: BackendHelper

        function onSelectedSectionChanged() {
            rightSideStackView.pop(null)
            rightSideStackView.push(BackendHelper.selectedSection == 0 ? dashboardPage : genericPage);
        }
    }
}
