//
//  ViewController.swift
//  UITextView Auto Sizing
//
//  Created by Weijie Lin on 1/23/18.
//  Copyright © 2018 Weijie Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let textView = UITextView()
        textView.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        textView.backgroundColor = .lightGray
//        textView.text = "SOME DEFAULT TEXT THAT WE WANT TO SHOW AND IT MIGHT BE A COUPLE OF LINES THAT ARE WORD WRAPPED."
        
        view.addSubview(textView)
        
        // Use auto layout to set textView frame
        textView.translatesAutoresizingMaskIntoConstraints = false
        [
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            textView.heightAnchor.constraint(equalToConstant: 50)
            ].forEach {
                $0.isActive = true
            }
        
        textView.font = UIFont.preferredFont(forTextStyle: .headline)
        textView.delegate = self
        textView.isScrollEnabled = false
        textViewDidChange(textView)
        }
    
}

extension ViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        print(textView.text)
        
        let size = CGSize(width: view.frame.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        
        textView.constraints.forEach { (constraint) in
            if constraint.firstAttribute == .height {
                constraint.constant = estimatedSize.height
            }
        }
    }
    
}

