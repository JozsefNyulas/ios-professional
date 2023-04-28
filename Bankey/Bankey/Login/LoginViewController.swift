//
//  ViewController.swift
//  Bankey
//
//  Created by Nyulas Jozsef on 13.04.2023.
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject
{
    func didLogin()
}

class LoginViewController: UIViewController
{

    let titleLabel = UILabel()
    let subTitleLabel = UILabel()
    
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    weak var delegate: LoginViewControllerDelegate?
   
    
    var username: String?
    {
        return loginView.usernameTextField.text
    }
    
    var password: String?
    {
        return loginView.passwordTextField.text
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        style()
        layout()
        
    }
}

extension LoginViewController
{
    private func style()
    {
        view.backgroundColor = .systemBackground
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Bankey"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: "AmericanTypewriter-CondensedBold", size: 36)
        titleLabel.adjustsFontForContentSizeCategory = true
        
        
        
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.numberOfLines = 0
        subTitleLabel.textAlignment = .center
        subTitleLabel.textColor = .black
        subTitleLabel.text = "Your premium source for all things banking!"
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.background.backgroundColor = .gray
        signInButton.configuration?.imagePadding = 8 // to put padding(space) between the loading indicator image and button
        signInButton.setTitle("Sign in", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true

    }
    
    private func layout()
    {
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        //subTitleLabel
        NSLayoutConstraint.activate([
            
            subTitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 2),
            titleLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
            
        ])
        
        // mottoLabel
        NSLayoutConstraint.activate([
            
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: subTitleLabel.bottomAnchor, multiplier: 3),
            subTitleLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        // LoginView
        NSLayoutConstraint.activate([
        
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor , multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
        ])
        
        // Button
        NSLayoutConstraint.activate([
            
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalToSystemSpacingAfter: loginView.leadingAnchor, multiplier: 15),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: signInButton.trailingAnchor, multiplier: 15)
        ])
        
        // ErrorLabel
        NSLayoutConstraint.activate([
        
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
            
        ])
    }
}
// MARK: Actions
extension LoginViewController
{
    @objc func signInTapped(sender: UIButton)
    {
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login()
    {
        guard let username = username, let password = password
        else
        {
            assertionFailure("Username / password should never be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty
        {
            configureView(passedString: "Username / password cannot be blank")
            return
        }
        
        if username == "1"  && password == "1"
        {
            signInButton.configuration?.showsActivityIndicator = true
            delegate?.didLogin()
        }
        else
        {
            configureView(passedString: "Incorrect username / password")
        }
    }
    
    
    private func configureView(passedString message: String)
    {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}

