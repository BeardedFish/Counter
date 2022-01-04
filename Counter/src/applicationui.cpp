/* File Name:      applicationui.cpp
 * Modified By:    Darian Benam (GitHub: https://github.com/BeardedFish/)
 *
 * ----------------------------------------------------------------------
 *
 * Copyright (c) 2011-2015 BlackBerry Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License. */

#include "applicationui.hpp"
#include <bb/cascades/Application>
#include <bb/cascades/CheckBox>
#include <bb/cascades/LocaleHandler>
#include <bb/cascades/QmlDocument>

ApplicationUI::ApplicationUI() : QObject()
{
    m_pTranslator = new QTranslator(this);
    m_pLocaleHandler = new bb::cascades::LocaleHandler(this);
    m_pUserPreferences = new UserPreferences(this);

    bool connectResult = QObject::connect(m_pLocaleHandler, SIGNAL(systemLanguageChanged()), this, SLOT(onSystemLanguageChanged()));

    Q_ASSERT(connectResult);
    Q_UNUSED(connectResult);

    onSystemLanguageChanged();

    bb::cascades::QmlDocument* qml = bb::cascades::QmlDocument::create("asset:///views/main.qml").parent(this);
    bb::cascades::AbstractPane* root = qml->createRootObject<bb::cascades::AbstractPane>();

    qml->setContextProperty("UserPreferences", m_pUserPreferences);
    updateUiPreferenceControls(root);

    bb::cascades::Application::instance()->setScene(root);
}

void ApplicationUI::onSystemLanguageChanged()
{
    QCoreApplication::instance()->removeTranslator(m_pTranslator);
    QString local = QLocale().name();
    QString fileName = QString("Counter_%1").arg(local);

    if (m_pTranslator->load(fileName, "app/native/qm"))
    {
        QCoreApplication::instance()->installTranslator(m_pTranslator);
    }
}

void ApplicationUI::updateUiPreferenceControls(bb::cascades::AbstractPane* rootPane)
{
    bb::cascades::CheckBox* warnOnResetCheckBox = rootPane->findChild<bb::cascades::CheckBox*>("warnOnResetCheckBox");

    if (warnOnResetCheckBox)
    {
        warnOnResetCheckBox->setChecked(m_pUserPreferences->getWarnOnReset());
    }
}
