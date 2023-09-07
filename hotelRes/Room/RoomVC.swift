//
//  RoomVC.swift
//  hotelRes
//
//  Created by user on 06.09.2023.
//

import UIKit

protocol RoomVCPresenterOutput: AnyObject {
    
    func updateRoomSection(with model: [RoomCell.HotelRoom])
}

final class RoomVC: UIViewController, UITableViewDelegate {

    var presenter: RoomVCPresenter?

    private let hotelTableView = UITableView(frame: .zero, style: .plain)

    var dataRoomSource: [RoomCell.HotelRoom]?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        presenter?.getData()
        navigationItem.title = "Steigenberger Makadi"

    }

    private func setupView() {
        view.addSubview(hotelTableView)
        hotelTableView.allowsSelection = false
        hotelTableView.separatorStyle = .none
        hotelTableView.delegate = self
        hotelTableView.dataSource = self
        hotelTableView.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.976, alpha: 1)
        hotelTableView.register(RoomCell.self, forCellReuseIdentifier: "RoomCell")

        hotelTableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            hotelTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            hotelTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            hotelTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            hotelTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension RoomVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let dataRoomCell = tableView.dequeueReusableCell(withIdentifier: "RoomCell",
                                                               for: indexPath) as? RoomCell
        else { return UITableViewCell() }
        dataRoomCell.fillCell(model: dataRoomSource?[indexPath.row])
        return dataRoomCell

    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return (dataRoomSource?.count) ?? 1
    }
}

extension RoomVC: RoomVCPresenterOutput {
    
    func updateRoomSection(with model: [RoomCell.HotelRoom]) {
        dataRoomSource = model
        DispatchQueue.main.async {
            self.hotelTableView.reloadData()
        }
    }
    
}


