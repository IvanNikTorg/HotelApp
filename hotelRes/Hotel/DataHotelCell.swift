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

    private let corouselView = CorouselView()
    private let pageControl = CorouselPageControl()

    private let aboutView = AboutView()

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
        aboutView.fill(name: model?.nameHotel  ?? "None",
                       rating: model?.rating  ?? "None",
                       adress: model?.adress  ?? "None")
        minPriceLabel.text = model?.minPrice ?? "None"
        priceForItLabel.text = model?.priceForIt ?? "None"
        corouselView.fillCell(model: model?.avatarImage ?? [])
    }
    
    private func configCell() {
        contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        contentView.addSubview(viewForBackCell)
        contentView.addSubview(aboutView)
        contentView.addSubview(minPriceLabel)
        contentView.addSubview(priceForItLabel)
        contentView.addSubview(corouselView)
        contentView.addSubview(pageControl)

        viewForBackCell.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            viewForBackCell.topAnchor.constraint(equalTo: contentView.topAnchor),
            viewForBackCell.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            viewForBackCell.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            viewForBackCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4)
        ])

        viewForBackCell.layer.cornerRadius = 12
        viewForBackCell.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        viewForBackCell.backgroundColor = .white

        corouselView.translatesAutoresizingMaskIntoConstraints = false

        pageControl.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: corouselView.bottomAnchor, constant: -8),
            pageControl.centerXAnchor.constraint(equalTo: viewForBackCell.centerXAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 17),

            corouselView.topAnchor.constraint(equalTo: viewForBackCell.topAnchor, constant: 5),
            corouselView.centerXAnchor.constraint(equalTo: viewForBackCell.centerXAnchor),
            corouselView.heightAnchor.constraint(equalToConstant: 257),
            corouselView.leftAnchor.constraint(equalTo: viewForBackCell.leftAnchor, constant: 16),
            corouselView.rightAnchor.constraint(equalTo: viewForBackCell.rightAnchor, constant: -16),
        ])

        aboutView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            aboutView.topAnchor.constraint(equalTo: corouselView.bottomAnchor, constant: 16),
            aboutView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            aboutView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 10)
        ])

        minPriceLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            minPriceLabel.topAnchor.constraint(equalTo: aboutView.bottomAnchor, constant: 16),
            minPriceLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            minPriceLabel.bottomAnchor.constraint(equalTo: viewForBackCell.bottomAnchor, constant: -16)
        ])

        minPriceLabel.textColor = .black
        minPriceLabel.font = .systemFont(ofSize: 30, weight: .semibold)

        priceForItLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            priceForItLabel.topAnchor.constraint(equalTo: aboutView.bottomAnchor, constant: 30),
            priceForItLabel.leftAnchor.constraint(equalTo: minPriceLabel.rightAnchor, constant: 8)

        ])

        priceForItLabel.textColor = UIColor(red: 0.51, green: 0.53, blue: 0.59, alpha: 1)
        priceForItLabel.font = .systemFont(ofSize: 16, weight: .regular)

    }
}
