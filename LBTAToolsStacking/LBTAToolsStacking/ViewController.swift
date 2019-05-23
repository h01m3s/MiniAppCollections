//
//  ViewController.swift
//  LBTAToolsStacking
//
//  Created by Weijie Lin on 5/22/19.
//  Copyright © 2019 Weijie Lin. All rights reserved.
//

import UIKit
import LBTATools

class SimpleVerticalStackCell: UICollectionViewCell {
    
    let imageView = UIImageView(image: #imageLiteral(resourceName: "hk.jpg"), contentMode: .scaleAspectFill)
    let nameLabel = UILabel(text: "Hulk", textAlignment: .center)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
//        imageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
//        imageView.layer.cornerRadius = 60 / 2
//
//        let stackView = UIStackView(arrangedSubviews: [imageView, nameLabel])
//        addSubview(stackView)
//        stackView.distribution = .fillEqually
//        stackView.axis = .vertical
//        stackView.fillSuperview()
//        stackView.alignment = .center
        
        imageView.layer.cornerRadius = 80 / 2
        
        stack(imageView.withWidth(80).withHeight(80),
              nameLabel,
              alignment: .center).padTop(8)
        
        layer.borderWidth = 0.5
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}

class HorizontalStackingCell: UICollectionViewCell {
    
    let imageView = UIImageView(image: #imageLiteral(resourceName: "hk.jpg"), contentMode: .scaleAspectFill)
    let nameLabel = UILabel(text: "Hulk", font: .boldSystemFont(ofSize: 14))
    let messageLabel = UILabel(text: "Hulk, Hulk Buster... Hulk, Hulk Buster... Hulk, Hulk Buster... Hulk, Hulk Buster...", font: .systemFont(ofSize: 12), textColor: .gray, numberOfLines: 2)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView.layer.cornerRadius = 60 / 2
        
        hstack(imageView.withSize(.init(width: 60, height: 60)),
               stack(nameLabel, messageLabel, spacing: 6),
               spacing: 16,
               alignment: .center).withMargins(.allSides(side: 12))
        
        layer.borderWidth = 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}

class StackingWithMarginsCell: UICollectionViewCell {
    
    let imageView = UIImageView(image: #imageLiteral(resourceName: "hk.jpg"), contentMode: .scaleAspectFill)
    let nameLabel = UILabel(text: "Hulk", font: .boldSystemFont(ofSize: 14))
    let messageLabel = UILabel(text: "Hulk, Hulk Buster... Hulk, Hulk Buster... Hulk, Hulk Buster... Hulk, Hulk Buster...", font: .systemFont(ofSize: 12), textColor: .gray, numberOfLines: 2)
    let exploreLabel = UILabel(text: "Explore: ->", font: .boldSystemFont(ofSize: 12))
    
    let arrowImageView = UIImageView(image: #imageLiteral(resourceName: "hk.jpg"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        stack(imageView.withHeight(200),
              stack(nameLabel,
                    messageLabel,
                    UIView(),
                    hstack(exploreLabel, arrowImageView.withWidth(16).withHeight(16), UIView(), spacing: 8),
                    spacing: 8).withMargins(.allSides(side: 14))
              )
        
        layer.borderWidth = 2
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let simpleVerticalStackCellId = "SimpleVerticalStackCell"
    let hstackCellId = "hstackCellId"
    let stackingWithMarginsId = "stackingWithMarginsId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        collectionView.register(SimpleVerticalStackCell.self, forCellWithReuseIdentifier: simpleVerticalStackCellId)
        collectionView.register(HorizontalStackingCell.self, forCellWithReuseIdentifier: hstackCellId)
        collectionView.register(StackingWithMarginsCell.self, forCellWithReuseIdentifier: stackingWithMarginsId)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 { return 3 }
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellId: String
        if indexPath.section == 0 {
            cellId = simpleVerticalStackCellId
        } else if indexPath.section == 1 {
            cellId = hstackCellId
        } else {
            cellId = stackingWithMarginsId
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: 16, bottom: 16, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return .init(width: (view.frame.width - 16 * 4) / 3, height: 120)
        } else if indexPath.section == 1 {
            return .init(width: view.frame.width - 16 * 2, height: 100)
        } else {
            return .init(width: view.frame.width - 16 * 2, height: 400)
        }
    }
    
}

