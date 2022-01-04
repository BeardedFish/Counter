// File Name:       main.qml
// By:              Darian Benam (GitHub: https://www.github.com/BeardedFish/)
// Date Created:    Sunday, December 22, 2019

import bb.cascades 1.4

TabbedPane {
    Tab {
        title: "Counter"
        imageSource: "asset:///images/icons/ic_add_subtract.png"
        delegate: Delegate {
            source: "counter.qml"
        }
        delegateActivationPolicy: TabDelegateActivationPolicy.ActivateImmediately
    }
    Tab {
        id: preferencesTab
        objectName: "preferencesTab"
        title: "Preferences"     
        delegate: Delegate {
           source: "preferences.qml"
        }
        delegateActivationPolicy: TabDelegateActivationPolicy.ActivateImmediately
    }
}
