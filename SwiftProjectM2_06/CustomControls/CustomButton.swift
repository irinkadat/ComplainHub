//
//  CustomButton.swift
//  SwiftProjectM2_06
//
//  Created by Irinka Datoshvili on 13.04.24.
//

import Foundation
import UIKit

class CustomButton: UIButton {
    init(title: String) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.backgroundColor = UIColor(red: 0/255.0, green: 117/255.0, blue: 255/255.0, alpha: 1.0)
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = UIFont(name: "FiraGO-Medium", size: 14)
        self.layer.cornerRadius = 24
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
