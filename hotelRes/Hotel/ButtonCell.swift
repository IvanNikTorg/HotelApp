//
//  ButtonCell.swift
//  hotelRes
//
//  Created by user on 05.09.2023.
//

import UIKit

protocol ButtonCellDelegate: AnyObject {
    func didTapButton()
}

final class ButtonCell: UITableViewCell {

    private let buyButton = UIButton()
    private let textButton = UILabel()

    weak var delegate: ButtonCellDelegate?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "ButtonCell")
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

        contentView.addSubview(buyButton)
        contentView.addSubview(textButton)

        buyButton.addTarget(self, action: #selector(touchButton(parametrSender: )), for: .touchUpInside)

        buyButton.translatesAutoresizingMaskIntoConstraints = false
        buyButton.backgroundColor = UIColor(red: 13/255, green: 114/255, blue: 255/255, alpha: 1)
        buyButton.layer.cornerRadius = 15

        NSLayoutConstraint.activate([
            buyButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            buyButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            buyButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            buyButton.heightAnchor.constraint(equalToConstant: 48),
            buyButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -15)
        ])

        textButton.text = "К выбору номера"
        textButton.font = .systemFont(ofSize: 16, weight: .medium)
        textButton.textColor = .white

        textButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            textButton.centerYAnchor.constraint(equalTo: buyButton.centerYAnchor),
            textButton.centerXAnchor.constraint(equalTo: buyButton.centerXAnchor)
        ])
        
    }
    
}
