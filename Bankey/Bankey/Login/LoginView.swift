//
//  LoginView.swift
//  Bankey
//
//  Created by Nyulas Jozsef on 13.04.2023.
//

import Foundation
import UIKit

class LoginView: UIView
{
    let stackView = UIStackView()
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let divider = UIView()
    let divider2 = UIView()
    
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("init(coder: ) has not been implemented")
    }
    
    
    /*
     
     because in stackView our elements already have their own instrinsicContentSize we don't need to specify a default value
    
    override var intrinsicContentSize: CGSize
    {
        return CGSize(width: 200, height: 200)
   }
     */
}

extension LoginView
{
    func style()
    {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemFill
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.attributedPlaceholder = NSAttributedString(
            string: "Username",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
       // usernameTextField.placeholder = "Username"
        usernameTextField.delegate = self
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        //passwordTextField.placeholder = "Password"
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self
        
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = .black
        
        divider2.translatesAutoresizingMaskIntoConstraints = false
        divider2.backgroundColor = .black
        
        layer.cornerRadius = 5
        clipsToBounds = true
        
    }
    
    func layout()
    {
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(divider)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(divider2)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 3),
            // multiplier 1 = 8 points
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 8),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
        
        // the above constraint array automaitcaly sets .isActive = true but here we have to manualy
        
        divider.heightAnchor.constraint(equalToConstant: 1).isActive = true
        divider2.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
    }
}

// MARK: - UITextFieldDelegate

extension LoginView: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        usernameTextField.endEditing(true)
        passwordTextField.endEditing(true  )
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool
    {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        
    }
}

