# SwiftySwitch
A Customizable Switch for the Storyboard.<br>
The switch prevents being pressed during the one second action of flipping itself.<br>
The switch inherites directly from UIView, so you can still manipulate it on your own how you see fit.<br>
Feel free to submit issues for requests if you want me to add any features!<br><br>
![Screenshot](https://github.com/Sethmr/SwiftySwitch/blob/master/SwiftySwitch/SwiftySwitches.png)<br>
# Use:<br>
1. In order to use SwiftySwitch, drag SwiftySwitch.swift into your project.<br><br>

2. Next, make a UIView on your storyboard and make its class SwiftySwitch.<br><br>
![Screenshot](https://github.com/Sethmr/SwiftySwitch/blob/master/SwiftySwitch/UIViewSetup.png)<br>

3. Now, make the frame the size you want it in the storyboard. If you look at the size inspector, it will show the width and height of the Switch.<br><br>
![Screenshot](https://github.com/Sethmr/SwiftySwitch/blob/master/SwiftySwitch/Frame.png)<br>

4. Take the width and height of the switch and place them into the MySize section of the Switch (I currently found this as my only option if I want the switch to display correctly in the storyboard.)<br><br>
![Screenshot](https://github.com/Sethmr/SwiftySwitch/blob/master/SwiftySwitch/SwiftySwitchOptions.png)<br>

5. Drag an outlet from the SwiftySwitch to the contained viewController.<br><br>

6. In viewDidLoad add swiftySwitch.delegate = self.<br><br>

7. in the class declaration add SwiftySwitchDelegate and add the delegates required function like so:
```objc
class viewController: UIViewController, SwiftySwitchDelegate {

    @IBAction weak var swiftySwitch: SwiftySwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        swiftySwitch.delegate = self
    }
    
    //add this function inside the desired viewController
    func valueChanged(sender: SwiftySwitch) {
        if sender.isOn {
            //code when switch is turned on
        } else {
            //code when switch is turned off
        }
    }
}
```
<br>
Enjoy!!!!!!<br><br><br>




# Options:<br>

Is On: holds the current state of the switch, changing it performs the animation<br><br>
My Size: Holds the width/height of your Switch<br><br>
Corners 0to1: A multiplier that changing the borderRadius of the background (0 == no radius, 0.5 == circular, >0.5 == pointed) If set greater than 1.0 sets to default.<br><br>
Main Color: The color of the background<br><br><br>

Dot Time: The time the switches transition takes. I can't imagine wanting greater than 5, but maybe you want to use this for something I never imagined. If >20 then I set it to the default value of 1 in didSet.
Dot Off Color: The dot color when off<br><br>
Dot On Color: The dot color when on<br><br>
Dot Spacer: The distance between the background and the Inner Circle on top/bottom and (left or right), small == better, If set too large than sets to default.<br><br><br>

Small Dot Color: The color of the inner small dot that only is there when on, clear if you don't want this<br><br>
Small Dot 0to1: A multiplier on the inner dot, 0.5 would be half the diameter of the larger dot, If set greater than 1.0 sets to default.

