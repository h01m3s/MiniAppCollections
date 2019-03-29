//
//  ViewController.swift
//  NumPad
//
//  Created by Weijie Lin on 3/25/19.
//  Copyright © 2019 Weijie Lin. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellId = "cellId"
    fileprivate let headerId = "headerId"
    
    let numbers = [
        "1", "2", "3", "4", "5", "6", "7", "8", "9", "*", "0", "#"
    ]
    
    // hack solution
    let lettering = [
        "", "A B C", "D E F", "G H I", "J K L", "M N O", "P Q R S", "T U V",
        "W X Y Z", "", "+", ""
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        
        collectionView.register(KeyCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(DialedNumbersHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    }
    
    var dialedNumbersDisplayString = ""
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        let number = numbers[indexPath.item]
        dialedNumbersDisplayString += number
        collectionView.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! DialedNumbersHeader
        header.numbersLabel.text = dialedNumbersDisplayString
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let height = view.frame.height * 0.2
        return .init(width: view.frame.width, height: height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbers.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! KeyCell
        cell.digitsLabel.text = numbers[indexPath.item]
        cell.lettersLabel.text = lettering[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let leftRightPadding = view.frame.width * 0.13
        let interSpacing = view.frame.width * 0.1
        
        let cellWidth = (view.frame.width - 2 * leftRightPadding - 2 * interSpacing) / 3
        
        return .init(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let leftRightPadding = view.frame.width * 0.15
//        let interSpacing = view.frame.width * 0.1
//        let cellWidth = ...
        
        return .init(top: 16, left: leftRightPadding, bottom: 16, right: leftRightPadding)
    }

}

