//
//  RoomVCPresenter.swift
//  hotelRes
//
//  Created by user on 06.09.2023.
//

protocol RoomVCPresenterProtocol: AnyObject {    
    func getData()
    func openReservedScreen()
}

final class RoomVCPresenter: RoomVCPresenterProtocol {

    weak var output: RoomVCPresenterOutput?
    
    private var dataRoomSource = [RoomCell.HotelRoom]()

    func getData() {
        NetworkService.shared.getDataRoom { [weak self] resData in
            guard let self = self else { return }
            if resData?.rooms != nil, let rooms = resData?.rooms {
                self.dataRoomSource = rooms.map {
                    let hundred: Int = ($0.price ?? 0) % 1000
                    let fousend: Int = ($0.price ?? 0) / 1000
                    return RoomCell.HotelRoom(id: $0.id,
                                              name: $0.name,
                                              price: ((String(fousend)) + " " + (String(hundred)) + " ₽"),
                                              price_per: $0.price_per,
                                              peculiarities: $0.peculiarities,
                                              image_urls: $0.image_urls)
                }
                self.output?.updateRoomSection(with: self.dataRoomSource)
            }
        }


    }

    private func getRoomCellHotelRoom(index: Int) -> RoomCell.HotelRoom {
        return RoomCell.HotelRoom(id: dataRoomSource[index].id,
                                  name: dataRoomSource[index].name,
                                  price: dataRoomSource[index].price,
                                  price_per: dataRoomSource[index].price_per,
                                  peculiarities: dataRoomSource[index].peculiarities,
                                  image_urls: dataRoomSource[index].image_urls)
    }

    func openReservedScreen() {
        let vc = ReserveVC()
        let presenter = ReserveVCPresenter()
        presenter.output = vc
        vc.presenter = presenter
        vc.navigationItem.title = "Бронирование"
        output?.navigationController?.pushViewController(vc, animated: true)
        
    }
}


