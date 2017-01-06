//
//  ViewController.swift
//  SwiftySwitch
//
//  Created by Seth Rininger on 1/5/17.
//  Copyright © 2017 Energy Sense Finance. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SwiftySwitchDelegate {
    
    @IBOutlet weak var swiftySwitch: SwiftySwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        swiftySwitch.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func valueChanged(sender: SwiftySwitch) {
        if sender.isOn {
            //code when switch is turned on
            print("Switch turned on! :)")
        } else {
            //code when switch is turned off
            print("Switch turned off! :(")
        }
    }
}

