//
//  ButtonTouristCell.swift
//  hotelRes
//
//  Created by user on 10.09.2023.
//

import UIKit

protocol ButtonTouristCellDelegate: AnyObject {
    func didTapButton()
}

final class ButtonTouristCell: UITableViewCell {

    private let buyButtonApp = ButtonView()
    
    weak var delegate: ButtonTouristCellDelegate?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "ButtonTouristCell")
        configCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func touchButton(parametrSender: Any) {
        delegate?.didTapButton()
    }

    private func configCell() {
        contentView.backgroundColor = .white
        contentView.addSubview(buyButtonApp)

        buyButtonApp.addTarget(self, action: #selector(touchButton(parametrSender: )), for: .touchUpInside)

        buyButtonApp.translatesAutoresizingMaskIntoConstraints = false
        buyButtonApp.backgroundColor = UIColor(red: 13/255, green: 114/255, blue: 255/255, alpha: 1)
        buyButtonApp.layer.cornerRadius = 15

        NSLayoutConstraint.activate([
            buyButtonApp.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            buyButtonApp.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            buyButtonApp.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            buyButtonApp.heightAnchor.constraint(equalToConstant: 48),
            buyButtonApp.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -100)

        ])

        buyButtonApp.fill(title: "Оплатить")

    }

}
