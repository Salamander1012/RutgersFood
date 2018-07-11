//
//  ViewController.swift
//  RutgersFood
//
//  Created by Salman Fakhri on 7/10/18.
//  Copyright © 2018 Salman Fakhri. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewConfig()
    }
    
    func viewConfig() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Rutgers Food"
        let foodView = FoodView()
        foodView.tableView.delegate = self
        foodView.tableView.dataSource = self
        view = foodView
    }
}

extension FoodViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: DiningSectionCell.reuseIdentifier) as? DiningSectionCell {
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return DiningSectionCell.sectionHeight
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
}

