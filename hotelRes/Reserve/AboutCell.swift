//
//  AboutCell.swift
//  hotelRes
//
//  Created by user on 09.09.2023.
//

import UIKit

final class AboutCell: UITableViewCell {

    struct Model {
        var nameHotel: String?
        var rating: String?
        var adress: String?
    }

    private let aboutView = AboutView()
    private let viewForBackCell = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "AboutCell")
        configCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func fillCell(model: AboutCell.Model?) {
        aboutView.fill(name: model?.nameHotel ?? "None",
                       rating: model?.rating ?? "None",
                       adress: model?.adress ?? "None")
    }

    private func configCell() {
        self.backgroundColor = .clear
        viewForBackCell.layer.cornerRadius = 12
        viewForBackCell.backgroundColor = .white
        
        contentView.addSubview(viewForBackCell)
        contentView.addSubview(aboutView)
        
        viewForBackCell.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            viewForBackCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            viewForBackCell.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            viewForBackCell.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            viewForBackCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4)
        ])

        aboutView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            aboutView.topAnchor.constraint(equalTo: viewForBackCell.topAnchor, constant: 16),
            aboutView.leftAnchor.constraint(equalTo: viewForBackCell.leftAnchor, constant: 16),
            aboutView.rightAnchor.constraint(equalTo: viewForBackCell.rightAnchor, constant: -16),
            aboutView.bottomAnchor.constraint(equalTo: viewForBackCell.bottomAnchor, constant: -16)
        ])


    }

}
