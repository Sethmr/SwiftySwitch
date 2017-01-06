# SwiftySwitch
A Customizable Switch for the Storyboard.

<br><br>
# Use:<br>
In order to use SwiftySwitch, drag SwiftySwitch.swift into your project.<br><br>

Next, make a UIView on your storyboard and make its class SwiftySwitch.<br><br>
![Screenshot](https://github.com/Sethmr/SwiftySwitch/blob/master/SwiftySwitch/UIViewSetup.png)<br>

Now, make the frame the size you want it in the storyboard. If you look at the size inspector, it will show the width and height of the Switch.<br><br>
![Screenshot](https://github.com/Sethmr/SwiftySwitch/blob/master/SwiftySwitch/Frame.png)<br>

Take the width and height of the switch and place them into the MySize section of the Switch (I currently found this as my only option if I want the switch to display correctly in the storyboard.)<br><br>
![Screenshot](https://github.com/Sethmr/SwiftySwitch/blob/master/SwiftySwitch/SwiftySwitchOptions.png)<br>

Drag an outlet from the SwiftySwitch to the contained viewController.<br><br>

In viewDidLoad add swiftySwitch.delegate = self.<br><br>

Add this function inside the viewController:<br>
```objc
func valueChanged(sender: CustomSwitch) {
    if sender.isOn {
        //code when switch is turned on
    } else {
        //code when switch is turned off
    }
}
```
<br><br>
Enjoy!!!!!!<br><br><br><br>




# Options:<br>

Is On: holds the current state of the switch, changing it performs the animation<br><br>
My Size: Holds the width/height of your Switch<br><br>
Corners 0to1: A multiplier that changing the borderRadius of the background (0 == no radius, 0.5 == circular, >0.5 == pointed)<br><br>
Main Color: The color of the background<br><br><br>

Dot Off Color: The dot color when on<br><br>
Dot On Color: The dot color when off<br><br>
Dot Spacer: The distance between the background and the Inner Circle on top/bottom and (left or right), small == better<br><br><br>

Small Dot Color: The color of the inner small dot that only is there when on, clear if you don't want this<br><br>
Small Dot 0to1: A multiplier on the inner dot, 0.5 would be half the diameter of the larger dot

