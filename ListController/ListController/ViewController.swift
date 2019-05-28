//
//  ViewController.swift
//  ListController
//
//  Created by Weijie Lin on 5/26/19.
//  Copyright © 2019 Weijie Lin. All rights reserved.
//

import LBTATools

class MessageCell: LBTAListCell<UIColor> {
    
    let imageView = UIImageView(backgroundColor: .gray)
    let nameLabel = UILabel(text: "User name", font: .boldSystemFont(ofSize: 16))
    let messageLabel = UILabel(text: "Hey, what's up.", font: .systemFont(ofSize: 14), textColor: .gray, numberOfLines: 2)
    
    override var item: UIColor! {
        didSet {
            backgroundColor = item
        }
    }
    
    override func setupViews() {
        super.setupViews()
        
        imageView.layer.cornerRadius = 64 / 2
        
        hstack(imageView.withWidth(64).withHeight(64),
               stack(nameLabel, messageLabel, spacing: 4),
               spacing: 12,
               alignment: .center
               ).withMargins(.allSides(16))
    }
    
}

class MessagesController: LBTAListController<MessageCell, UIColor>, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Messages"
        
        items = [
            .red, .blue, .yellow, .green, .purple
        ]
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 100)
    }

}

