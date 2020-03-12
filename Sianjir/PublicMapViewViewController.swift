//
//  PublicMapViewViewController.swift
//  Sianjir
//
//  Created by Ryan Anslyno Khohari on 12/03/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class PublicMapViewViewController: UIViewController {

    @IBOutlet weak var buttonKRL: UIView!
    var buttongantiwarna = "no"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
     
    }
    @IBAction  func buttonkrlfunc (sender: Any){
        buttonkrlvar.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
    }
    @IBAction  func buttonmrtfunc (sender: Any){
        buttonmrtvar.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
    }
    @IBOutlet weak var buttonkrlvar: UIView!
    @IBOutlet weak var buttonmrtvar: UIView!
    
    


}
