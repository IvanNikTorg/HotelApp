//
//  BuyerInfoCell.swift
//  hotelRes
//
//  Created by user on 08.09.2023.
//

import UIKit

final class BuyerInfoCell: UITableViewCell {

    struct Model {

    }

    private let backView = UIView()
    private let titleLabel = UILabel()
    private let telTextField = StyledTextFieldView()
    private let emailTextField = StyledTextFieldView()
    private let descriptionLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "BuyerInfoCell")
        configCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func fillCell(model: BuyerInfoCell.Model?) {
        //todo
       
    }

    private func configCell() {
        self.backgroundColor = .clear
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

        titleLabel.text = "Информация о покупателе"
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 22, weight: .medium)
        titleLabel.textAlignment = .left

        backView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: backView.topAnchor, constant: 16),
            titleLabel.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 16),
            titleLabel.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -16)
        ])

        telTextField.configure(type: .phone, placeholder: "Номер телефона")
        backView.addSubview(telTextField)
        telTextField.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            telTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            telTextField.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 16),
            telTextField.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -16),
            telTextField.heightAnchor.constraint(equalToConstant: 52)
        ])

       // telTextField.text = "+7 (***) ***-**-**"

        emailTextField.configure(type: .email, placeholder: "Почта")
        backView.addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: telTextField.bottomAnchor, constant: 8),
            emailTextField.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 16),
            emailTextField.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -16),
            emailTextField.heightAnchor.constraint(equalToConstant: 52)
        ])

        descriptionLabel.text = "Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту"
        descriptionLabel.textColor = UIColor(red: 0.51, green: 0.529, blue: 0.588, alpha: 1)
        descriptionLabel.font = .systemFont(ofSize: 14, weight: .regular)
        descriptionLabel.textAlignment = .left
        descriptionLabel.numberOfLines = 0

        backView.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 8),
            descriptionLabel.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 16),
            descriptionLabel.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -16)
        ])
    }

}

