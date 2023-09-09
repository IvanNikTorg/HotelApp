//
//  OfferInfoCell.swift
//  hotelRes
//
//  Created by user on 08.09.2023.
//

import UIKit

final class OfferInfoCell: UITableViewCell {

    struct Model {

    }

    private let backView = UIView()
    private let stackView = UIStackView()
    private let startCityRow = OfferInfoRow()
    private let startCountryRow = OfferInfoRow()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "OfferInfoCell")
        configCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func fillCell(model: OfferInfoCell.Model?) {
        stackView.addArrangedSubview(startCityRow)
        startCityRow.fill(title: "Вылет из", value: "Санкт-Петербург")
        stackView.addArrangedSubview(startCountryRow)
        startCountryRow.fill(title: "Номер", value: "Стандартный с видом на бассейн или сад")
    }

    private func configCell() {
        backView.backgroundColor = .white
        backView.layer.cornerRadius = 12

        contentView.addSubview(backView)
        backView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            backView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            backView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4)
        ])

        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .fill
        stackView.contentMode = .scaleToFill

        backView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 16),
            stackView.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 16),
            stackView.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -16)
        ])
    }

}

private final class OfferInfoRow: UIView {

    private let titleLabel = UILabel()
    private let valueLabel = UILabel()

    init() {
        super.init(frame: .zero)
        configureView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func fill(title: String, value: String) {
        titleLabel.text = title
        valueLabel.text = value
    }

    private func configureView() {
        self.addSubview(titleLabel)
        titleLabel.textColor = UIColor(red: 0.51, green: 0.529, blue: 0.588, alpha: 1)
        titleLabel.font = .systemFont(ofSize: 16, weight: .regular)
        titleLabel.textAlignment = .left

        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor)
        ])

        self.addSubview(valueLabel)
        valueLabel.textColor = .black
        valueLabel.font = .systemFont(ofSize: 16, weight: .regular)
        valueLabel.textAlignment = .left
        valueLabel.numberOfLines = 0

        valueLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            valueLabel.topAnchor.constraint(equalTo: self.topAnchor),
            valueLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 140),
            valueLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            valueLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
