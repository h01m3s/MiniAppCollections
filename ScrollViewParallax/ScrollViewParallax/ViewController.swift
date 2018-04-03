//
//  ViewController.swift
//  ScrollViewParallax
//
//  Created by Weijie Lin on 4/3/18.
//  Copyright © 2018 Weijie Lin. All rights reserved.
//

import UIKit

struct ScrollViewDataStruct {
    let title: String?
    let image: UIImage?
}

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    var scrollViewData = [ScrollViewDataStruct]()
    
    let viewTagValue = 10
    let tagValue = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scrollView.delegate = self
        
        scrollViewData = [ScrollViewDataStruct.init(title: "First", image: #imageLiteral(resourceName: "ironman")),
                       ScrollViewDataStruct.init(title: "Second", image: #imageLiteral(resourceName: "spiderman"))]
        
        scrollView.contentSize.width = scrollView.frame.width * CGFloat(scrollViewData.count)
        for (index, data) in scrollViewData.enumerated() {
            let view = CustomView(frame: CGRect(x: 10 + scrollView.frame.width * CGFloat(index), y: 80, width: scrollView.frame.width - 20, height: scrollView.frame.height - 90))
            view.imageView.image = data.image
            scrollView.addSubview(view)
            view.tag = index + viewTagValue
            
            let label = UILabel(frame: CGRect(origin: CGPoint(x: 0, y: 20), size: CGSize(width: 0, height: 40)))
            label.text = data.title
            label.font = UIFont.boldSystemFont(ofSize: 30)
            label.sizeToFit()
            label.tag = index + tagValue
            if index == 0 {
                label.center.x = view.center.x
            } else {
                label.center.x = view.center.x - scrollView.frame.width / 2
            }
            
            scrollView.addSubview(label)
        }
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == scrollView {
            for i in 0 ..< scrollViewData.count {
                let label = scrollView.viewWithTag(i + tagValue) as! UILabel
                let view = scrollView.viewWithTag(i + viewTagValue) as! CustomView
                let scrollContentOffset = scrollView.contentOffset.x + scrollView.frame.width
                
                var viewOffset = (view.center.x - scrollView.bounds.width / 4) - scrollContentOffset
                label.center.x = scrollContentOffset - ((scrollView.bounds.width / 4 - viewOffset) / 2)
            }
        }
    }

}

class CustomView: UIView {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .darkGray
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        imageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

