// File Name:       preferences.qml
// By:              Darian Benam (GitHub: https://www.github.com/BeardedFish/)
// Date Created:    Monday, January 3, 2022

import bb.cascades 1.4
import bb.system 1.0

Page {
    Container {
        layout: StackLayout {}
        topPadding: 48
        rightPadding: 48
        bottomPadding: 48
        leftPadding: 48
        
        CheckBox {
            objectName: "warnOnResetCheckBox"
            text: "Show warning dialog on reset"
            margin.bottomOffset: 48
            
            onCheckedChanged: {
                UserPreferences.setWarnOnReset(checked)
            }
        }
        
        Button {
            text: "Save Preferences"
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Bottom
            
            attachedObjects: [
                SystemToast {
                    id: preferencesSaveSuccessToast
                    body: "Preferences have been saved successfully!"
                },
                SystemToast {
                    id: preferencesSaveErrorToast
                    body: "An error occurred while attempting to save your preferences."
                }
            ]
            
            onClicked: {
                if (UserPreferences.save()) {
                    preferencesSaveSuccessToast.show();
                } else {
                    preferencesSaveErrorToast.show();
                }
            }
        }
    }
}
