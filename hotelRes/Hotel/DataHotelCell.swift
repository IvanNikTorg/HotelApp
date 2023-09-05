//
//  DataHotelCell.swift
//  hotelRes
//
//  Created by user on 05.09.2023.
//

import UIKit

final class DataHotelCell: UITableViewCell {

    let data: HotelData = HotelData(id: 1, name: "Hurgada", adress: "No adress", minimal_price: 0, price_for_it: "for all", rating: 1, rating_name: "Bad", image_urls: ["https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Priv%C3%A9_by_Belek_Club_House.jpg",
         "https://deluxe.voyage/useruploads/articles/The_Makadi_Spa_Hotel_02.jpg",
         "https://deluxe.voyage/useruploads/articles/article_1eb0a64d00.jpg"],
         about_the_hotel: AboutHotel(description: "none", peculiarities: ["none", "none"]))

    struct Model {
        var nameHotel: String?
        var avatarImage: [String]?
        var rating: String?
        var adress: String?
        var minPrice: String?
        var priceForIt: String?
    }

    private let nameLable = UILabel()
    private let avatarImage = UIImageView()
    private let ratingLabel = UILabel()
    private let adressLabel = UILabel()
    private let minPriceLabel = UILabel()
    private let priceForItLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "DataHotelCell")
 //       configCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//    public func fillCell(model: DataHotelCell.Model?) {
//        nameLable.text = model?.nameCharacter ?? "None"
//        ripLabel.text = model?.rip ?? "None"
//        guard let imageString = model?.avatarImage, let url = URL(string: imageString) else { return }
//        avatarImage.load(url: url)
//    }
//
//    private func configCell() {
//        contentView.addSubview(avatarImage)
//        contentView.addSubview(nameLable)
//        contentView.addSubview(ripLabel)
//        self.backgroundColor = .clear
//
//        avatarImage.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            avatarImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
//            avatarImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            avatarImage.widthAnchor.constraint(equalToConstant: 148),
//            avatarImage.heightAnchor.constraint(equalToConstant: 148)
//        ])
//
//        avatarImage.layer.cornerRadius = 16
//        avatarImage.clipsToBounds = true
//        avatarImage.backgroundColor = UIColor(red: 0.1, green: 0.11, blue: 0.16, alpha: 1)
//
//        nameLable.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            nameLable.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 24),
//            nameLable.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
//        ])
//
//        nameLable.textColor = .white
//        nameLable.font = .systemFont(ofSize: 22, weight: .bold)
//
//        ripLabel.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            ripLabel.topAnchor.constraint(equalTo: nameLable.bottomAnchor, constant: 8),
//            ripLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
//            ripLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
//        ])
//
//        ripLabel.textColor = UIColor(red: 0.28, green: 0.77, blue: 0.04, alpha: 1)
//        ripLabel.font = .systemFont(ofSize: 16, weight: .medium)
//    }
}
