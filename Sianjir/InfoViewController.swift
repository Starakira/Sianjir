//
//  InfoViewController.swift
//  Sianjir
//
//  Created by Maulana on 11/03/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

     @IBOutlet weak var firstView: UIView!
       @IBOutlet weak var secondView: UIView!

       override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view.
       }

       @IBAction func switchViews(sender: UISegmentedControl){
           if sender.selectedSegmentIndex == 0 {
               firstView.alpha = 1
               secondView.alpha = 0
           } else {
               firstView.alpha = 0
               secondView.alpha = 1
           }
       }


}

