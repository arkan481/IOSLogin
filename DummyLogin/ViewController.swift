//
//  ViewController.swift
//  DummyLogin
//
//  Created by Arkan Haryo on 6/17/20.
//  Copyright © 2020 Arkan Haryo. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate {
    
    let users = [
        User(userName: "ada", password: "adaaja"),
        User(userName: "io", password: "ioaja")
    ]
    
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
    
    private let userImage: UIImageView = {
        let image = UIImage(named: "usericon")
        let lockImage = UIImageView(image: image)
        lockImage.translatesAutoresizingMaskIntoConstraints = false
        lockImage.contentMode = .scaleAspectFit
        return lockImage
    }()
    
    private let lockImage: UIImageView = {
        let image = UIImage(named: "pwicon")
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
    
    private lazy var tfUsernameBorder: CALayer = {
        // Adding bottom border to the textviewusername
        let bottomBorder = CALayer()
        bottomBorder.frame = CGRect(x: 0.0, y: textFieldUsername.frame.height+3, width: textFieldUsername.frame.width, height: 1.6)
        bottomBorder.backgroundColor = UIColor.darkGray.cgColor
        return bottomBorder
    }()
    
    private lazy var tfPasswordBorder: CALayer = {
        let bottomBorder = CALayer()
        bottomBorder.frame = CGRect(x: 0.0, y: textFieldPassword.frame.height+3, width: textFieldPassword.frame.width, height: 1.6)
        bottomBorder.backgroundColor = UIColor.darkGray.cgColor
        return bottomBorder
    }()
    
    private let buttonSignIn: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor.init(red: 54.0/255.0, green: 110.0/255.0, blue: 83.0/255.0, alpha: 1.0)
        button.setTitle("SIGN IN", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.layer.shadowOpacity = 1
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 2
        button.addTarget(self, action: #selector(loginClicked), for: .touchUpInside)
        return button
    }()
    
    private lazy var signUPTextView: UITextView = {
        let textView = UITextView()
        let signUPText = NSMutableAttributedString(string: "Don't Have an Account?", attributes: [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17),NSAttributedString.Key.foregroundColor: UIColor.black
        ])
        signUPText.append(NSAttributedString.init(string: " Sign Up", attributes: [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17),
            NSAttributedString.Key.foregroundColor: UIColor.init(red: 54.0/255.0, green: 110.0/255.0, blue: 83.0/255.0, alpha: 1.0)
        ]))
        textView.attributedText = signUPText
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.backgroundColor = .clear
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(goToSignUP))
        tapGesture.numberOfTapsRequired = 1
        textView.addGestureRecognizer(tapGesture)
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Login Activity
        view.backgroundColor = .white
        #warning("the below step is  crucial if you want to dismiss yor textfield keyboard")
        textFieldUsername.delegate = self
        textFieldPassword.delegate = self
        setupLayout()
    }
    
    #warning("method to close the keyboard on the textfield :) wtf")
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldUsername.resignFirstResponder()
        textFieldPassword.resignFirstResponder()
        return true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupAdditionalLayout()
    }
    
    private func setupAdditionalLayout() {
        #warning("use this function inside viewDidAppear to add layer that will be determined after the view has built")
        textFieldUsername.layer.addSublayer(tfUsernameBorder)
        textFieldPassword.layer.addSublayer(tfPasswordBorder)
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
            topContainer.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.6),
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
        // Adding the bottom container / UI Stackview for the rest of the element
        #warning("We cant set the background color for the uiStackView because its a non drawing view :)")
        let bottomContainer = UIStackView()
        bottomContainer.axis = .vertical
        bottomContainer.translatesAutoresizingMaskIntoConstraints = false
        bottomContainer.autoresizesSubviews = false
        bottomContainer.spacing = 28
        view.addSubview(bottomContainer)
        // Setup-ing the bottom container
        NSLayoutConstraint.activate([
            // Sizing the bottom Container
            bottomContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            // Positioning the bottom container
            bottomContainer.topAnchor.constraint(equalTo: topContainer.bottomAnchor)
        ])
        // Creating a horizontal UIStackview for edit text and icon
        let horView1 = UIStackView()
        horView1.translatesAutoresizingMaskIntoConstraints = false
        horView1.axis = .horizontal
        horView1.autoresizesSubviews = false
        horView1.alignment = .center
        horView1.spacing = 20
        // Adding the horView into bottom container
        bottomContainer.addArrangedSubview(horView1)
        // Setup-ing the horView
        #warning("uistackview will distribute element to fill if we make the width or height match parent")
        NSLayoutConstraint.activate([
            // Sizing the horView see warning above
            horView1.leadingAnchor.constraint(equalTo: bottomContainer.leadingAnchor, constant: 20),
            //            horView1.trailingAnchor.constraint(equalTo: bottomContainer.trailingAnchor),
            // Positioning the horview
            horView1.topAnchor.constraint(equalTo: bottomContainer.topAnchor, constant: 50)
        ])
        // Adding the userimage and textview in the horizontal stackview
        horView1.addArrangedSubview(userImage)
        horView1.addArrangedSubview(textFieldUsername)
        // Setting the userimage and textview
        NSLayoutConstraint.activate([
            // Sizing the textview
            textFieldUsername.trailingAnchor.constraint(equalTo: bottomContainer.trailingAnchor, constant: -30),
            // Sizing the userimage
            userImage.heightAnchor.constraint(equalToConstant: 25),
            userImage.widthAnchor.constraint(equalToConstant: 25)
        ])
        // Creating a  horizontal UIStackView for edit text and icon password
        let horView2 = UIStackView()
        horView2.translatesAutoresizingMaskIntoConstraints = false
        horView2.axis = .horizontal
        horView2.autoresizesSubviews = false
        horView2.spacing = 20
        // adding the horView 2 into the bottom container
        bottomContainer.addArrangedSubview(horView2)
        // Setup-ing the horView2
        NSLayoutConstraint.activate([
            // Setting the margin to match the horView1
            horView2.leadingAnchor.constraint(equalTo: bottomContainer.leadingAnchor, constant: 20)
        ])
        horView2.addArrangedSubview(lockImage)
        horView2.addArrangedSubview(textFieldPassword)
        // Setting the lockImage and the edit text
        NSLayoutConstraint.activate([
            // Sizing the lockimage
            lockImage.heightAnchor.constraint(equalToConstant: 25),
            lockImage.widthAnchor.constraint(equalToConstant: 25),
            // Sizing the passwordtextfield
            textFieldPassword.trailingAnchor.constraint(equalTo: bottomContainer.trailingAnchor, constant: -30)
        ])
        // Adding the sign in button
        bottomContainer.addArrangedSubview(buttonSignIn)
        // Setup-ing the sign in button
        NSLayoutConstraint.activate([
            // Sizing the button
            buttonSignIn.leadingAnchor.constraint(equalTo: bottomContainer.leadingAnchor, constant: 20),
            buttonSignIn.trailingAnchor.constraint(equalTo: bottomContainer.trailingAnchor, constant: -30),
            buttonSignIn.heightAnchor.constraint(equalToConstant: 50)
        ])
        // Adjusting custom spacing after the button for the textview
        bottomContainer.setCustomSpacing(20, after: buttonSignIn)
        // Adding the textview to the bottom container
        bottomContainer.addArrangedSubview(signUPTextView)
        // Setup-ing the textview
        NSLayoutConstraint.activate([
            signUPTextView.leadingAnchor.constraint(equalTo: bottomContainer.leadingAnchor, constant: 20),
            signUPTextView.trailingAnchor.constraint(equalTo: bottomContainer.trailingAnchor, constant: -30)
        ])
    }
    
    private func loginCheck() -> Bool {
        for user in users {
            if user.userName == textFieldUsername.text && user.password == textFieldPassword.text {
                return true
            }
        }
        return false
    }
    
    @objc func goToSignUP() {
        print("called gogo")
        self.presentingViewController?.navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
    
    launchoption
    
    @objc func loginClicked() {
        print("clicked")
        var valid = loginCheck()
        if valid {
            showToast(message: "Login Success", font: .systemFont(ofSize: 15))
        }else {
            showToast(message: "Login Failed", font: .systemFont(ofSize: 15))
        }
    }
    
}

