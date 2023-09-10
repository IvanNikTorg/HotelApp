//
//  StyledTextFieldView.swift
//  hotelRes
//
//  Created by user on 09.09.2023.
//

import UIKit

final class StyledTextFieldView: UIView {

    enum TextFieldType {
        case phone
        case email
        case notDefined
    }


    private let headerTitleLabel = UILabel()
    private let textField =  UITextField()

    private var headerTopConstraint: NSLayoutConstraint?
    private var textFieldBottomConstraint: NSLayoutConstraint?
    private var type: StyledTextFieldView.TextFieldType?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        layout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        layout()
    }

    func configure(type: StyledTextFieldView.TextFieldType, placeholder: String) {
        headerTitleLabel.text = placeholder
        self.type = type
    }

    func isValid() -> Bool {
        let isValid = !(textField.text?.isEmpty ?? true)
        self.backgroundColor = isValid ? UIColor(red: 0.965, green: 0.965, blue: 0.976, alpha: 1) : UIColor(red: 0.92, green: 0.34, blue: 0.34, alpha: 0.15)
        return isValid

    }

    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    private func setupView() {
        self.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.976, alpha: 1)
        self.layer.cornerRadius = 10

        textField.textColor = UIColor(red: 0.079, green: 0.077, blue: 0.167, alpha: 1)
        textField.font = .systemFont(ofSize: 16, weight: .regular)
        textField.delegate = self

        headerTitleLabel.textColor = UIColor(red: 0.661, green: 0.672, blue: 0.717, alpha: 1)
        headerTitleLabel.font = .systemFont(ofSize: 17, weight: .regular)
    }

    private func layout() {
        self.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            textField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            textField.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -16)
        ])
        textFieldBottomConstraint = textField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        textFieldBottomConstraint?.isActive = true

        self.addSubview(headerTitleLabel)
        headerTitleLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            headerTitleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            headerTitleLabel.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -16)
        ])
        headerTopConstraint = headerTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10)
        headerTopConstraint?.isActive = true

        setTextFieldAsPlaceholder(true)
    }

    private func setTextFieldAsPlaceholder(_ isPlaceholder: Bool) {
        if isPlaceholder {
            headerTopConstraint?.constant = 16
            textFieldBottomConstraint?.constant = -16
            headerTitleLabel.font = headerTitleLabel.font?.withSize(17)
        } else {
            headerTopConstraint?.constant = 8
            textFieldBottomConstraint?.constant = -8
            headerTitleLabel.font = headerTitleLabel.font?.withSize(12)
        }
        UIView.animate(withDuration: 0.25) { [weak self] in
            self?.layoutSubviews()
        }
    }

    override func becomeFirstResponder() -> Bool {
            return textField.becomeFirstResponder()
        }

        override func resignFirstResponder() -> Bool {
            return textField.resignFirstResponder()
        }
}


extension StyledTextFieldView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.setTextFieldAsPlaceholder(false)
        self.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.976, alpha: 1)
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        self.setTextFieldAsPlaceholder(textField.text?.isEmpty ?? true)
        switch self.type {
        case .email:
            let isValidEmail = isValidEmail(textField.text ?? "") && !(textField.text?.isEmpty ?? true)
            self.backgroundColor = isValidEmail ? UIColor(red: 0.965, green: 0.965, blue: 0.976, alpha: 1) : UIColor(red: 0.92, green: 0.34, blue: 0.34, alpha: 0.15)
        default:
            break
        }
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
