//
//  HotelVC.swift
//  hotelRes
//
//  Created by user on 04.09.2023.
//

import UIKit

protocol HotelVCPresenterOutput: UIViewController {
    func updateHotelSection(with model: DataHotelCell.Model)
    func updateDetailSection(with model: DetailHotelCell.Model)
}

class MyTableViewController: UITableViewController {

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        stopToFinish()
    }

    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    }

    func stopToFinish() {

    }
}

final class HotelVC: UIViewController {

    var presenter: HotelVCPresenter?

    private let hotelTableView = UITableView(frame: .zero, style: .plain)

    var dataHotelSource: DataHotelCell.Model?
    var dataDetailSource: DetailHotelCell.Model?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        presenter?.getData()
        navigationItem.title = "Отель"
        
    }


    private func setupView() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = .black
        navigationController?.navigationBar.backgroundColor = .white
        view.addSubview(hotelTableView)
        hotelTableView.allowsSelection = false
        hotelTableView.separatorStyle = .none
        hotelTableView.delegate = self
        hotelTableView.dataSource = self
        hotelTableView.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.976, alpha: 1)
        hotelTableView.register(DataHotelCell.self, forCellReuseIdentifier: "DataHotelCell")
        hotelTableView.register(DetailHotelCell.self, forCellReuseIdentifier: "DetailHotelCell")
        hotelTableView.register(ButtonCell.self, forCellReuseIdentifier: "ButtonCell")
        hotelTableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            hotelTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            hotelTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            hotelTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            hotelTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension HotelVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.textLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
            headerView.textLabel?.textColor = .white
        }


    }
}

extension HotelVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let dataHotelCell = tableView.dequeueReusableCell(withIdentifier: "DataHotelCell",
                                                                    for: indexPath) as? DataHotelCell
            else { return UITableViewCell() }

            dataHotelCell.fillCell(model: dataHotelSource)
            return dataHotelCell
        case 1:
            guard let dataDetailCell = tableView.dequeueReusableCell(withIdentifier: "DetailHotelCell",
                                                                     for: indexPath) as? DetailHotelCell
            else { return UITableViewCell() }

            dataDetailCell.fillCell(model: dataDetailSource)
            return dataDetailCell
        case 2:
            guard let buttonCell = tableView.dequeueReusableCell(withIdentifier: "ButtonCell",
                                                                 for: indexPath) as? ButtonCell
            else { return UITableViewCell() }
            buttonCell.delegate = self
            return buttonCell
        default:
            return UITableViewCell()
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
}

extension HotelVC: HotelVCPresenterOutput {

    func updateHotelSection(with model: DataHotelCell.Model) {
        dataHotelSource = model
        DispatchQueue.main.async {
            self.hotelTableView.reloadData()
        }
    }

    func updateDetailSection(with model: DetailHotelCell.Model) {
        dataDetailSource = model
        DispatchQueue.main.async {
            self.hotelTableView.reloadData()
        }
    }

}

extension HotelVC: ButtonCellDelegate {
    func didTapButton() {
        presenter?.openRoomScreen()
    }
}




