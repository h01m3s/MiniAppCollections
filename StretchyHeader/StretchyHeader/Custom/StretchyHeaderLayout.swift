//
//  StretchyHeaderLayout.swift
//  StretchyHeader
//
//  Created by Weijie Lin on 12/27/18.
//  Copyright © 2018 Weijie Lin. All rights reserved.
//

import UIKit

class StretchyHeaderLayout: UICollectionViewFlowLayout {
    
    // Modify the attributes of header component
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        
        layoutAttributes?.forEach({ (attributes) in
            if attributes.representedElementKind == UICollectionView.elementKindSectionHeader {
                
                guard let collectionView = collectionView else { return }
                
                let contentOffsetY = collectionView.contentOffset.y
                
                if contentOffsetY > 0 {
                    return
                }
                
//                print(contentOffsetY)
                
                let width = collectionView.frame.width
                
                let height = attributes.frame.height - contentOffsetY
                
                // header
                attributes.frame = CGRect(x: 0, y: contentOffsetY, width: width, height: height)
                
            }
        })
        
        return layoutAttributes
        
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        // Calculate attributes value every time
        return true
    }

}
