//
//  DummyViewController.swift
//  Bankey
//
//  Created by Nyulas Jozsef on 03.05.2023.
//
    import UIKit
    
    class DummyViewController: UIViewController
    {
        let stacView = UIStackView()
        let label = UILabel()
        let logoutButton = UIButton(type: .system)
        
        weak var logoutDelegate: LogoutDelegate?
        
        override func viewDidLoad()
        {
            super.viewDidLoad()
            style()
            layout()
            
        }
    }

    extension DummyViewController
    {
        func style()
        {
            stacView.translatesAutoresizingMaskIntoConstraints = false
            stacView.axis = .vertical
            stacView.spacing = 20
            
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Welcome"
            label.font = UIFont.preferredFont(forTextStyle: .title1)
            
            logoutButton.translatesAutoresizingMaskIntoConstraints = false
            logoutButton.configuration = .filled()
            logoutButton.setTitle("Logout", for: [])
            logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .primaryActionTriggered)
        }
        
        
        func layout()
        {
        
            stacView.addArrangedSubview(label)
            stacView.addArrangedSubview(logoutButton)
            
            view.addSubview(stacView)
            
            // stackView
            NSLayoutConstraint.activate([
                stacView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                stacView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            ])
        }
        
        @objc func logoutButtonTapped(sender: UIButton)
        {
            logoutDelegate?.didLogout()
        }
        
        
    }
