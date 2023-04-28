//
//  AppDelegate.swift
//  Bankey
//
//  Created by Nyulas Jozsef on 13.04.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?
    
    let loginViewController = LoginViewController()
    let onBoardingContainerViewController = OnboardingContainerViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        loginViewController.delegate = self
        onBoardingContainerViewController.delegate = self
        
        window?.rootViewController = onBoardingContainerViewController
        
       
        
    
      // window?.rootViewController = OnboardingViewController(imageName: "delorean", titleText: "Bankey is faster, easier to use, and has a brand new look and feel that will make you feel like you are back in 1989.")

        return true
    }


}

extension AppDelegate: LoginViewControllerDelegate
{
    func didLogin()
    {
        print("foo - Did login")
    }
    
    
}

extension AppDelegate: OnboardingContainerViewControllerDelegate
{
    func didFinishedOnboarding()
    {
        print("foo - Did onboard")
    }
}
