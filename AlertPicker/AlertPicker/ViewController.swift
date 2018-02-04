//
//  ViewController.swift
//  AlertPicker
//
//  Created by Weijie Lin on 1/29/18.
//  Copyright © 2018 Weijie Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let pickerContent = (0...59).map { String($0) }
    
    lazy var pickerButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.setTitle("Show Picker", for: .normal)
        button.addTarget(self, action: #selector(showPicker), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(pickerButton)
        
        pickerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pickerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        pickerButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        pickerButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    @objc func showPicker() {
        
        let alertView = UIAlertController(title: "", message: "", preferredStyle: UIAlertControllerStyle.alert)
        
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: 250, height: 200))
        pickerView.dataSource = self
        pickerView.delegate = self
        
//        alertView.view.addSubview(pickerView)
        alertView.setValue(pickerView, forKey: "accessoryView")
        
        let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        
        alertView.addAction(action)
        present(alertView, animated: true, completion: nil)
        
//        pickerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
//        pickerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
//        pickerView.heightAnchor.constraint(equalToConstant: 200).isActive = true
//        pickerView.widthAnchor.constraint(equalToConstant: 250).isActive = true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerContent.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerContent[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(pickerContent[row])
    }

}

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let pickerView = UIPickerView()
    let pickerContent = (0...59).map { String($0) }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        view.bounds = CGRect(x: 0, y: 0, width: 200, height: 200)
        
        view.addSubview(pickerView)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.layer.borderWidth = 1
        pickerView.layer.cornerRadius = 5
        pickerView.layer.borderColor = UIColor.lightGray.cgColor
        pickerView.clipsToBounds = true
        
        view.addSubview(pickerView)

        pickerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        pickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pickerView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        pickerView.widthAnchor.constraint(equalToConstant: 250).isActive = true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerContent.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerContent[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(pickerContent[row])
    }
}

