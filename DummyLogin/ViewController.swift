//
//  ViewController.swift
//  DummyLogin
//
//  Created by Arkan Haryo on 6/17/20.
//  Copyright © 2020 Arkan Haryo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let topRightImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "loginbg")
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let welcomeText: UITextView = {
        let textView = UITextView()
        textView.text = "Welcome"
        textView.backgroundColor = .clear
        textView.textColor = .white
        textView.font = .boldSystemFont(ofSize: 20)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.isEditable = false
        return textView
    }()
    
    private let welcomeText2: UITextView = {
        let textView = UITextView()
        textView.text = "Plase Sign In to Continue"
        textView.backgroundColor = .clear
        textView.textColor = .white
        textView.font = .boldSystemFont(ofSize: 15)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.isEditable = false
        return textView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Login Activity
        view.backgroundColor = .white
        setupLayout()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        // Overriding the status bar stylization
        return .lightContent
    }
    
    private func setupLayout() {
        // Adding top container that has been sized for a half of the screen
        let topContainer = UIView()
        topContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topContainer)
        // setup-ing the container
        NSLayoutConstraint.activate([
            // Sizing the top container
            topContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            topContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            topContainer.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5),
            // Positioning the top container
            topContainer.topAnchor.constraint(equalTo: view.topAnchor)
        ])
        // Setting the background image for the top container
        topContainer.backgroundColor = UIColor(patternImage: UIImage(named: "greenvector")!)
        // adding the top right image to the topcontainer
        topContainer.addSubview(topRightImage)
        // Setup-ing the top right image
        NSLayoutConstraint.activate([
            // positioning the top right image
            topRightImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            // sizing the top right image
            topRightImage.trailingAnchor.constraint(equalTo: topContainer.trailingAnchor),
            topRightImage.leadingAnchor.constraint(equalTo: topContainer.leadingAnchor),
            topRightImage.heightAnchor.constraint(equalTo: topContainer.heightAnchor, multiplier: 1)
        ])
        // adding the welcome text
        topContainer.addSubview(welcomeText)
        // Setup-ing the welcometext
        NSLayoutConstraint.activate([
            // sizing the welcome text
            welcomeText.trailingAnchor.constraint(equalTo: topContainer.trailingAnchor),
            welcomeText.leadingAnchor.constraint(equalTo: topContainer.leadingAnchor,constant: 10),
            // positioning the welcome text
            welcomeText.bottomAnchor.constraint(equalTo: topContainer.bottomAnchor,constant: -50),
        ])
        // adding the welcome text 2
        topContainer.addSubview(welcomeText2)
        // Setup-ing the welcometext2
        NSLayoutConstraint.activate([
            // sizing the welcometext2
            // Wrap Content for the width automatically
            welcomeText2.leadingAnchor.constraint(equalTo: topContainer.leadingAnchor, constant: 10),
            // positioning the welcome text2
            welcomeText2.topAnchor.constraint(equalTo: welcomeText.bottomAnchor,constant: 1)
        ])
    }
}

