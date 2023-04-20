//
//  OnboardingViewController.swift
//  Bankey
//
//  Created by Nyulas Jozsef on 20.04.2023.
//

import UIKit

class OnboardingViewController: UIViewController
{
    let stacView = UIStackView()
    let imageView = UIImageView()
    let label = UILabel()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        style()
        layout()
        
    }
}
extension OnboardingViewController
{
    func style()
    {
        stacView.translatesAutoresizingMaskIntoConstraints = false
        stacView.axis = .vertical
        stacView.spacing = 20
        
        //Image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "delorean")
        
        //Label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.text = "Bankey is faster, easier to use, and has a brand new look and feel that will make you feel like you are back in 1989."
        
        
    }
    
    
    func layout()
    {
        view.addSubview(stacView)
        
        stacView.addArrangedSubview(imageView)
        stacView.addArrangedSubview(label)
       
        
        NSLayoutConstraint.activate([
            stacView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stacView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stacView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stacView.trailingAnchor, multiplier: 1),
            
        ])
    }
    
    
}
