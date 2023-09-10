//
//  RoomCell.swift
//  hotelRes
//
//  Created by user on 06.09.2023.
//

import UIKit

protocol ButtonRoomDelegate: AnyObject {
    func didTouchRoomButton()
}

final class RoomCell: UITableViewCell {

    struct Model {
        let rooms: [HotelRoom]?
    }

    weak var delegate: ButtonRoomDelegate?

    struct HotelRoom {
        let id: Int?
        let name: String?
        let price: String?
        let price_per: String?
        let peculiarities: [String]?
        let image_urls: [String]?
    }

    private let nameLabel = UILabel()
    private let roomImage = UIImageView()
    private let peculiarView = UIStackView()
    private let priceLabel = UILabel()
    private let priceForItLabel = UILabel()
    private let backDetailView = UIView()
    private let textDetailLabel = UILabel()
    private let imageDetail = UIImageView()
    private let forBackCellView = UIView()

    private let buyButtonApp = ButtonView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: .default, reuseIdentifier: "RoomCell")
         configCell()

     }

    public func fillCell(model: RoomCell.HotelRoom?) {
        nameLabel.text = model?.name ?? "None"
        priceLabel.text = model?.price
        priceForItLabel.text = model?.price_per ?? "None"
        guard let pec = model?.peculiarities else { return }
        for str in pec {
            let view = PeculiaritiesView()
            view.fill(title: str)
            peculiarView.addArrangedSubview(view)
        }
        imageDetail.image = UIImage(named: "arrow_blue")
        textDetailLabel.text = "Подробнее о номере"
        guard let imageString = model?.image_urls?[0], let url = URL(string: imageString) else { return }
        roomImage.load(url: url)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configCell() {
        contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        contentView.addSubview(forBackCellView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(roomImage)
        contentView.addSubview(peculiarView)
        contentView.addSubview(backDetailView)
        contentView.addSubview(textDetailLabel)
        contentView.addSubview(imageDetail)
        contentView.addSubview(priceLabel)
        contentView.addSubview(priceForItLabel)

        forBackCellView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            forBackCellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            forBackCellView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            forBackCellView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            forBackCellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])

        forBackCellView.layer.cornerRadius = 12
        forBackCellView.backgroundColor = .white

        roomImage.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            roomImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            roomImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            roomImage.heightAnchor.constraint(equalToConstant: 257),
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
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16)
        ])

        nameLabel.textColor = .black
        nameLabel.font = .systemFont(ofSize: 22, weight: .medium)
        nameLabel.numberOfLines = 0

        peculiarView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            peculiarView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            peculiarView.leftAnchor.constraint(equalTo: forBackCellView.leftAnchor, constant: 16),
            peculiarView.rightAnchor.constraint(equalTo: forBackCellView.rightAnchor, constant: -16)
        ])

        peculiarView.spacing = 8
        peculiarView.axis = .vertical

        backDetailView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            backDetailView.topAnchor.constraint(equalTo: peculiarView.bottomAnchor, constant: 8),
            backDetailView.leftAnchor.constraint(equalTo: forBackCellView.leftAnchor, constant: 16),
            backDetailView.rightAnchor.constraint(equalTo: imageDetail.rightAnchor, constant: 2)
        ])

        backDetailView.layer.cornerRadius = 5
        backDetailView.backgroundColor = UIColor(red: 0.051, green: 0.447, blue: 1, alpha: 0.1)

        textDetailLabel.text = "Подробнее о номере"
        textDetailLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            textDetailLabel.topAnchor.constraint(equalTo: backDetailView.topAnchor, constant: 5),
            textDetailLabel.leftAnchor.constraint(equalTo: backDetailView.leftAnchor, constant: 10),
            textDetailLabel.bottomAnchor.constraint(equalTo: backDetailView.bottomAnchor, constant: -5)
        ])

        textDetailLabel.textColor = UIColor(red: 0.051, green: 0.447, blue: 1, alpha: 1)
        textDetailLabel.font = .systemFont(ofSize: 16, weight: .medium)

        imageDetail.contentMode = .center
        imageDetail.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageDetail.centerYAnchor.constraint(equalTo: backDetailView.centerYAnchor),
            imageDetail.heightAnchor.constraint(equalToConstant: 24),
            imageDetail.widthAnchor.constraint(equalToConstant: 24),
            imageDetail.leftAnchor.constraint(equalTo: textDetailLabel.rightAnchor, constant: 2)
        ])

        imageDetail.backgroundColor = .clear

        priceLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: backDetailView.bottomAnchor, constant: 16),
            priceLabel.leftAnchor.constraint(equalTo: forBackCellView.leftAnchor, constant: 16)
        ])

        priceLabel.textColor = .black
        priceLabel.font = .systemFont(ofSize: 30, weight: .semibold)

        priceForItLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            priceForItLabel.topAnchor.constraint(equalTo: backDetailView.bottomAnchor, constant: 30),
            priceForItLabel.leftAnchor.constraint(equalTo: priceLabel.rightAnchor, constant: 8)
        ])

        priceForItLabel.textColor = UIColor(red: 0.51, green: 0.529, blue: 0.588, alpha: 1)
        priceForItLabel.font = .systemFont(ofSize: 16, weight: .regular)

        contentView.addSubview(buyButtonApp)

        buyButtonApp.addTarget(self, action: #selector(touchButton), for: .touchUpInside)

        buyButtonApp.translatesAutoresizingMaskIntoConstraints = false
        buyButtonApp.backgroundColor = UIColor(red: 13/255, green: 114/255, blue: 255/255, alpha: 1)
        buyButtonApp.layer.cornerRadius = 15

        NSLayoutConstraint.activate([
            buyButtonApp.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 16),
            buyButtonApp.leftAnchor.constraint(equalTo: forBackCellView.leftAnchor, constant: 16),
            buyButtonApp.rightAnchor.constraint(equalTo: forBackCellView.rightAnchor, constant: -16),
            buyButtonApp.heightAnchor.constraint(equalToConstant: 48),
            buyButtonApp.bottomAnchor.constraint(equalTo: forBackCellView.bottomAnchor,constant: -16)
        ])

        buyButtonApp.fill(title: "Выбрать номер")

    }

    @objc private func touchButton() {
        delegate?.didTouchRoomButton()
    }

}

