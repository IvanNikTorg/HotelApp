//
//  TotalPriceCell.swift
//  hotelRes
//
//  Created by user on 09.09.2023.
//

import UIKit

final class TotalPriceCell: UITableViewCell {

    struct Model {
        var tour_price: String?
        var fuel_charge: String?
        var service_charge: String?
        var total: String?
    }

    private let viewForBackCell = UIView()
    private let tourPriceLabel = PriceRow()
    private let fuelPriceLabel = PriceRow()
    private let servicePriceLabel = PriceRow()
    private let totalLabel = PriceRow()

    private let stackView = UIStackView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "TotalPriceCell")
        configCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func fillCell(model: TotalPriceCell.Model?) {
        tourPriceLabel.fill(title: "Тур", value: model?.tour_price ?? "None")
        stackView.addArrangedSubview(tourPriceLabel)

        fuelPriceLabel.fill(title: "Топливный сбор", value: model?.fuel_charge ?? "None")
        stackView.addArrangedSubview(fuelPriceLabel)

        servicePriceLabel.fill(title: "Сервисный сбор", value: model?.service_charge ?? "None")
        stackView.addArrangedSubview(servicePriceLabel)

        totalLabel.fill(title: "К оплате", value: model?.total ?? "None", isTotal: true)
        stackView.addArrangedSubview(totalLabel)

    }

    private func configCell() {
        self.backgroundColor = .clear
        viewForBackCell.layer.cornerRadius = 12
        viewForBackCell.backgroundColor = .white

        contentView.addSubview(viewForBackCell)
        contentView.addSubview(stackView)

        viewForBackCell.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            viewForBackCell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            viewForBackCell.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            viewForBackCell.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            viewForBackCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4)
        ])

        stackView.spacing = 16
        stackView.axis = .vertical
        
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: viewForBackCell.topAnchor, constant: 16),
            stackView.leftAnchor.constraint(equalTo: viewForBackCell.leftAnchor, constant: 16),
            stackView.rightAnchor.constraint(equalTo: viewForBackCell.rightAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: viewForBackCell.bottomAnchor, constant: -16)
        ])

        
    }

}

private final class PriceRow: UIView {

    private let titleLabel = UILabel()
    private let valueLabel = UILabel()

    init() {
        super.init(frame: .zero)
        configureView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func fill(title: String, value: String, isTotal: Bool = false) {
        valueLabel.textColor = isTotal ? UIColor(red: 0.051, green: 0.447, blue: 1, alpha: 1) : .black
        valueLabel.font = isTotal ? UIFont(name: "SFProDisplay-Semibold", size: 16) : UIFont(name: "SFProDisplay-Regular", size: 16)

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
        valueLabel.textAlignment = .right

        valueLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            valueLabel.topAnchor.constraint(equalTo: self.topAnchor),
            valueLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            valueLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

