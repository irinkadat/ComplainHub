//
//  UIViewController.swift
//  SwiftProjectM2_06
//
//  Created by Irinka Datoshvili on 13.04.24.
//

import UIKit

class AddCardVC: UIViewController {
    
    let titleLabel = CustomLabel(text: "სათაური",fontName: "FiraGO-Medium", fontSize: 14)
    let titleTextField = UITextField()
    let iconsTitle = CustomLabel(text: "აირჩიეთ აიქონი", fontName: "FiraGO-Medium", fontSize: 14)
    let descriptionLabel = CustomLabel(text: "აღწერა", fontName: "FiraGO-Medium", fontSize: 14)
    let descriptionTextField = UITextField()
    let iconsStackView = UIStackView()
    var selectedIcon: UIImage?
    var selectedImageView: UIImageView?
    
    var onCardAdded: ((Card) -> Void)?
    
    let backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Background1"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let addButton2 = CustomButton(title: "დამატება")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(backgroundImageView)
        
        titleLabel.textColor = .white
        titleLabel.textAlignment = .left
        titleTextField.setPlaceholder(text: "მაგ: პანიკა, დახმარება მჭირდება", color: UIColor(red: 99/255.0, green: 99/255.0, blue: 99/255.0, alpha: 1))
        titleTextField.font = UIFont(name: "FiraGO-Medium", size: 12)
        titleTextField.borderStyle = .roundedRect
        titleTextField.backgroundColor = UIColor(red: 31/255.0, green: 34/255.0, blue: 45/255.0, alpha: 1)
        titleTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        descriptionLabel.textColor = .white
        descriptionLabel.textAlignment = .left
        descriptionTextField.setPlaceholder(text: "მაგ: ფიგმამ გამიჭედა და ვინმემ გამომიგზავნეთ", color: UIColor(red: 99/255.0, green: 99/255.0, blue: 99/255.0, alpha: 1))
        descriptionTextField.font = UIFont(name: "FiraGO-Medium", size: 12)
        descriptionTextField.borderStyle = .roundedRect
        descriptionTextField.backgroundColor = UIColor(red: 31/255.0, green: 34/255.0, blue: 45/255.0, alpha: 1)
        descriptionTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        iconsTitle.textColor = .white
        
        let titleLabelStackView = UIStackView(arrangedSubviews: [titleLabel, titleTextField])
        titleLabelStackView.axis = .vertical
        titleLabelStackView.spacing = 8
        let descriptionLabelStackView = UIStackView(arrangedSubviews: [descriptionLabel, descriptionTextField])
        descriptionLabelStackView.axis = .vertical
        descriptionLabelStackView.spacing = 8
        
        iconsStackView.axis = .horizontal
        iconsStackView.distribution = .fillEqually
        iconsStackView.spacing = 10
        
        view.addSubview(titleLabelStackView)
        view.addSubview(descriptionLabelStackView)
        view.addSubview(iconsTitle)
        view.addSubview(iconsStackView)
        view.addSubview(addButton2)
        setUpIcons()
        setUpButton()
        
        titleLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabelStackView.translatesAutoresizingMaskIntoConstraints = false
        iconsTitle.translatesAutoresizingMaskIntoConstraints = false
        iconsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabelStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 47),
            titleLabelStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabelStackView.widthAnchor.constraint(equalToConstant: 310),
            
            descriptionLabelStackView.topAnchor.constraint(equalTo: titleLabelStackView.bottomAnchor, constant: 20),
            descriptionLabelStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabelStackView.widthAnchor.constraint(equalToConstant: 310),
            
            iconsTitle.topAnchor.constraint(equalTo: descriptionLabelStackView.bottomAnchor, constant: 29),
            iconsTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 43),
            
            iconsStackView.topAnchor.constraint(equalTo: iconsTitle.bottomAnchor, constant: 20),
            iconsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconsStackView.widthAnchor.constraint(equalToConstant: 310),
            iconsStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setUpIcons() {
        let iconNames = ["Icon1", "Icon2", "Icon3", "Icon4"]
        for iconName in iconNames {
            let imageView = UIImageView(image: UIImage(named: iconName))
            imageView.contentMode = .scaleAspectFit
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(iconSelected(_:))))
            iconsStackView.addArrangedSubview(imageView)
        }
    }
    func setUpButton() {
        addButton2.backgroundColor =  UIColor(red: 0/255.0, green: 155/255.0, blue: 16/255.0, alpha: 1.0)
        addButton2.addTarget(self, action: #selector(addCardButtonTapped), for: .touchUpInside)
        NSLayoutConstraint.activate([
            addButton2.topAnchor.constraint(equalTo: view.topAnchor, constant: 664),
            addButton2.widthAnchor.constraint(equalToConstant: 132),
            addButton2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton2.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    @objc func iconSelected(_ sender: UITapGestureRecognizer) {
        if let imageView = sender.view as? UIImageView {
            if let previousSelectedImageView = selectedImageView {
                previousSelectedImageView.layer.borderWidth = 0
                previousSelectedImageView.layer.borderColor = nil
            }
            selectedImageView = imageView
            selectedIcon = imageView.image
            selectedImageView?.frame.size = CGSize(width: 40, height: 40)
            selectedImageView?.layer.cornerRadius = 20
            selectedImageView?.clipsToBounds = true
            selectedImageView?.layer.borderWidth = 1
            selectedImageView?.layer.borderColor = UIColor.yellow.cgColor
            
            UIView.animate(withDuration: 0.3) {
                self.selectedImageView?.layer.borderWidth = 2
            }
        }
    }
    @objc func addCardButtonTapped() {
        guard let title = titleTextField.text, !title.isEmpty,
              let description = descriptionTextField.text, !description.isEmpty,
              let image = selectedIcon else { return }
        let newCard = Card(title: title, description: description, image: image)
        
        onCardAdded?(newCard)
        navigationController?.popViewController(animated: true)
    }
}

#Preview{
    AddCardVC()
}
