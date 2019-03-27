//
//  ViewController.swift
//  NumPad
//
//  Created by Weijie Lin on 3/25/19.
//  Copyright © 2019 Weijie Lin. All rights reserved.
//

import UIKit

class KeyCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellId = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        collectionView.register(KeyCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! KeyCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let leftRightPadding = view.frame.width * 0.13
        let interSpacing = view.frame.width * 0.1
        
        let cellWidth = (view.frame.width - 2 * leftRightPadding - 2 * interSpacing) / 3
        
        return .init(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let leftRightPadding = view.frame.width * 0.15
//        let interSpacing = view.frame.width * 0.1
//        let cellWidth = ...
        
        return .init(top: 16, left: leftRightPadding, bottom: 16, right: leftRightPadding)
    }

}

