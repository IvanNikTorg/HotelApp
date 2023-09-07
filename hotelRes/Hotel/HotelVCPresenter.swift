//
//  HotelVCPresenter.swift
//  hotelRes
//
//  Created by user on 05.09.2023.
//

protocol HotelVCPresenterProtocol: AnyObject {
    func getData()
    func openRoomScreen()
}

final class HotelVCPresenter: HotelVCPresenterProtocol {

    weak var output: HotelVCPresenterOutput?

    private var dataHotelSource = DataHotelCell.Model()
    private var dataDetailSource = DetailHotelCell.Model()

    func getData() {
        NetworkService.shared.getDataHotel { [weak self] resHotel in
            guard let self = self else { return }
            if resHotel != nil, let hotel = resHotel {
                let hundred: Int = (hotel.minimal_price ?? 0) % 1000
                let fousend: Int = (hotel.minimal_price ?? 0) / 1000
                self.dataHotelSource = DataHotelCell.Model(nameHotel: hotel.name,
                                                      avatarImage: hotel.image_urls,
                                                      rating: ((String(hotel.rating ?? 0)) + " " + (hotel.rating_name ?? "none")),
                                                      adress: hotel.adress,
                                                      minPrice: ("от " + (String(fousend)) + " " + (String(hundred)) + " ₽"),
                                                      priceForIt: hotel.price_for_it)
                self.dataDetailSource = DetailHotelCell.Model(description: hotel.about_the_hotel.description,
                                                              peculiarities: hotel.about_the_hotel.peculiarities)
            }
            self.output?.updateDetailSection(with: self.dataDetailSource)
            self.output?.updateHotelSection(with: self.dataHotelSource)
        }

    }


    private func getHotelCellModel() -> DataHotelCell.Model {
        return DataHotelCell.Model(nameHotel: dataHotelSource.nameHotel,
                                   avatarImage: dataHotelSource.avatarImage,
                                   rating: dataHotelSource.rating,
                                   adress: dataHotelSource.adress,
                                   minPrice: dataHotelSource.minPrice,
                                   priceForIt: dataHotelSource.priceForIt)
    }

    private func getDetailCellModel() -> DetailHotelCell.Model {
        return DetailHotelCell.Model(description: dataDetailSource.description,
                                     peculiarities: dataDetailSource.peculiarities)
    }

    func openRoomScreen() {
        let VC = RoomVC()
        let presenter = RoomVCPresenter()
        presenter.output = VC
        VC.presenter = presenter

        output?.navigationController?.pushViewController(VC, animated: true)
    }
}

