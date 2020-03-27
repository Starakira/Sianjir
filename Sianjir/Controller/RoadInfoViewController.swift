//
//  RoadInfoViewController.swift
//  Sianjir
//
//  Created by Auriga Aristo on 27/03/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class RoadInfoViewController: UIViewController {

    @IBOutlet weak var roadName: UILabel!
    @IBOutlet weak var roadStatus: UILabel!
    @IBOutlet weak var roadImage: UIImageView!
    
    var road: Road = Road(name: "", condition: -1)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        roadName.text = road.name
        roadStatus.text = "Status: \(road.getStatus())"
        roadImage.image = road.getConditionImage()
    }
}
