//
//  SettingsView.swift
//  hotelRes
//
//  Created by user on 06.09.2023.
//

import UIKit

final class SettingsView: UIView {

    private let backView = UIView()
    private let title = UILabel()
    private let textTitle = UILabel()
    private var icon = UIImageView()
    private let arrow = UIImageView()
    private let line = UIView()

    func fill(title: String, _ textTitle: String = "Самое необходимое", icon: String,
              arrow: String = "arrow", lineIsHidden: Bool = false ) {
        self.title.text = title
        self.textTitle.text = textTitle
        self.icon.image = UIImage(named: icon)
        self.arrow.image = UIImage(named: arrow)
        self.line.isHidden = lineIsHidden

    }

    init(){
        super.init(frame: .zero)
        config()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func config() {

        self.addSubview(backView)
        backView.backgroundColor = .clear
        backView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: self.topAnchor),
            backView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backView.leftAnchor.constraint(equalTo: self.leftAnchor),
            backView.rightAnchor.constraint(equalTo: self.rightAnchor)
        ])

        self.addSubview(title)
        self.addSubview(textTitle)
        self.addSubview(icon)
        self.addSubview(arrow)
        self.addSubview(line)

        icon.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            icon.centerYAnchor.constraint(equalTo: title.bottomAnchor),
            icon.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 15),
            icon.widthAnchor.constraint(equalToConstant: 24),
            icon.heightAnchor.constraint(equalToConstant: 24)
        ])

        arrow.translatesAutoresizingMaskIntoConstraints = false
        arrow.contentMode = .center

        NSLayoutConstraint.activate([
            arrow.centerYAnchor.constraint(equalTo: title.bottomAnchor),
            arrow.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: -15),
            arrow.widthAnchor.constraint(equalToConstant: 24),
            arrow.heightAnchor.constraint(equalToConstant: 24)
        ])

        title.textColor = UIColor(red: 0.174, green: 0.189, blue: 0.209, alpha: 1)
        title.font = .systemFont(ofSize: 16, weight: .medium)
        title.textAlignment = .left

        title.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: backView.topAnchor, constant: 15),
            title.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: 12),
            title.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: 12)
        ])

        textTitle.textColor = UIColor(red: 0.511, green: 0.528, blue: 0.588, alpha: 1)
        textTitle.font = .systemFont(ofSize: 14, weight: .medium)
        textTitle.textAlignment = .left

        textTitle.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            textTitle.topAnchor.constraint(equalTo: title.bottomAnchor),
            textTitle.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: 12),
            textTitle.rightAnchor.constraint(equalTo: backView.rightAnchor, constant: 12)
        ])

        line.backgroundColor = UIColor(red: 0.51, green: 0.529, blue: 0.588, alpha: 0.15)
        line.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            line.topAnchor.constraint(equalTo: textTitle.bottomAnchor, constant: 10),
            line.bottomAnchor.constraint(equalTo: backView.bottomAnchor),
            line.leftAnchor.constraint(equalTo: icon.rightAnchor, constant: 12),
            line.rightAnchor.constraint(equalTo: arrow.rightAnchor),
            line.heightAnchor.constraint(equalToConstant: 2)
        ])
        
    }
}

