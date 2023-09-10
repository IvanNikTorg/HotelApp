//
//  SuccessOrderVC.swift
//  hotelRes
//
//  Created by user on 10.09.2023.
//

import UIKit

protocol SuccessVCPresenterOutput: UIViewController {

}

final class SuccessOrderVC: UIViewController {

    var presenter: SuccessVCPresenter?

    var descriptionText: String? {
        didSet {
            descriptionLabel.text = descriptionText
        }
    }

    private let iconBackground = UIView()
    private let iconView = UIImageView(image: UIImage(named: "success_icon"))
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let separator = UIView()
    private let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        layout()
        presenter?.getData()
        navigationItem.title = "Заказ оплачен"

    }

    private func setupView() {
        iconBackground.layer.cornerRadius = 47
        iconBackground.backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.93, alpha: 1)

        titleLabel.text = "Ваш заказ принят в работу"
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 22, weight: .medium)

        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = UIColor(red: 0.51, green: 0.53, blue: 0.59, alpha: 1)
        descriptionLabel.font = .systemFont(ofSize: 16, weight: .regular)
        descriptionLabel.textAlignment = .center

        button.backgroundColor = UIColor(red: 0.05, green: 0.45, blue: 1, alpha: 1)
        button.setTitle("Супер!", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        separator.backgroundColor = UIColor(red: 0.91, green: 0.91, blue: 0.93, alpha: 1)
    }

    private func layout() {
        view.addSubview(iconBackground)
        view.addSubview(iconView)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(separator)
        view.addSubview(button)

        iconBackground.translatesAutoresizingMaskIntoConstraints = false
        iconView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        separator.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            iconBackground.widthAnchor.constraint(equalToConstant: 94),
            iconBackground.heightAnchor.constraint(equalToConstant: 94),
            iconBackground.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconBackground.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 122),

            iconView.widthAnchor.constraint(equalToConstant: 44),
            iconView.heightAnchor.constraint(equalToConstant: 44),
            iconView.centerXAnchor.constraint(equalTo: iconBackground.centerXAnchor),
            iconView.centerYAnchor.constraint(equalTo: iconBackground.centerYAnchor),

            titleLabel.topAnchor.constraint(equalTo: iconBackground.bottomAnchor, constant: 32),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),

            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            descriptionLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 23),
            descriptionLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -23),

            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            button.heightAnchor.constraint(equalToConstant: 48),

            separator.heightAnchor.constraint(equalToConstant: 1),
            separator.leftAnchor.constraint(equalTo: view.leftAnchor),
            separator.rightAnchor.constraint(equalTo: view.rightAnchor),

            separator.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -12)
        ])
    }

    @objc func buttonTapped() {
        presenter?.closeItApp()
    }
}

extension SuccessOrderVC: SuccessVCPresenterOutput{
    
}
