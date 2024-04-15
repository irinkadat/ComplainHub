//
//  SplashScreen.swift
//  SwiftProjectM2_06
//
//  Created by Irinka Datoshvili on 13.04.24.
//

import UIKit

class SplashScreen: UIViewController {
    
    let backgroundImageView = BackgroundImageView(named: "Background1")
    
    let welcomeTitle: CustomLabel = {
        let label = CustomLabel(text: "წუწუნი Hub", fontName: "FiraGO-Regular", fontSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backgroundImageView)
        uiSetup()
    }
    
    func uiSetup() {
        view.addSubview(welcomeTitle)
        
        NSLayoutConstraint.activate([
            welcomeTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}

#Preview (){
    SplashScreen()
}
