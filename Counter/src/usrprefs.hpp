// File Name:       usrprefs.hpp
// By:              Darian Benam (GitHub: https://github.com/BeardedFish/)
// Date Created:    Monday, January 3, 2022

#ifndef USRPREFS_HPP
#define USRPREFS_HPP

#include <QObject>
#include <QMap>
#include <QString>
#include <QVariant>

class UserPreferences : public QObject
{
    Q_OBJECT
    QMap<QString, QVariant> m_preferencesMap;
public:
    UserPreferences(QObject* parent);
    virtual ~UserPreferences() {}
public slots:
    bool getWarnOnReset();
    void setWarnOnReset(bool warnOnReset);
    bool save();
private:
    void load();
};

#endif // USRPREFS_H
