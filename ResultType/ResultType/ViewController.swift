//
//  ViewController.swift
//  ResultType
//
//  Created by Weijie Lin on 4/2/19.
//  Copyright © 2019 Weijie Lin. All rights reserved.
//

import UIKit

// http://api.letsbuildthatapp.com/jsondecodable/courses

struct Course: Decodable {
    let id: Int
    let name: String
    let imageUrl: String
    let number_of_lessons: Int
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchCoursesJSON { (result) in
            switch result {
            case .success(let courses):
                courses.forEach({ (course) in
                    print(course.name)
                })
            case .failure(let err):
                print("Failed to fetch courses: ", err)
            }
        }
    }
    
    fileprivate func fetchCoursesJSON(completion: @escaping (Result<[Course], Error>) -> ()) {
        let urlString = "https://api.letsbuildthatapp.com/jsondecodable/courses"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            
            if let err = err {
                completion(.failure(err))
                return
            }
            
            // successful
            do {
                let courses = try JSONDecoder().decode([Course].self, from: data!)
                completion(.success(courses))
            } catch  let jsonError {
                completion(.failure(jsonError))
            }
            
            
        }.resume()
    }

}

