//
//  TouristCell.swift
//  hotelRes
//
//  Created by user on 09.09.2023.
//


import UIKit

protocol TouristCellDelegate: AnyObject {
    func updateCellHeight(isOpen: Bool)
}

final class TouristCell: UITableViewCell {

    weak var delegate: TouristCellDelegate?

    private var isOpen = true {
        didSet {
            let icon = UIImage(named: isOpen ? "arrow_top" : "arrow_down")
            arrowButton.setImage(icon, for: .normal)
        }
    }

    private let backView = UIView()
    private let titleLabel = UILabel()
    private let arrowButton = UIButton()
    private let stackView = UIStackView()

    private let nameField = StyledTextFieldView()
    private let surnameField = StyledTextFieldView()
    private let birthDateField = StyledTextFieldView()
    private let citizenField = StyledTextFieldView()
    private let passportNumberField = StyledTextFieldView()
    private let passportExpiredField = StyledTextFieldView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "TouristCell")
        configCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func isValid() -> Bool {
        let isNameValid = nameField.isValid()
        let isSurnameValid = surnameField.isValid()
        let isBirthValid = birthDateField.isValid()
        let isCitizenValid = citizenField.isValid()
        let isPassportValid = passportNumberField.isValid()
        let isExpiredValid = passportExpiredField.isValid()

        return isNameValid &&
        isSurnameValid &&
        isBirthValid &&
        isCitizenValid &&
        isPassportValid &&
        isExpiredValid
    }

    public func fillCell(title: String) {
        titleLabel.text = title
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

        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 22, weight: .medium)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(arrowButton)
        arrowButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            arrowButton.topAnchor.constraint(equalTo: backView.topAnchor, constant: 13),
            arrowButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            arrowButton.heightAnchor.constraint(equalToConstant: 32),
            arrowButton.widthAnchor.constraint(equalToConstant: 32)
        ])

        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.contentMode = .scaleToFill

        stackView.addArrangedSubview(titleLabel)
        stackView.setCustomSpacing(20, after: titleLabel)

        nameField.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(nameField)
        nameField.configure(type: .notDefined, placeholder: "Имя")

        surnameField.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(surnameField)
        surnameField.configure(type: .notDefined, placeholder: "Фамилия")

        birthDateField.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(birthDateField)
        birthDateField.configure(type: .notDefined, placeholder: "Дата рождения")

        citizenField.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(citizenField)
        citizenField.configure(type: .notDefined, placeholder: "Гражданство")

        passportNumberField.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(passportNumberField)
        passportNumberField.configure(type: .notDefined, placeholder: "Номер загранпаспорта")

        passportExpiredField.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(passportExpiredField)
        passportExpiredField.configure(type: .notDefined, placeholder: "Срок действия загранпаспорта")

        backView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 16),
            stackView.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 16),
            stackView.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -16),

            nameField.heightAnchor.constraint(equalToConstant: 52),
            surnameField.heightAnchor.constraint(equalToConstant: 52),
            birthDateField.heightAnchor.constraint(equalToConstant: 52),
            citizenField.heightAnchor.constraint(equalToConstant: 52),
            passportNumberField.heightAnchor.constraint(equalToConstant: 52),
            passportExpiredField.heightAnchor.constraint(equalToConstant: 52),
        ])

        setupArrowButton()
    }

    private func setupArrowButton() {
        let icon = UIImage(named: isOpen ? "arrow_top" : "arrow_down")
        arrowButton.setImage(icon, for: .normal)
        arrowButton.backgroundColor = UIColor(red: 0.05, green: 0.45, blue: 1, alpha: 0.1)
        arrowButton.layer.cornerRadius = 6
        arrowButton.addTarget(self, action: #selector(touchButton), for: .touchUpInside)
    }

    @objc private func touchButton() {
        nameField.isHidden = isOpen ? true : false
        surnameField.isHidden = isOpen ? true : false
        birthDateField.isHidden = isOpen ? true : false
        citizenField.isHidden = isOpen ? true : false
        passportNumberField.isHidden = isOpen ? true : false
        passportExpiredField.isHidden = isOpen ? true : false
        isOpen.toggle()
        delegate?.updateCellHeight(isOpen: isOpen)
    }

}
