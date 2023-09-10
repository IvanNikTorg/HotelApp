//
//  ReserveVC.swift
//  hotelRes
//
//  Created by user on 08.09.2023.
//

import UIKit

protocol ReserveVCPresenterOutput: UIViewController {
    func updateAboutSection(with model: AboutCell.Model)
    func updateOfferSection(with model: OfferInfoCell.Model)
    func updateTotalSection(with model: TotalPriceCell.Model)
}

final class ReserveVC: UIViewController, UITableViewDelegate, ButtonTouristCellDelegate {

    var presenter: ReserveVCPresenter?

    var dataAboutSource: AboutCell.Model?
    var dataOfferSource: OfferInfoCell.Model?
    var dataTotalSource: TotalPriceCell.Model?

    private var numbOfTourists = 1
    private var numnOfTouristStr = ["Первый", "Второй", "Третий", "Четвертый", "Пятый", "Шестой",
                                    "Седьмой", "Восьмой", "Девятый", "Десятый"]
    private let reserveTableView = UITableView(frame: .zero, style: .plain)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        presenter?.getData()

    }

    private func setupView() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = .black
        view.addSubview(reserveTableView)
        reserveTableView.allowsSelection = false
        reserveTableView.separatorStyle = .none
        reserveTableView.delegate = self
        reserveTableView.dataSource = self
        reserveTableView.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.976, alpha: 1)
        reserveTableView.register(AboutCell.self, forCellReuseIdentifier: "AboutCell")
        reserveTableView.register(OfferInfoCell.self, forCellReuseIdentifier: "OfferInfoCell")
        reserveTableView.register(BuyerInfoCell.self, forCellReuseIdentifier: "BuyerInfoCell")
        reserveTableView.register(TouristCell.self, forCellReuseIdentifier: "TouristCell")
        reserveTableView.register(AddTouristCell.self, forCellReuseIdentifier: "AddTouristCell")
        reserveTableView.register(TotalPriceCell.self, forCellReuseIdentifier: "TotalPriceCell")
        reserveTableView.register(ButtonTouristCell.self, forCellReuseIdentifier: "ButtonTouristCell")

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
        return section == 3 ? numbOfTourists : 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let aboutCell = tableView.dequeueReusableCell(withIdentifier: "AboutCell", for: indexPath) as? AboutCell
            else { return UITableViewCell() }

            aboutCell.fillCell(model: dataAboutSource)
            return aboutCell
        case 1:
            guard let offerInfoCell = tableView.dequeueReusableCell(withIdentifier: "OfferInfoCell",
                                                                    for: indexPath) as? OfferInfoCell
            else { return UITableViewCell() }

            offerInfoCell.fillCell(model: dataOfferSource)
            return offerInfoCell
        case 2:
            guard let buyerInfoCell = tableView.dequeueReusableCell(withIdentifier: "BuyerInfoCell",
                                                                    for: indexPath) as? BuyerInfoCell
            else { return UITableViewCell() }

            buyerInfoCell.fillCell(model: BuyerInfoCell.Model())
            return buyerInfoCell
        case 3:
            guard let touristCell = tableView.dequeueReusableCell(withIdentifier: "TouristCell",
                                                                    for: indexPath) as? TouristCell
            else { return UITableViewCell() }
            touristCell.delegate = self
            if indexPath.row > 9 {
                touristCell.fillCell(title: String(indexPath.row + 1) + " турист")
            } else {
                touristCell.fillCell(title: numnOfTouristStr[indexPath.row] + " турист")
            }
            return touristCell
        case 4:
            guard let addTouristCell = tableView.dequeueReusableCell(withIdentifier: "AddTouristCell",
                                                                    for: indexPath) as? AddTouristCell
            else { return UITableViewCell() }
            addTouristCell.delegate = self
            return addTouristCell
        case 5:
            guard let totalPriceCell = tableView.dequeueReusableCell(withIdentifier: "TotalPriceCell",
                                                                for: indexPath) as? TotalPriceCell
            else { return UITableViewCell() }

            totalPriceCell.fillCell(model: dataTotalSource)
            return totalPriceCell
        case 6:
            guard let buttonTouristCell = tableView.dequeueReusableCell(withIdentifier: "ButtonTouristCell",
                                                                 for: indexPath) as? ButtonTouristCell
            else { return UITableViewCell() }
            buttonTouristCell.delegate = self
            return buttonTouristCell
        default:
            return UITableViewCell()
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return UITableView.automaticDimension
    }
}

extension ReserveVC: ReserveVCPresenterOutput {

    func updateAboutSection(with model: AboutCell.Model) {
        dataAboutSource = model
        DispatchQueue.main.async {
            self.reserveTableView.reloadData()
        }
    }

    func updateOfferSection(with model: OfferInfoCell.Model) {
        dataOfferSource = model
        DispatchQueue.main.async {
            self.reserveTableView.reloadData()
        }
    }

    func updateTotalSection(with model: TotalPriceCell.Model) {
        dataTotalSource = model
        DispatchQueue.main.async {
            self.reserveTableView.reloadData()
        }
    }

}

extension ReserveVC: TouristCellDelegate {
    func updateCellHeight(isOpen: Bool) {
        self.reserveTableView.reloadData()
    }
}

extension ReserveVC: AddTouristCellDelegate {
    func addTourist() {
        numbOfTourists += 1
        self.reserveTableView.reloadData()
    }
}

extension ReserveVC: ButtonCellDelegate {
    func didTapButton() {
        var flag = [Bool]()
        var count = 0
        for _ in 0..<numbOfTourists {
            guard let cell = reserveTableView.cellForRow(at: IndexPath(row: count, section: 3)) as? TouristCell
            else { return }
            count += 1
            flag.append(cell.isValid())
        }
        
        var nextScreenFlag = true
        for el in flag {
            if el != true {
                nextScreenFlag = false
                break
            }
        }
        if nextScreenFlag {
            presenter?.openFinalScreen()
        }
    }
}

