#include <QList>
#include <QString>
#include "backendhelper.hpp"

BackendHelper::BackendHelper(QObject *po_parent)
    : QObject{po_parent}
    , m_selectedSection{ 0 }
    , m_dashboardName{"Dashboard", "Collections", "Statistics", "Posts", "Admin Panel"}
{}

int BackendHelper::selectedSection() const {
    return m_selectedSection;
}

void BackendHelper::setSelectedSection(int i_selectedSection) {
    if (m_selectedSection == i_selectedSection)
        return;
    m_selectedSection = i_selectedSection;
    emit selectedSectionChanged();
}

QString BackendHelper::getSelectedName() const {
    return m_dashboardName.at(m_selectedSection);
}
