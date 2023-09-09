//
//  ReserveVC.swift
//  hotelRes
//
//  Created by user on 08.09.2023.
//

import UIKit

protocol ReserveVCPresenterOutput: AnyObject {

    func updateReserveSection(with model: ReserveVC.Model)
}

final class ReserveVC: UIViewController, UITableViewDelegate {

    var presenter: ReserveVCPresenter?

    private let reserveTableView = UITableView(frame: .zero, style: .plain)

    struct Model {

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        presenter?.getData()

    }

    private func setupView() {
        view.addSubview(reserveTableView)
        reserveTableView.allowsSelection = false
        reserveTableView.separatorStyle = .none
//        reserveTableView.delegate = self
        reserveTableView.dataSource = self
        reserveTableView.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.976, alpha: 1)
        reserveTableView.register(OfferInfoCell.self, forCellReuseIdentifier: "OfferInfoCell")
        reserveTableView.register(BuyerInfoCell.self, forCellReuseIdentifier: "BuyerInfoCell")

        reserveTableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            reserveTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            reserveTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            reserveTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            reserveTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

extension ReserveVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        switch indexPath.section {
//        case 0:

//        case 1:
//            guard let offerInfoCell = tableView.dequeueReusableCell(withIdentifier: "OfferInfoCell",
//                                                                     for: indexPath) as? OfferInfoCell
//            else { return UITableViewCell() }
//
//            offerInfoCell.fillCell(model: OfferInfoCell.Model())
//            return offerInfoCell
//        case 2:
            guard let buyerInfoCell = tableView.dequeueReusableCell(withIdentifier: "BuyerInfoCell",
                                                                     for: indexPath) as? BuyerInfoCell
            else { return UITableViewCell() }

            buyerInfoCell.fillCell(model: BuyerInfoCell.Model())
            return buyerInfoCell
//        default:
//            return UITableViewCell()
//        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension ReserveVC: ReserveVCPresenterOutput {

//    func updateReserveSection(with model: ReserveVC.Model) {
//        dataReserveSource = model
//        DispatchQueue.main.async {
//            self.reserveTableView.reloadData()
//        }
//    }
    func updateReserveSection(with model: ReserveVC.Model) {
        //todo

        DispatchQueue.main.async {
            self.reserveTableView.reloadData()
        }
    }

}

