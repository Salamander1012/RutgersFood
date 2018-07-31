//
//  DiningHallCell.swift
//  RutgersFood
//
//  Created by Salman Fakhri on 7/10/18.
//  Copyright © 2018 Salman Fakhri. All rights reserved.
//

import UIKit

class DiningHallCell: UICollectionViewCell {
    static var reuseIdentifier = "diningHallCell"
    
    let imageView: UIImageView = {
        let view = UIImageView()
//        view.backgroundColor = UIColor(displayP3Red: 230/255, green: 230/255, blue: 230/255, alpha: 1.0)
        view.image = #imageLiteral(resourceName: "brower")
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Brower Commons"
        label.font = label.font.withSize(17)
        label.textColor = .black
        return label
    }()
    
    let campusLabel: UILabel = {
        let label = UILabel()
        label.text = "College Ave"
        label.font = label.font.withSize(15)
        label.textColor = .lightGray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setUpCampusLabel()
        setUpNameLabel()
        setUpImageView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -10).isActive = true
    }
    
    func setUpNameLabel() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(nameLabel)
        nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: campusLabel.topAnchor, constant: -5).isActive = true
    }
    
    func setUpCampusLabel() {
        campusLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(campusLabel)
        campusLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        campusLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
    }
    
    func setUpCell(with diningHall: HomeResponse.DiningHall) {
        nameLabel.text = diningHall.name
        campusLabel.text = diningHall.campus
        imageView.image(fromUrl: diningHall.imageURL)
    }
}

extension UIImageView {
    public func image(fromUrl urlString: String) {
        print("getting called")
        guard let url = URL(string: urlString) else {
            print("bad image url")
            return
        }
        let theTask = URLSession.shared.dataTask(with: url) {
            data, response, error in
            if let response = data {
                DispatchQueue.main.async {
                    self.image = UIImage(data: response)
                }
            }
        }
        theTask.resume()
    }
}
