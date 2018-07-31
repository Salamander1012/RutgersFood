//
//  ViewController.swift
//  RutgersFood
//
//  Created by Salman Fakhri on 7/10/18.
//  Copyright © 2018 Salman Fakhri. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController {
    
    let viewModel: FoodViewModel = {
        let vm = FoodViewModel()
        return vm
    }()
    
    let tableView: UITableView = {
        let tb = UITableView()
        return tb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewConfig()
    }
    
    func viewConfig() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Rutgers Food"
        setUpTableViewConstraints()
        viewModel.registerCells(forTableView: tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setUpTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension FoodViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
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

