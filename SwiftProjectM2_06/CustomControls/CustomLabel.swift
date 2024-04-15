//
//  CustomLabel.swift
//  SwiftProjectM2_06
//
//  Created by Irinka Datoshvili on 13.04.24.
//

import Foundation
import UIKit

class CustomLabel: UILabel {
    init(text: String, fontName: String, fontSize: CGFloat) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = text
        self.font = UIFont(name: fontName, size: fontSize)
        self.textColor = .white
        self.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


