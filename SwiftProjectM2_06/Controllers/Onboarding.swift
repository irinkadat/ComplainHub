//
//  Onboarding.swift
//  SwiftProjectM2_06
//
//  Created by Irinka Datoshvili on 13.04.24.
//

import UIKit

class Onboarding: UIViewController {
    
    let startButton = CustomButton(title: "დაწყება")
    let mainTitle = CustomLabel(text:"შედი აპლიკაციაში და იწუწუნე რამდენიც გინდა", fontName: "FiraGO-Regular", fontSize: 30)
    let backgroundImageView = BackgroundImageView(named: "Background")
    override func viewDidLoad() {
        
        super.viewDidLoad()
        customizeAppearance()
        setUp()
    }
    func setUp() {
        
        NSLayoutConstraint.activate([
            backgroundImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainTitle.heightAnchor.constraint(equalToConstant: 192),
            mainTitle.widthAnchor.constraint(equalToConstant: 263),
            mainTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 382),
            mainTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            startButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 664),
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 222),
            startButton.heightAnchor.constraint(equalToConstant: 48),
            startButton.widthAnchor.constraint(equalToConstant: 130),
        ])
    }
    
    func customizeAppearance() {
        view.addSubview(backgroundImageView)
        view.addSubview(mainTitle)
        view.addSubview(startButton)
        start()
        
        mainTitle.numberOfLines = 4
        mainTitle.textAlignment = .left
    }
    
    func start() {
        startButton.addTarget(self, action: #selector(startApp), for: .touchUpInside)
    }
    
    @objc func startApp() {
        let mainVC = MainPage()
        navigationController?.pushViewController(mainVC, animated: true)
        
        navigationController?.setViewControllers([mainVC], animated: false)
    }
}

//#Preview {
//    Onboarding()
//}
