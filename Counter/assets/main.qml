/**
 * File Name: main.qml
 * Purpose: A Qt Modeling Language file that contains code for a simple counting app. The app has 3
 *          buttons which are add, subtract and reset. The add button adds 1 to the current value of
 *          the counter, the subtract button subtracts 1 from the current value of the counter, and
 *          the reset buttons resets the counter to 0.
 * Coder: Darian Benam
 * Coders GitHub: https://www.github.com/BeardedFish
 * Date File Created: Dec. 22, 2019
 */

import bb.system 1.0
import bb.cascades 1.4

Page {
    property int counterValue: 0 // The value the counter is currently at

    /**
     * Adds 1 to the counter variable.
     */
    function addCounter() {
        counterValue++
        
        if (counterValue > 0) {
            toggleButtons(true)
        }
    }
    
    /**
     * Subtracts 1 to the counter variable.
     */
    function subtractCounter() {
        counterValue--

        if (counterValue <= 0) {
            toggleButtons(false)
        }
    }

    /**
     * Resets the counter variable back to 0.
     */
    function resetCounter() {
        counterValue = 0
        toggleButtons(false)
    }
    
    /**
     * Toggles the enable state of both the reset button and the subtract button.
     * 
     * Parameters:
     * state -> A boolean that states whether the controls should be enabled (true) or not (false).
     */
    function toggleButtons(state)
    {
        btnReset.enabled = state
        btnSubtract.enabled = state
    }

    Container {
        layout: DockLayout {}
    
        background: appBackground.imagePaint
        attachedObjects: [
            ImagePaintDefinition {
                id: appBackground
                imageSource: "asset:///images/app_bg.png"
            }
        ]
           
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
                id: addButton
                bottomMargin: 40
                color: Color.Green
                imageSource: "asset:///images/ic_add.png"
                horizontalAlignment: HorizontalAlignment.Center
                
            
                onClicked: {
                    addCounter()
                }  
            } // End add button
            
            Button {
                id: btnSubtract
                bottomMargin: 40
                color: Color.Red
                imageSource: "asset:///images/ic_subtract.png"
                horizontalAlignment: HorizontalAlignment.Center
                enabled: false 

                onClicked: {
                    subtractCounter()
                }         
            } // End subtract button
            
            Button {
                id: btnReset
                color: Color.White
                imageSource: "asset:///images/ic_reload.png"
                horizontalAlignment: HorizontalAlignment.Center
                enabled: false
                
                onClicked: {
                    confirmResetDialog.show()            
                }
                
                attachedObjects: [
                    SystemDialog {
                        id: confirmResetDialog
                        title: "Confirm"
                        body: "Are you sure you want to reset the counter back to 0?"
                        confirmButton.label: "Yes"
                        cancelButton.label: "No"
                        onFinished: {
                            // Only reset the counter to 0 if the user clicks the "Yes" button
                            if (confirmResetDialog.result == SystemUiResult.ConfirmButtonSelection)
                            {
                                resetCounter()
                            }
                        }
                    }
                ]  
            } // End reset button
        } // End container
    } // End container
} // End page
