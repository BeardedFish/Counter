/* File Name:      applicationui.hpp
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

#ifndef APPLICATIONUI_HPP
#define APPLICATIONUI_HPP

#include "usrprefs.hpp"
#include <bb/cascades/AbstractPane>
#include <QObject>

namespace bb
{
    namespace cascades
    {
        class LocaleHandler;
    }
}

class QTranslator;

class ApplicationUI : public QObject
{
    Q_OBJECT
    QTranslator* m_pTranslator;
    bb::cascades::LocaleHandler* m_pLocaleHandler;
    UserPreferences* m_pUserPreferences;
public:
    ApplicationUI();
    virtual ~ApplicationUI() {}
private slots:
    void onSystemLanguageChanged();
private:
    void updateUiPreferenceControls(bb::cascades::AbstractPane* rootPane);
};

#endif // APPLICATIONUI_HPP
