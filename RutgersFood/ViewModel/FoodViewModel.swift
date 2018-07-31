//
//  FoodViewModel.swift
//  RutgersFood
//
//  Created by Salman Fakhri on 7/16/18.
//  Copyright © 2018 Salman Fakhri. All rights reserved.
//

import Foundation
import UIKit

class FoodViewModel {
    
    private let apiService: DataStore = {
        let service = DataStore()
        return service
    }()
    
    init() {
        
    }
    
    func registerCells(forTableView tableView: UITableView) {
        tableView.register(DiningSectionCell.self, forCellReuseIdentifier: DiningSectionCell.reuseIdentifier)
    }
}
