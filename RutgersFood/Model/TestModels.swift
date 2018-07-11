//
//  TestModels.swift
//  RutgersFood
//
//  Created by Salman Fakhri on 7/11/18.
//  Copyright © 2018 Salman Fakhri. All rights reserved.
//

import Foundation

struct HomeResponse: Codable {
    let dining_halls: [DiningHall]
    struct DiningHall: Codable {
        let name: String
        let campus: String
        let imageURL: String
    }
}
