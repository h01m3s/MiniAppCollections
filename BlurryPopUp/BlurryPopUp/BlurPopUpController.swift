//
//  BlurPopUpController.swift
//  BlurryPopUp
//
//  Created by Weijie Lin on 2/7/18.
//  Copyright © 2018 Weijie Lin. All rights reserved.
//

import UIKit

class BlurPopUpController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let PickerData = (0...59).map { String($0) }
    let pickerDataSize = 120_000
    
    let imageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Ultron"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let effect = UIBlurEffect(style: .light)
    
    lazy var visualEffectView: UIVisualEffectView = {
        let visualView = UIVisualEffectView(effect: nil)
        visualView.frame = self.view.bounds
        visualView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return visualView
    }()
    
    lazy var addItemView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width * 2/3, height: 250)
        view.backgroundColor = .white
        view.alpha = 0.6
        view.layer.cornerRadius = 5
        let pickerView = UIPickerView()
        pickerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - 35)
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.selectRow(pickerDataSize / 2, inComponent: 0, animated: false)
        let doneButton = UIButton(type: .system)
        doneButton.setTitle("Done", for: .normal)
        doneButton.addTarget(self, action: #selector(handleDone), for: .touchUpInside)
        doneButton.frame = CGRect(x: 0, y: 0, width: 150, height: 100)
        doneButton.backgroundColor = .cyan
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.layer.cornerRadius = 5
        view.addSubview(doneButton)
        doneButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -4).isActive = true
        doneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        doneButton.widthAnchor.constraint(equalToConstant: view.frame.width * 1/4).isActive = true
        doneButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        view.addSubview(pickerView)
        pickerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        pickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(imageView)
        
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleAdd))
        view.addSubview(visualEffectView)
        
        viewWillLayoutSubviews()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSize
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return PickerData[row % PickerData.count]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // Let PickerView go back to middle so user won't know
        let position = pickerDataSize / 2 + row % PickerData.count
        pickerView.selectRow(position, inComponent: 0, animated: false)
        
        // Get actual selected value
        navigationItem.title = String(row % PickerData.count)
    }
    
    func animateIn() {
        view.addSubview(addItemView)
        addItemView.center = self.view.center
        
        addItemView.transform = CGAffineTransform.init(scaleX: 0.1, y: 0.1)
        addItemView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.visualEffectView.effect = self.effect
            self.addItemView.alpha = 1
            self.addItemView.transform = CGAffineTransform.identity
        }
    }
    
    func animateOut() {
        UIView.animate(withDuration: 0.4, animations: {
            self.addItemView.transform = CGAffineTransform.init(scaleX: 0.1, y: 0.1)
            self.addItemView.alpha = 0
            self.visualEffectView.effect = nil
        }) { (_) in
            self.addItemView.removeFromSuperview()
        }
    }
    
    @objc func handleAdd() {
        animateIn()
    }
    
    @objc func handleDone() {
        animateOut()
    }
    
}
