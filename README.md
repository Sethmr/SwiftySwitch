# SwiftySwitch
A Customizable Switch for the Storyboard.

** Use: **
In order to use SwiftySwitch, drag SwiftySwitch.swift into your project.

Next, make a UIView on your storyboard and make its class SwiftySwitch.
![Screenshot](https://github.com/Sethmr/SwiftySwitch/blob/master/SwiftySwitch/UIViewSetup.png)

Now, make the frame the size you want it in the storyboard. If you look at the size inspector, it will show the width and height of the Switch.
![Screenshot](https://github.com/Sethmr/SwiftySwitch/blob/master/SwiftySwitch/Frame.png)

Take the width and height of the switch and place them into the MySize section of the Switch (I currently found this as my only option if I want the switch to display correctly in the storyboard.)
![Screenshot](https://github.com/Sethmr/SwiftySwitch/blob/master/SwiftySwitch/SwiftySwitchOptions.png)

Drag an outlet from the SwiftySwitch to the contained viewController.

In viewDidLoad add swiftySwitch.delegate = self.

Add this function inside the viewController:
func valueChanged(sender: CustomSwitch) {
    if sender.isOn {
        //code when switch is turned on
    } else {
        //code when switch is turned off
    }
}

Enjoy!!!!!!




**Options:**

Is On: holds the current state of the switch, changing it performs the animation
My Size: Holds the width/height of your Switch
Corners 0to1: A multiplier that changing the borderRadius of the background (0 == no radius, 0.5 == circular, >0.5 == pointed)
Main Color: The color of the background

Dot Off Color: The dot color when on
Dot On Color: The dot color when off
Dot Spacer: The distance between the background and the Inner Circle on top/bottom and (left or right), small == better

Small Dot Color: The color of the inner small dot that only is there when on, clear if you don't want this
Small Dot 0to1: A multiplier on the inner dot, 0.5 would be half the diameter of the larger dot

