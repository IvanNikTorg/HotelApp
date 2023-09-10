//
//  CorouselViewCell.swift
//  hotelRes
//
//  Created by user on 10.09.2023.
//

import UIKit

class CorouselViewCell: UICollectionViewCell {

    static let reuseId = "CorouselCell"

    private var mainImageView = UIImageView()

    public func fillCell(model: String) {
        guard let url = URL(string: model) else { return }
        self.mainImageView.load(url: url)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(mainImageView)

        layer.cornerRadius = 15
        clipsToBounds = true

        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        
        mainImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mainImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        mainImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        mainImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
