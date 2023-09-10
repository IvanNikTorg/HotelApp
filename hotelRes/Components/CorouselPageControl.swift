//
//  CorouselPageControl.swift
//  hotelRes
//
//  Created by user on 10.09.2023.
//

import UIKit

final class CorouselPageControl: UIPageControl {
    
    init() {

        super.init(frame: .zero)
        config()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func config() {
        numberOfPages = 5

        pageIndicatorTintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.22)
        currentPageIndicatorTintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)

        hidesForSinglePage = true
        backgroundColor = .white
        layer.cornerRadius = 5

        pageIndicatorTintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.22)
        currentPageIndicatorTintColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)

        showsLargeContentViewer = true

    }

    @objc private func touchPageControl (parametrSender: Any) {

    }

}
