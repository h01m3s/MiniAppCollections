//
//  ViewController.swift
//  DrawSomething
//
//  Created by Weijie Lin on 1/6/19.
//  Copyright © 2019 Weijie Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let canvas = Canvas()
    
    override func loadView() {
        // set default view to Canvas View
        self.view = canvas
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        canvas.backgroundColor = .white
    }


}

