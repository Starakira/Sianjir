//
//  InfoViewController.swift
//  Sianjir
//
//  Created by Maulana on 11/03/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit
import MapKit

class InfoViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
           super.viewDidLoad()
            
       }

       @IBAction func switchViews(sender: UISegmentedControl){
        switch sender.selectedSegmentIndex {
        case 1:
            mapView.mapType = .hybrid
        default:
            mapView.mapType = .standard
        }
           
    }
}

