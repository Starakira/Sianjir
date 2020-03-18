//
//  EmbedWeatherTableViewController.swift
//  Sianjir
//
//  Created by Maulana on 17/03/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class EmbedWeatherTableViewController: UITableViewController {

    @IBOutlet weak var labelRow1: UILabel!
    @IBOutlet weak var labelRow2: UILabel!
    @IBOutlet weak var labelRow3: UILabel!
    @IBOutlet weak var labelRow4: UILabel!
    @IBOutlet weak var labelRow5: UILabel!
    @IBOutlet weak var labelRow6: UILabel!
    @IBOutlet weak var labelRow7: UILabel!
    @IBOutlet weak var labelRow8: UILabel!
    @IBOutlet weak var labelRow9: UILabel!
    
        override func viewDidLoad() {
        super.viewDidLoad()
        
        let formatter = DateFormatter()
        let toDay = Date()
        
            labelRow1.text = DateFormatter.localizedString(from: formatter.calendar.date(byAdding: .day, value: 1, to: toDay)!, dateStyle: .medium, timeStyle: .none)
        
         labelRow2.text = DateFormatter.localizedString(from: formatter.calendar.date(byAdding: .day, value: 2, to: toDay)!, dateStyle: .medium, timeStyle: .none)
            labelRow3.text = DateFormatter.localizedString(from: formatter.calendar.date(byAdding: .day, value: 3, to: toDay)!, dateStyle: .medium, timeStyle: .none)
            labelRow4.text = DateFormatter.localizedString(from: formatter.calendar.date(byAdding: .day, value: 4, to: toDay)!, dateStyle: .medium, timeStyle: .none)
            labelRow5.text = DateFormatter.localizedString(from: formatter.calendar.date(byAdding: .day, value: 5, to: toDay)!, dateStyle: .medium, timeStyle: .none)
            labelRow6.text = DateFormatter.localizedString(from: formatter.calendar.date(byAdding: .day, value: 6, to: toDay)!, dateStyle: .medium, timeStyle: .none)
            labelRow7.text = DateFormatter.localizedString(from: formatter.calendar.date(byAdding: .day, value: 7, to: toDay)!, dateStyle: .medium, timeStyle: .none)
            labelRow8.text = DateFormatter.localizedString(from: formatter.calendar.date(byAdding: .day, value: 8, to: toDay)!, dateStyle: .medium, timeStyle: .none)
            labelRow9.text = DateFormatter.localizedString(from: formatter.calendar.date(byAdding: .day, value: 3, to: toDay)!, dateStyle: .medium, timeStyle: .none)
    }
}
