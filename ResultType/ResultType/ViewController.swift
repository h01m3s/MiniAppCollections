//
//  ViewController.swift
//  ResultType
//
//  Created by Weijie Lin on 4/2/19.
//  Copyright © 2019 Weijie Lin. All rights reserved.
//

import UIKit

struct Course: Decodable {
    let id: Int
    let name: String
    let imageUrl: String
    let number_of_lessons: Int
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

