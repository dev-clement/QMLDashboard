#ifndef BACKENDHELPER_HPP
#define BACKENDHELPER_HPP

#include <QList>
#include <QString>
#include <QObject>
#include <QQmlEngine>

class BackendHelper : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON
public:
    explicit BackendHelper(QObject *po_parent = nullptr);

    Q_PROPERTY(int selectedSection READ selectedSection WRITE setSelectedSection NOTIFY selectedSectionChanged)

    int selectedSection() const;
    void setSelectedSection(int i_selectedSection);
    Q_INVOKABLE QString getSelectedName() const;
signals:
    void selectedSectionChanged();
private:
    int m_selectedSection;
    QList<QString> m_dashboardName;
};

#endif // BACKENDHELPER_HPP
