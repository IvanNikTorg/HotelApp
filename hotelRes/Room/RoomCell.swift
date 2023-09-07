//
//  RoomCell.swift
//  hotelRes
//
//  Created by user on 06.09.2023.
//

import UIKit

final class RoomCell: UITableViewCell {

    struct Model {
        let rooms: [HotelRoom]?
    }

    struct HotelRoom {
        let id: Int?
        let name: String?
        let price: Int?
        let price_per: String?
        let peculiarities: [String]?
        let image_urls: [String]?
    }

    private let nameLabel = UILabel()
    private let roomImage = UIImageView()
    private let peculiarView = UIStackView()
    private let priceLabel = UILabel()
    private let priceForItLabel = UILabel()

    private let viewForBackCell = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: .default, reuseIdentifier: "RoomCell")
         configCell()

     }

    public func fillCell(model: RoomCell.HotelRoom?) {
        nameLabel.text = model?.name ?? "None"
        priceLabel.text = String(model?.price ?? 0)
        priceForItLabel.text = model?.price_per ?? "None"
        guard let pec = model?.peculiarities else { return }
        for str in pec {
            let view = PeculiaritiesView()
            view.fill(title: str)
            peculiarView.addArrangedSubview(view)
        }
        guard let imageString = model?.image_urls?[0], let url = URL(string: imageString) else { return }
        roomImage.load(url: url)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configCell() {
        contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        contentView.addSubview(viewForBackCell)
        contentView.addSubview(nameLabel)
        contentView.addSubview(roomImage)
        


        viewForBackCell.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            viewForBackCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            viewForBackCell.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            viewForBackCell.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            viewForBackCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])

        viewForBackCell.layer.cornerRadius = 12
        viewForBackCell.backgroundColor = .white

        roomImage.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            roomImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            roomImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            roomImage.heightAnchor.constraint(equalToConstant: 257),
            roomImage.widthAnchor.constraint(equalToConstant: 343),
            roomImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            roomImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16)
        ])

        roomImage.layer.cornerRadius = 15
        roomImage.clipsToBounds = true
        roomImage.backgroundColor = .white

        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: roomImage.bottomAnchor, constant: 8),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -20)
        ])

        nameLabel.textColor = .black
        nameLabel.font = .systemFont(ofSize: 22, weight: .medium)
        nameLabel.numberOfLines = 0



    }


}

