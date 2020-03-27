//
//  Road.swift
//  Sianjir
//
//  Created by Auriga Aristo on 27/03/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

struct Road {
    let name: String
    let condition: Int
    
    func getConditionImage() -> UIImage? {
        switch condition {
        case 0:
            return UIImage(named: K.image.banjirRingan)
        case 1:
            return UIImage(named: K.image.banjirSedang)
        case 2:
            return UIImage(named: K.image.banjirParah)
        default:
            return nil
        }
    }
    
    func getStatus() -> String {
        let status: [String] = [K.banjirRingan, K.banjirSedang, K.banjirParah]
        return status[condition]
    }
}
