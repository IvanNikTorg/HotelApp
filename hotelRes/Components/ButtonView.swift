//
//  ButtonView.swift
//  hotelRes
//
//  Created by user on 08.09.2023.
//

import UIKit

final class ButtonView: UIButton {

    func fill(title: String) {
        self.setTitle(title, for: .normal)
    }

    init(){
        super.init(frame: .zero)
        config()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func config() {

        self.backgroundColor = UIColor(red: 13/255, green: 114/255, blue: 255/255, alpha: 1)
        self.layer.cornerRadius = 15
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)

    }

}


