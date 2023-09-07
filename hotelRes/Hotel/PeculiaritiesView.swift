//
//  viewForPeculiarities.swift
//  hotelRes
//
//  Created by user on 06.09.2023.
//

import UIKit

final class PeculiaritiesView: UIView {

    private let backView = UIView()
    private let title = UILabel()

    func fill(title: String) {
        self.title.text = title
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
        self.addSubview(title)
        backView.backgroundColor = UIColor(red: 0.984, green: 0.984, blue: 0.988, alpha: 1)
        backView.translatesAutoresizingMaskIntoConstraints = false

        title.textColor = UIColor(red: 0.51, green: 0.529, blue: 0.588, alpha: 1)
        title.font = .systemFont(ofSize: 16, weight: .medium)
        title.textAlignment = .left

        title.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: backView.topAnchor, constant: 5),
            title.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            title.leftAnchor.constraint(equalTo: backView.leftAnchor, constant: 5)
        ])

        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: self.topAnchor),
            backView.bottomAnchor.constraint(equalTo: title.bottomAnchor, constant: 5),
            backView.leftAnchor.constraint(equalTo: self.leftAnchor),
            backView.rightAnchor.constraint(equalTo: title.rightAnchor, constant: 10)
        ])

    }
}

