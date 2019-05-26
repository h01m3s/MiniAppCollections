//
//  ViewController.swift
//  ScrollView_Keyboard
//
//  Created by Weijie Lin on 5/22/19.
//  Copyright © 2019 Weijie Lin. All rights reserved.
//

import LBTATools

class ViewController: LBTAFormController {
    
    let signUpButton = UIButton(title: "Sign Up", titleColor: .white, font: .boldSystemFont(ofSize: 16), backgroundColor: #colorLiteral(red: 0.2901960784, green: 0.5058823529, blue: 0.9490196078, alpha: 1), target: self, action: #selector(handleCancel))
    let cancelButton = UIButton(title: "Cancel", titleColor: .white, font: .boldSystemFont(ofSize: 16), backgroundColor: .red, target: self, action: #selector(handleCancel))
    
    @objc fileprivate func handleCancel() {
        dismiss(animated: true)
    }
    
    let fbButton = UIButton(image: #imageLiteral(resourceName: "fb_circle.png").withRenderingMode(.alwaysOriginal))
    let twitterButton = UIButton(image: #imageLiteral(resourceName: "twitter_circle.png").withRenderingMode(.alwaysOriginal))
    let gitHubButton = UIButton(image: #imageLiteral(resourceName: "github_circle.png").withRenderingMode(.alwaysOriginal))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
        
        scrollView.alwaysBounceVertical = true
        
        formContainerStackView.axis = .vertical
        formContainerStackView.spacing = 12
        formContainerStackView.layoutMargins = .init(top: 0, left: 24, bottom: 16, right: 24)
        
        let imageView = UIImageView(image: #imageLiteral(resourceName: "logo"), contentMode: .scaleAspectFit)
        imageView.constrainHeight(64)
        
        formContainerStackView.addArrangedSubview(imageView)
        
        (0...1).forEach{ (_) in
            let textField = IndentedTextField(placeholder: "Enter text", padding: 12, cornerRadius: 5, backgroundColor: .white)
            textField.constrainHeight(60)
            formContainerStackView.addArrangedSubview(textField)
        }
        
        formContainerStackView.addArrangedSubview(signUpButton)
        formContainerStackView.addArrangedSubview(cancelButton)
        signUpButton.constrainHeight(60)
        cancelButton.constrainHeight(60)
        signUpButton.roundViewEdge(radius: 5)
        cancelButton.roundViewEdge(radius: 5)
        
        let buttonsStackView = UIStackView(arrangedSubviews: [fbButton, twitterButton, gitHubButton])
        [fbButton, twitterButton, gitHubButton].forEach {$0.imageView?.contentMode = .scaleAspectFit }
        buttonsStackView.constrainHeight(50)
        buttonsStackView.distribution = .fillEqually
        formContainerStackView.addArrangedSubview(buttonsStackView)
    }

}

extension UIView {
    
    func roundViewEdge(radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
    
}

