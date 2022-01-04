// File Name:       counter.qml
// By:              Darian Benam (GitHub: https://www.github.com/BeardedFish/)
// Date Created:    Monday, January 3, 2022

import bb.system 1.0
import bb.cascades 1.4

Page {
    property int counterValue: 0
    
    function incrementCounter() {
        counterValue++
        
        if (counterValue > 0) {
            toggleButtons(true)
        }
    }
    
    function decrementCounter() {
        counterValue--
        
        if (counterValue <= 0) {
            toggleButtons(false)
        }
    }
    
    function resetCounter() {
        counterValue = 0
        toggleButtons(false)
    }
    
    function toggleButtons(state) {
        btnReset.enabled = state
        btnDecrement.enabled = state
    }
    
    Container {
        layout: DockLayout {}
        background: Application.themeSupport.theme.colorTheme.style == VisualStyle.Bright ? Color.create("#0074cc") : Color.create("#121212")
        
        Container {
            layout: StackLayout {}
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            
            Label {
                id: lblCounterValue
                horizontalAlignment: HorizontalAlignment.Center
                text: counterValue
                bottomMargin: 75
                textStyle.color: Color.White
                textStyle.fontSize: FontSize.PointValue
                textStyle.fontSizeValue: 35
                textStyle.fontWeight: FontWeight.W500
            }
            
            Button {
                id: btnIncrement
                accessibility.name: "Increment"
                bottomMargin: 40
                color: Color.Green
                imageSource: "asset:///images/icons/ic_add.png"
                horizontalAlignment: HorizontalAlignment.Center
                
                onClicked: {
                    incrementCounter()
                }
            }
            
            Button {
                id: btnDecrement
                accessibility.name: "Decrement"
                bottomMargin: 40
                color: Color.Red
                imageSource: "asset:///images/icons/ic_subtract.png"
                horizontalAlignment: HorizontalAlignment.Center
                enabled: false
                
                onClicked: {
                    decrementCounter()
                }
            }
            
            Button {
                id: btnReset
                objectName: "resetCounterButton"
                accessibility.name: "Reset Counter"
                color: Color.White
                imageSource: "asset:///images/icons/ic_reload.png"
                horizontalAlignment: HorizontalAlignment.Center
                enabled: false
                
                onClicked: {
                    if (UserPreferences.getWarnOnReset()) {
                        confirmResetDialog.show()
                    } else {
                        resetCounter()
                    }
                }
                
                attachedObjects: [
                    SystemDialog {
                        id: confirmResetDialog
                        title: "Confirm"
                        body: "Are you sure you want to reset the counter back to 0?"
                        confirmButton.label: "Yes"
                        cancelButton.label: "No"
                        onFinished: {
                            if (confirmResetDialog.result == SystemUiResult.ConfirmButtonSelection) {
                                resetCounter()
                            }
                        }
                    }
                ]
            }
        }
    }
}
