//
//  RoomVC.swift
//  hotelRes
//
//  Created by user on 06.09.2023.
//

import UIKit

protocol RoomVCPresenterOutput: UIViewController {
    func updateRoomSection(with model: [RoomCell.HotelRoom])
}

final class RoomVC: UIViewController, UITableViewDelegate {

    var presenter: RoomVCPresenter?

    private let roomTableView = UITableView(frame: .zero, style: .plain)

    var dataRoomSource: [RoomCell.HotelRoom]?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        presenter?.getData()
        
    }

    private func setupView() {
        view.addSubview(roomTableView)
        roomTableView.allowsSelection = false
        roomTableView.separatorStyle = .none
        roomTableView.delegate = self
        roomTableView.dataSource = self
        roomTableView.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.976, alpha: 1)
        roomTableView.register(RoomCell.self, forCellReuseIdentifier: "RoomCell")

        roomTableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            roomTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            roomTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            roomTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            roomTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
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
        dataRoomCell.delegate = self

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
            self.roomTableView.reloadData()
        }
    }
    
}

extension RoomVC: ButtonRoomDelegate {
    func didTouchRoomButton() {
        presenter?.openReservedScreen()
    }
}


