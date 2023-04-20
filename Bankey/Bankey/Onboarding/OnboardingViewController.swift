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
    
    let imageName: String
    let titleText: String
    
    init(imageName: String, titleText: String)
    {
        
        self.imageName = imageName
        self.titleText = titleText
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        view.backgroundColor = .systemBackground
        
        stacView.translatesAutoresizingMaskIntoConstraints = false
        stacView.axis = .vertical
        stacView.spacing = 20
        
        //Image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: imageName)
        
        //Label
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.text = titleText
        
        
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
