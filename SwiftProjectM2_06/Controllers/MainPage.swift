//
//  ViewController.swift
//  SwiftProjectM2_06
//
//  Created by Irinka Datoshvili on 13.04.24.
//

import UIKit

class MainPage: UIViewController {
    let backgroundImageView = BackgroundImageView(named: "Background1")
    let addButton = CustomButton(title: "ახალი წუწუნ ბარათის დამატება")
    var cards: [Card] = []
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 164, height: 192)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 16
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        self.navigationItem.hidesBackButton = true
        super.viewDidLoad()
        customizeAppearance()
        setUp()
        setupCollectionView()
    }
    
    func loadDefaultCards() {
        let defaultCards = [
            Card(title: "დავითი ძაან კეთილია", description: "ქულა ბუღალტერიაში დამაკლო))", image: UIImage(named: "Icon1")!),
            Card(title: "თუ მჯეროდეს", description: " რომ ამდენი დრო მოგვეცი დავალებისთვის", image: UIImage(named: "Icon2")!),
            Card(title: "ბექა ვერ გპატიობ", description: "ნავიგაციის თაითლი 16-ით რატო შეწიე წინაზე", image: UIImage(named: "Icon3")!),
            Card(title: "ვერ გადავეჩვიე", description: "ვასოს მაინც თქვენობით მივმართავ", image: UIImage(named: "Icon4")!)
        ]
        cards = defaultCards
    }
    
    func setUp() {
        NSLayoutConstraint.activate([
            
            addButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 664),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.heightAnchor.constraint(equalToConstant: 48),
            addButton.widthAnchor.constraint(equalToConstant: 290),
        ])
    }
    
    func customizeAppearance() {
        view.addSubview(backgroundImageView)
        view.addSubview(addButton)
        configureButton()
        loadDefaultCards()
    }
    
    func setupCollectionView() {
        collectionView.register(CardCell.self, forCellWithReuseIdentifier: "CardCell")
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 35),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
            collectionView.heightAnchor.constraint(equalToConstant: 448)
        ])
    }
    func configureButton() {
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
    @objc func addButtonTapped() {
        let addCardVC = AddCardVC()
        addCardVC.onCardAdded = { [weak self] newCard in
            self?.cards.append(newCard)
            self?.collectionView.reloadData()
        }
        navigationController?.pushViewController(addCardVC, animated: true)
    }
}

extension MainPage: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as? CardCell else {
            fatalError("Unexpected Index Path")
        }
        let card = cards[indexPath.item]
        cell.configure(with: card)
        return cell
    }
}
//#Preview {
//    MainPage()
//}
