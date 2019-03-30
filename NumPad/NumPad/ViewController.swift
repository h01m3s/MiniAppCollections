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
    fileprivate let greenButtonCellId = "greenButtonCellId"
    fileprivate let backspaceCellId = "backspaceCellId"
    
    lazy var leftRightPadding = view.frame.width * 0.13
    lazy var interSpacing = view.frame.width * 0.1
    lazy var cellWidth = (view.frame.width - 2 * leftRightPadding - 2 * interSpacing) / 3
    
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
        collectionView.register(GreenCallButtonCell.self, forCellWithReuseIdentifier: greenButtonCellId)
        collectionView.register(DialedNumbersHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView.register(BackspaceCell.self, forCellWithReuseIdentifier: backspaceCellId)
    }
    
    var dialedNumbersDisplayString = ""
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            if indexPath.item == 1 {
                dialedNumbersDisplayString = String(dialedNumbersDisplayString.dropLast())
            }
        } else {
            let number = numbers[indexPath.item]
            dialedNumbersDisplayString += number
        }
        collectionView.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! DialedNumbersHeader
        header.numbersLabel.text = dialedNumbersDisplayString
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        let height = view.frame.height * 0.2
        return .init(width: view.frame.width, height: height)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 1 {
            return 2
        }
        return numbers.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 1 {
            if indexPath.item == 0 {
                let greenButtonCell = collectionView.dequeueReusableCell(withReuseIdentifier: greenButtonCellId, for: indexPath) as! GreenCallButtonCell
                return greenButtonCell
            } else {
                let backspaceCell = collectionView.dequeueReusableCell(withReuseIdentifier: backspaceCellId, for: indexPath) as! BackspaceCell
                return backspaceCell
            }
            
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! KeyCell
        cell.digitsLabel.text = numbers[indexPath.item]
        cell.lettersLabel.text = lettering[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if section == 1 {
            let leftPadding = view.frame.width / 2 - cellWidth / 2
            return .init(top: 0, left: leftPadding, bottom: 0, right: self.leftRightPadding)
        }
        
        let leftRightPadding = view.frame.width * 0.15
        
        return .init(top: 16, left: leftRightPadding, bottom: 16, right: leftRightPadding)
    }

}

