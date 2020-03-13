//
//  PublicMapViewViewController.swift
//  Sianjir
//
//  Created by Ryan Anslyno Khohari on 12/03/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class PublicMapViewController: UIViewController {
    
    @IBOutlet weak var viewButton: UIView!
    @IBOutlet weak var labelCount: UILabel!
    
    var isEnabled = true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonLike(_ sender: Any) {
        viewButton.backgroundColor = UIColor.lightGray
        labelCount.alpha = 1
        labelCount.textColor = UIColor.white
        isEnabled = false
        
    }
    
}
