//
//  SignUpViewController.swift
//  DummyLogin
//
//  Created by Arkan Haryo on 6/21/20.
//  Copyright © 2020 Arkan Haryo. All rights reserved.
//

import Foundation
import UIKit

class SignUpViewController: UIViewController {
    
    private let labelBack: UILabel = {
        let label = UILabel()
        label.text = "Back"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let lockImage: UIImageView = {
        let image = UIImage(named: "pwicon")
        let lockImage = UIImageView(image: image)
        lockImage.translatesAutoresizingMaskIntoConstraints = false
        lockImage.contentMode = .scaleAspectFit
        return lockImage
    }()
    
    private let textFieldPassword: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .black
        textField.placeholder = "Password"
        textField.borderStyle = .none
        textField.font = .systemFont(ofSize: 15)
        textField.autocorrectionType = .no
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var tfPasswordBorder: CALayer = {
        let bottomBorder = CALayer()
        bottomBorder.frame = CGRect(x: 0.0, y: textFieldPassword.frame.height+3, width: textFieldPassword.frame.width, height: 1.6)
        bottomBorder.backgroundColor = UIColor.darkGray.cgColor
        return bottomBorder
    }()
    
    private let lockImage2: UIImageView = {
         let image = UIImage(named: "pwicon")
         let lockImage = UIImageView(image: image)
         lockImage.translatesAutoresizingMaskIntoConstraints = false
         lockImage.contentMode = .scaleAspectFit
         return lockImage
     }()
     
     private let textFieldPassword2: UITextField = {
         let textField = UITextField()
         textField.translatesAutoresizingMaskIntoConstraints = false
         textField.textColor = .black
         textField.placeholder = "Confirm Password"
         textField.borderStyle = .none
         textField.font = .systemFont(ofSize: 15)
         textField.autocorrectionType = .no
         textField.isSecureTextEntry = true
         return textField
     }()
     
     private lazy var tfPasswordBorder2: CALayer = {
         let bottomBorder = CALayer()
         bottomBorder.frame = CGRect(x: 0.0, y: textFieldPassword.frame.height+3, width: textFieldPassword.frame.width, height: 1.6)
         bottomBorder.backgroundColor = UIColor.darkGray.cgColor
         return bottomBorder
     }()
    
    private let userImage: UIImageView = {
        let image = UIImage(named: "usericon")
        let lockImage = UIImageView(image: image)
        lockImage.translatesAutoresizingMaskIntoConstraints = false
        lockImage.contentMode = .scaleAspectFit
        return lockImage
    }()
    
    
    
    private let textFieldUsername: UITextField = {
         let textField = UITextField()
         textField.translatesAutoresizingMaskIntoConstraints = false
         textField.textColor = .black
         textField.placeholder = "Username"
         textField.borderStyle = .none
         textField.font = .systemFont(ofSize: 15)
         textField.autocorrectionType = .no
         return textField
     }()
    
    private lazy var tfUsernameBorder: CALayer = {
         // Adding bottom border to the textviewusername
         let bottomBorder = CALayer()
         bottomBorder.frame = CGRect(x: 0.0, y: textFieldUsername.frame.height+3, width: textFieldUsername.frame.width, height: 1.6)
         bottomBorder.backgroundColor = UIColor.darkGray.cgColor
         return bottomBorder
     }()
    
    private let backImg: UIImageView = {
        let image = UIImage(named: "back")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private let labelNew: UILabel = {
        let label = UILabel()
        label.text = "Create New Account"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let topBGView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(patternImage: UIImage(named: "greenvector")!)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let topImageView: UIImageView = {
        let image = UIImage(named: "signupbg")
        let imageVIew = UIImageView(image: image)
        imageVIew.translatesAutoresizingMaskIntoConstraints = false
        imageVIew.contentMode = .scaleAspectFill
        return imageVIew
    }()
    
    private let botStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.autoresizesSubviews = false
        stackView.spacing = 44
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        setupLayout()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidAppear(_ animated: Bool) {
        textFieldUsername.layer.addSublayer(tfUsernameBorder)
        textFieldPassword.layer.addSublayer(tfPasswordBorder)
        textFieldPassword2.layer.addSublayer(tfPasswordBorder2)
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(back))
        tapGesture.numberOfTapsRequired = 1
        backImg.addGestureRecognizer(tapGesture)
    }
    
    private func setupLayout() {
        // Adding the topBGView
        view.addSubview(topBGView)
        // Setup-ing the topBGView
        NSLayoutConstraint.activate([
            // Sizing the bgView
            topBGView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            topBGView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            topBGView.heightAnchor.constraint(equalToConstant: 198),
            // Positioning the bgView
            topBGView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
        // Adding the topimageview into topbgview
        topBGView.addSubview(topImageView)
        // Setup-ing the topimageview
        NSLayoutConstraint.activate([
            // Sizing the topimageview
            topImageView.trailingAnchor.constraint(equalTo: topBGView.trailingAnchor),
            topImageView.leadingAnchor.constraint(equalTo: topBGView.leadingAnchor),
            topImageView.heightAnchor.constraint(equalTo: topBGView.heightAnchor, multiplier: 0.8),
            // Positioning the topimageview
            topImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
        // Adding the label
        topBGView.addSubview(labelNew)
        // Setup-ing the label
        NSLayoutConstraint.activate([
            // Sizing the label
            labelNew.leadingAnchor.constraint(equalTo: topBGView.leadingAnchor, constant: 32),
            labelNew.trailingAnchor.constraint(equalTo: topBGView.trailingAnchor),
            // Positioning the label
            labelNew.bottomAnchor.constraint(equalTo: topBGView.bottomAnchor, constant: -32)
        ])
        let horView = UIStackView()
        horView.axis = .horizontal
        horView.spacing = 12.07
        horView.translatesAutoresizingMaskIntoConstraints = false
        // Adding the back button & Label
        topBGView.addSubview(horView)
        // Setup-ing the horview
        NSLayoutConstraint.activate([
            // Positioning the horview
            horView.topAnchor.constraint(equalTo: topBGView.topAnchor, constant: 52),
            horView.leadingAnchor.constraint(equalTo: topBGView.leadingAnchor,constant: 32)
        ])
        // Adding a back button
        horView.addArrangedSubview(backImg)
        horView.addArrangedSubview(labelBack)
        //Adding bot stack view
        view.addSubview(botStackView)
        // Setup-ing the botStackView
        NSLayoutConstraint.activate([
            // Placing the bot stackview
            botStackView.topAnchor.constraint(equalTo: topBGView.bottomAnchor),
            botStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1)
        ])
        // Adding the textfield container
        let horView1 = UIStackView()
        horView1.axis = .horizontal
        horView1.translatesAutoresizingMaskIntoConstraints = false
        horView1.autoresizesSubviews = false
        horView1.spacing = 32
        // Adding the textfield
        horView1.addArrangedSubview(userImage)
        horView1.addArrangedSubview(textFieldUsername)
        // Adding the horview
        botStackView.addArrangedSubview(horView1)
        // Setuping the textfield and image
        NSLayoutConstraint.activate([
            horView1.topAnchor.constraint(equalTo: botStackView.topAnchor, constant: 95),
            horView1.leadingAnchor.constraint(equalTo: botStackView.leadingAnchor, constant: 44),
            userImage.widthAnchor.constraint(equalToConstant: 25),
            userImage.heightAnchor.constraint(equalToConstant: 25),
            textFieldUsername.trailingAnchor.constraint(equalTo: botStackView.trailingAnchor, constant: -44)
        ])
        let horView2 = UIStackView()
        horView2.axis = .horizontal
        horView2.translatesAutoresizingMaskIntoConstraints = false
        horView2.autoresizesSubviews = false
        horView2.spacing = 32
        // adding the textfield
        horView2.addArrangedSubview(lockImage)
        horView2.addArrangedSubview(textFieldPassword)
        // adding the horview
        botStackView.addArrangedSubview(horView2)
        // Setup-ing the textfield and image
        NSLayoutConstraint.activate([
            lockImage.widthAnchor.constraint(equalToConstant: 25),
            lockImage.heightAnchor.constraint(equalToConstant: 25),
            textFieldPassword.trailingAnchor.constraint(equalTo: botStackView.trailingAnchor, constant: -44)
        ])
        let horView3 = UIStackView()
        horView3.axis = .horizontal
        horView3.translatesAutoresizingMaskIntoConstraints = false
        horView3.autoresizesSubviews = false
        horView3.spacing = 32
        // adding the textfield
        horView3.addArrangedSubview(lockImage2)
        horView3.addArrangedSubview(textFieldPassword2)
        // adding the horview
        botStackView.addArrangedSubview(horView3)
        // Setup-ing the textfiend and image
        NSLayoutConstraint.activate([
            lockImage2.widthAnchor.constraint(equalToConstant: 25),
            lockImage2.heightAnchor.constraint(equalToConstant: 25),
            textFieldPassword2.trailingAnchor.constraint(equalTo: botStackView.trailingAnchor, constant: -44)
        ])
        
    }
    
    @objc private func back() {
        self.navigationController?.popViewController(animated: true)
        print("clicked")
    }
    
    
}
