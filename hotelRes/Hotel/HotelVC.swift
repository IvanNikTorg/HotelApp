//
//  HotelVC.swift
//  hotelRes
//
//  Created by user on 04.09.2023.
//

import UIKit

class HotelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        let label = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        label.text = "Hotel"
        label.textColor = .white
        view.addSubview(label)
    }


}

