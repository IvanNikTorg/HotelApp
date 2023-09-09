//
//  DataHotelCell.swift
//  hotelRes
//
//  Created by user on 05.09.2023.
//

import UIKit

final class DataHotelCell: UITableViewCell {

    struct Model {
        var nameHotel: String?
        var avatarImage: [String]?
        var rating: String?
        var adress: String?
        var minPrice: String?
        var priceForIt: String?
    }

    private let avatarImage = UIImageView()

    private let nameLabel = UILabel()
    private let ratingLabel = UILabel()
    private let adressLabel = UILabel()
    private let starIcon = UIImageView(image: UIImage(named: "Star"))
    private let viewForRating = UIView()

    private let minPriceLabel = UILabel()
    private let priceForItLabel = UILabel()
    private let viewForBackCell = UIView()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "DataHotelCell")
        configCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func fillCell(model: DataHotelCell.Model?) {
        nameLabel.text = model?.nameHotel ?? "None"
        ratingLabel.text = model?.rating ?? "None"
        adressLabel.text = model?.adress ?? "None"
        minPriceLabel.text = model?.minPrice ?? "None"
        priceForItLabel.text = model?.priceForIt ?? "None"
        guard let imageString = model?.avatarImage?[0], let url = URL(string: imageString) else { return }
        avatarImage.load(url: url)
    }

    private func configCell() {
        contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        contentView.addSubview(viewForBackCell)
        contentView.addSubview(avatarImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(adressLabel)
        contentView.addSubview(minPriceLabel)
        contentView.addSubview(priceForItLabel)
        contentView.addSubview(viewForRating)
        contentView.addSubview(starIcon)
        contentView.addSubview(ratingLabel)

        viewForBackCell.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            viewForBackCell.topAnchor.constraint(equalTo: contentView.topAnchor),
            viewForBackCell.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            viewForBackCell.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            viewForBackCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4)
        ])

        viewForBackCell.layer.cornerRadius = 12
        viewForBackCell.backgroundColor = .white

        avatarImage.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            avatarImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            avatarImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            avatarImage.heightAnchor.constraint(equalToConstant: 257),
            avatarImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            avatarImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16)
        ])

        avatarImage.layer.cornerRadius = 15
        avatarImage.clipsToBounds = true
        avatarImage.backgroundColor = .white

        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 13),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16)
        ])

        nameLabel.textColor = .black
        nameLabel.font = .systemFont(ofSize: 22, weight: .medium)
        nameLabel.numberOfLines = 0

        viewForRating.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            viewForRating.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 16),
            viewForRating.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
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
            ratingLabel.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 21),
            ratingLabel.leftAnchor.constraint(equalTo: starIcon.rightAnchor, constant: 2)
        ])

        ratingLabel.textColor = UIColor(red: 1, green: 0.66, blue: 0, alpha: 1)
        ratingLabel.font = .systemFont(ofSize: 16, weight: .medium)

        adressLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            adressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            adressLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            adressLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16)
        ])

        adressLabel.textColor = UIColor(red: 0.05, green: 0.45, blue: 1, alpha: 1)
        adressLabel.font = .systemFont(ofSize: 14, weight: .medium)

        minPriceLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            minPriceLabel.topAnchor.constraint(equalTo: adressLabel.bottomAnchor, constant: 16),
            minPriceLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            minPriceLabel.bottomAnchor.constraint(equalTo: viewForBackCell.bottomAnchor, constant: -16)
        ])

        minPriceLabel.textColor = .black
        minPriceLabel.font = .systemFont(ofSize: 30, weight: .semibold)

        priceForItLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            priceForItLabel.topAnchor.constraint(equalTo: adressLabel.bottomAnchor, constant: 30),
            priceForItLabel.leftAnchor.constraint(equalTo: minPriceLabel.rightAnchor, constant: 8)

        ])

        priceForItLabel.textColor = UIColor(red: 0.51, green: 0.53, blue: 0.59, alpha: 1)
        priceForItLabel.font = .systemFont(ofSize: 16, weight: .regular)

    }
}
