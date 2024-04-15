//
//  UITextField.swift
//  SwiftProjectM2_06
//
//  Created by Irinka Datoshvili on 14.04.24.
//

import UIKit

extension UITextField {
    func setPlaceholder(text: String, color: UIColor) {
        self.attributedPlaceholder = NSAttributedString(string: text, attributes: [.foregroundColor: color])
        self.layer.cornerRadius = 9
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor(red: 141/255.0, green: 141/255.0, blue: 141/255.0, alpha: 1).cgColor
        self.layer.borderWidth = 1.0
    }
}

