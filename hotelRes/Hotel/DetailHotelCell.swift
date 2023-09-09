//
//  DetailHotelCell.swift
//  hotelRes
//
//  Created by user on 05.09.2023.
//

import UIKit

final class DetailHotelCell: UITableViewCell {

    struct Model {
        var description: String?
        var peculiarities: [String]?

    }

    private let titleDetail = UILabel()
    private let descriptLabel = UILabel()
    private let peculiarView = UIStackView()
    private let backCellView = UIView()
    private let settingStackView = UIStackView()
    private let settingBackView = UIView()
 //   private var pecArrayView = [PeculiaritiesView]()

    let setInfoComf = SettingsView()
    let setInfoInc = SettingsView()
    let setInfoUnInc = SettingsView()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "DetailHotelCell")
        configCell()

    }

    public func fillCell(model: DetailHotelCell.Model?) {
        descriptLabel.text = model?.description ?? "None"
        guard let pec = model?.peculiarities else { return }
        for str in pec {
            let view = PeculiaritiesView()
            view.fill(title: str)
            peculiarView.addArrangedSubview(view)

//            pecArrayView.append(view)

//            peculiarView.addSubview(view)
//            view.translatesAutoresizingMaskIntoConstraints = false
//            NSLayoutConstraint.activate([
//                view.leftAnchor.constraint(equalTo: peculiarView.leftAnchor),
//                view.topAnchor.constraint(equalTo: peculiarView.topAnchor),
//                view.bottomAnchor.constraint(equalTo: peculiarView.bottomAnchor)
//            ])
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configCell() {

        titleDetail.text = "Отель"

        contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        contentView.addSubview(backCellView)
        contentView.addSubview(titleDetail)
        contentView.addSubview(peculiarView)
        contentView.addSubview(descriptLabel)
        contentView.addSubview(settingBackView)

        backCellView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            backCellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            backCellView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            backCellView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            backCellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])

        backCellView.layer.cornerRadius = 12
        backCellView.backgroundColor = .white

        titleDetail.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleDetail.topAnchor.constraint(equalTo: backCellView.topAnchor, constant: 16),
            titleDetail.leftAnchor.constraint(equalTo: backCellView.leftAnchor, constant: 16),
            titleDetail.rightAnchor.constraint(equalTo: backCellView.rightAnchor, constant: -16)
        ])

        titleDetail.textAlignment = .left
        titleDetail.textColor = .black
        titleDetail.font = .systemFont(ofSize: 22, weight: .medium)

        peculiarView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            peculiarView.topAnchor.constraint(equalTo: titleDetail.bottomAnchor, constant: 16),
            peculiarView.leftAnchor.constraint(equalTo: backCellView.leftAnchor, constant: 16),
            peculiarView.rightAnchor.constraint(equalTo: backCellView.rightAnchor, constant: -16),
        ])

        peculiarView.axis = .vertical

        descriptLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            descriptLabel.topAnchor.constraint(equalTo: peculiarView.bottomAnchor, constant: 12),
            descriptLabel.leftAnchor.constraint(equalTo: backCellView.leftAnchor, constant: 16),
            descriptLabel.rightAnchor.constraint(equalTo: backCellView.rightAnchor, constant: -16)
        ])

        descriptLabel.textColor = .black
        descriptLabel.font = .systemFont(ofSize: 16, weight: .regular)
        descriptLabel.numberOfLines = 0

        settingBackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            settingBackView.topAnchor.constraint(equalTo: descriptLabel.bottomAnchor, constant: 16),
            settingBackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            settingBackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            settingBackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])

        settingBackView.addSubview(settingStackView)

        settingBackView.layer.cornerRadius = 15
        settingBackView.backgroundColor = UIColor(red: 0.984, green: 0.984, blue: 0.988, alpha: 1)

        settingStackView.axis = .vertical
        settingStackView.contentMode = .center
        settingStackView.backgroundColor = .clear

        setInfoComf.fill(title: "Удобства", icon: "happy")
        setInfoInc.fill(title: "Что включено", icon: "square")
        setInfoUnInc.fill(title: "Что не включено", icon: "close", lineIsHidden: true)

        settingStackView.addArrangedSubview(setInfoComf)
        settingStackView.addArrangedSubview(setInfoInc)
        settingStackView.addArrangedSubview(setInfoUnInc)

        settingStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            settingStackView.topAnchor.constraint(equalTo: descriptLabel.bottomAnchor, constant: 16),
            settingStackView.leftAnchor.constraint(equalTo: backCellView.leftAnchor, constant: 16),
            settingStackView.rightAnchor.constraint(equalTo: backCellView.rightAnchor, constant: -16),
            settingStackView.bottomAnchor.constraint(equalTo: backCellView.bottomAnchor,constant: -16)
        ])
    }

}

