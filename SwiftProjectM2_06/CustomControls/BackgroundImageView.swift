//
//  BackgroundImageView.swift
//  SwiftProjectM2_06
//
//  Created by Irinka Datoshvili on 13.04.24.
//
import Foundation
import UIKit

class BackgroundImageView: UIImageView {
    
    init(named imageName: String) {
        super.init(frame: .zero)
        self.image = UIImage(named: imageName)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentMode = .scaleAspectFill
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
