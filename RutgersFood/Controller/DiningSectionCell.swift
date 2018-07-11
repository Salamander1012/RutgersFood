//
//  DiningSectionCell.swift
//  RutgersFood
//
//  Created by Salman Fakhri on 7/10/18.
//  Copyright © 2018 Salman Fakhri. All rights reserved.
//

import UIKit

class DiningSectionCell: UITableViewCell {

    static var reuseIdentifier = "diningSection"
    static var sectionHeight: CGFloat = 350
    
    let cellTitle: UILabel = {
        let title = UILabel()
        title.text = "DINING HALLS"
        title.textColor = .darkGray
        title.font = UIFont.boldSystemFont(ofSize: 20)
        return title
    }()
    
    let flowLayout = UICollectionViewFlowLayout()
    
    var collectionView: UICollectionView!
    var pageData: HomeResponse?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpTitleFont()
        setUpCollectionView()
        getPageData()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getPageData() {
        let store = DataStore()
        store.getDiningOptions { (res) in
            switch res {
            case .success(let homeData):
                self.pageData = homeData
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func setUpTitleFont() {
        cellTitle.translatesAutoresizingMaskIntoConstraints = false
        addSubview(cellTitle)
        cellTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        cellTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
    }
    
    func setUpCollectionView() {
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width - 50, height: DiningSectionCell.sectionHeight - cellTitle.frame.height - 80)
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 15
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(DiningHallCell.self, forCellWithReuseIdentifier: DiningHallCell.reuseIdentifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: cellTitle.bottomAnchor, constant: 10).isActive = true
        collectionView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension DiningSectionCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiningHallCell.reuseIdentifier, for: indexPath) as? DiningHallCell {
            if let diningHall = pageData?.dining_halls[indexPath.row] {
                cell.setUpCell(with: diningHall)
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = pageData?.dining_halls.count {
            return count
        } else {
            return 0
        }
    }
    
    
}
