
import UIKit

class CardCell: UICollectionViewCell {
    private var imageView: UIImageView!
    private var titleLabel: UILabel!
    private var descriptionLabel: UILabel!
    private var detailsStackView: UIStackView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false

        titleLabel = UILabel()
        titleLabel.textAlignment = .left
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "FiraGO-SemiBold", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .bold)
        titleLabel.numberOfLines = 0

        descriptionLabel = UILabel()
        descriptionLabel.textAlignment = .left
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = UIColor(red: 94.0/255.0, green: 98.0/255.0, blue: 114.0/255.0, alpha: 1.0)
        descriptionLabel.font = UIFont(name: "FiraGO-Medium", size: 10) ?? UIFont.systemFont(ofSize: 10, weight: .medium)

        detailsStackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        detailsStackView.axis = .vertical
        detailsStackView.spacing = 8
        detailsStackView.alignment = .fill
        detailsStackView.distribution = .fillProportionally
        detailsStackView.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(imageView)
        contentView.addSubview(detailsStackView)
        contentView.backgroundColor = UIColor(red: 38/255.0, green: 42/255.0, blue: 52/255.0, alpha: 0.5)
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true

        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            imageView.widthAnchor.constraint(equalToConstant: 40),
            imageView.heightAnchor.constraint(equalToConstant: 40)
        ])

        NSLayoutConstraint.activate([
            detailsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            detailsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            detailsStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            detailsStackView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    func configure(with card: Card) {
        titleLabel.text = card.title
        descriptionLabel.text = card.description
        imageView.image = card.image
    }
}
