// File Name:       usrprefs.cpp
// By:              Darian Benam (GitHub: https://github.com/BeardedFish/)
// Date Created:    Monday, January 3, 2022

#include "usrprefs.hpp"
#include <QDir>
#include <QFile>
#include <QMapIterator>
#include <QTextStream>
#include <QVariant>

UserPreferences::UserPreferences(QObject* parent) : QObject(parent)
{
    load();
}

bool UserPreferences::getWarnOnReset()
{
    return m_preferencesMap["warnOnReset"].toBool();
}

void UserPreferences::setWarnOnReset(bool warnOnReset)
{
    m_preferencesMap["warnOnReset"].setValue(warnOnReset);
}

bool UserPreferences::save()
{
    QDir homeDirectory = QDir::home();
    QFile preferencesFile(homeDirectory.absoluteFilePath("counter.pref"));

    if (preferencesFile.open(QIODevice::WriteOnly | QIODevice::Text))
    {
        QTextStream preferencesFileStream(&preferencesFile);
        QMapIterator<QString, QVariant> qMapIterator(m_preferencesMap);

        while (qMapIterator.hasNext())
        {
            qMapIterator.next();
            preferencesFileStream << qMapIterator.key() << ' ' << qMapIterator.value().toString() << '\n';
        }

        preferencesFile.close();

        return true;
    }

    return false;
}

void UserPreferences::load()
{
    QDir homeDirectory = QDir::home();
    QFile preferencesFile(homeDirectory.absoluteFilePath("counter.pref"));

    if (preferencesFile.open(QIODevice::ReadOnly | QIODevice::Text))
    {
        QTextStream preferencesFileStream(&preferencesFile);

        while (!preferencesFileStream.atEnd())
        {
            QString currentLine = preferencesFileStream.readLine();
            QStringList currentLineTokens = currentLine.split(' ');

            if (currentLineTokens.length() >= 2)
            {
                m_preferencesMap[currentLineTokens[0]] = currentLineTokens[1];
            }
        }

        preferencesFile.close();
    }
}
