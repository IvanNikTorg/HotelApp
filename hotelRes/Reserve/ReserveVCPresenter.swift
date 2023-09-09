//
//  ReserveVCPresenter.swift
//  hotelRes
//
//  Created by user on 08.09.2023.
//

protocol ReserveVCPresenterProtocol: AnyObject {
    func getData()
}

final class ReserveVCPresenter: ReserveVCPresenterProtocol {

    weak var output: ReserveVCPresenterOutput?
    private var dataReserveSource = ReserveVC.Model()

    func getData() {
        self.output?.updateReserveSection(with: ReserveVC.Model()) //todo
    }


}
