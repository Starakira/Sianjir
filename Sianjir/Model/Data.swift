//
//  Data.swift
//  Sianjir
//
//  Created by Auriga Aristo on 27/03/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import Foundation

struct Data {
    static func getRoadData() -> [Road] {
        var roads: [Road] = []
        roads.append(Road(name: "Jl. Mangga Dua", condition: 0))
        roads.append(Road(name: "Jl. Bundaran HI", condition: 1))
        roads.append(Road(name: "Jl. Kemayoran", condition: 2))
        roads.append(Road(name: "Jl. Menteng", condition: 1))
        roads.append(Road(name: "Jl. Cikampek", condition: 0))
        return roads
    }
}
