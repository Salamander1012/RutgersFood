//
//  FoodView.swift
//  RutgersFood
//
//  Created by Salman Fakhri on 7/10/18.
//  Copyright © 2018 Salman Fakhri. All rights reserved.
//

import UIKit

class FoodView: UIView {
    
    let tableView: UITableView = {
        let tb = UITableView()
        tb.register(DiningSectionCell.self, forCellReuseIdentifier: DiningSectionCell.reuseIdentifier)
        return tb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setUpTableViewConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    
}
