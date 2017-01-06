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
    @IBOutlet weak var swiftySwitch2: SwiftySwitch!
    @IBOutlet weak var swiftySwitch3: SwiftySwitch!
    @IBOutlet weak var swiftySwitch4: SwiftySwitch!
    @IBOutlet weak var swiftySwitch5: SwiftySwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let switchArray = [swiftySwitch, swiftySwitch2, swiftySwitch3, swiftySwitch4, swiftySwitch5]
        
        for eachSwitch in switchArray {
            eachSwitch?.delegate = self
        }
//        swiftySwitch.delegate = self
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

