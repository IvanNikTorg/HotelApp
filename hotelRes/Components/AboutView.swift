//
//  AboutView.swift
//  hotelRes
//
//  Created by user on 08.09.2023.
//

import UIKit

final class AboutView: UIView {

    private let nameLabel = UILabel()
    private let ratingLabel = UILabel()
    private let adressLabel = UILabel()
    private let starIcon = UIImageView()
    private let viewForRating = UIView()
    

    func fill(name: String, rating: String, adress: String, image: String = "Star") {
        nameLabel.text = name
        ratingLabel.text = rating
        adressLabel.text = adress
        starIcon.image = UIImage(named: image)

    }

    init(){
        super.init(frame: .zero)
        config()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func config() {

        self.addSubview(nameLabel)
        self.addSubview(adressLabel)
        self.addSubview(viewForRating)
        self.addSubview(starIcon)
        self.addSubview(ratingLabel)

        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 13),
            nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            nameLabel.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])

        nameLabel.textColor = .black
        nameLabel.font = .systemFont(ofSize: 22, weight: .medium)
        nameLabel.numberOfLines = 0

        viewForRating.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            viewForRating.topAnchor.constraint(equalTo: self.topAnchor),
            viewForRating.leftAnchor.constraint(equalTo: self.leftAnchor),
            viewForRating.rightAnchor.constraint(equalTo: ratingLabel.rightAnchor, constant: 10),
            viewForRating.bottomAnchor.constraint(equalTo: ratingLabel.bottomAnchor,constant: 5)

        ])
        viewForRating.layer.cornerRadius = 5
        viewForRating.backgroundColor = UIColor(red: 1, green: 0.78, blue: 0, alpha: 0.2)

        starIcon.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            starIcon.centerYAnchor.constraint(equalTo: ratingLabel.centerYAnchor),
            starIcon.leftAnchor.constraint(equalTo: viewForRating.leftAnchor, constant: 10),
            starIcon.widthAnchor.constraint(equalToConstant: 15),
            starIcon.heightAnchor.constraint(equalToConstant: 15)
        ])

        ratingLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            ratingLabel.topAnchor.constraint(equalTo: viewForRating.topAnchor, constant: 5),
            ratingLabel.leftAnchor.constraint(equalTo: starIcon.rightAnchor, constant: 2)
        ])

        ratingLabel.textColor = UIColor(red: 1, green: 0.66, blue: 0, alpha: 1)
        ratingLabel.font = .systemFont(ofSize: 16, weight: .medium)

        adressLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            adressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            adressLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            adressLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            adressLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])

        adressLabel.textColor = UIColor(red: 0.05, green: 0.45, blue: 1, alpha: 1)
        adressLabel.font = .systemFont(ofSize: 14, weight: .medium)

    }
}

