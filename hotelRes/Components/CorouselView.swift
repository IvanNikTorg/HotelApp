//
//  CorouselView.swift
//  hotelRes
//
//  Created by user on 10.09.2023.
//

import UIKit

final class CorouselView: UICollectionView, UIPageViewControllerDelegate {

    struct Constants {
        static let leftC : CGFloat = 0
        static let rightC : CGFloat = 0
        static let corouselMinLineSpacing : CGFloat = 5
    }

    
    private var strArray = [String]()

    func fillCell(model: [String]) {
        self.strArray = model
        self.reloadData()
    }


    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = CorouselView.Constants.corouselMinLineSpacing
        super.init(frame: .zero, collectionViewLayout: layout)
        
        config()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func config() {

        backgroundColor = .white

        delegate = self
        dataSource = self

        register(CorouselViewCell.self, forCellWithReuseIdentifier: CorouselViewCell.reuseId)

        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false

        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 15
        contentInset = UIEdgeInsets(top: 0, left: CorouselView.Constants.leftC,
                                    bottom: 0, right: CorouselView.Constants.rightC)

    }

}

extension CorouselView: UICollectionViewDelegate {

}


extension CorouselView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return strArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = dequeueReusableCell(withReuseIdentifier: CorouselViewCell.reuseId, for: indexPath)
                as? CorouselViewCell
        else { return UICollectionViewCell() }
        cell.fillCell(model: strArray[indexPath.row])
        return cell
    }
}

extension CorouselView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: frame.height)
        
    }
}
