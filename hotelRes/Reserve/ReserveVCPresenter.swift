//
//  ReserveVCPresenter.swift
//  hotelRes
//
//  Created by user on 08.09.2023.
//

protocol ReserveVCPresenterProtocol: AnyObject {
    func getData()
    func openFinalScreen()
}

final class ReserveVCPresenter: ReserveVCPresenterProtocol {

    weak var output: ReserveVCPresenterOutput?

    private var dataAboutSource = AboutCell.Model()
    private var dataOfferSource = OfferInfoCell.Model()
    private var dataTotalSource = TotalPriceCell.Model()

    func strWithR(number: Int) -> String {
        let hundred: Int = number % 1000
        let fousend: Int = number / 1000
        let str = (String(fousend)) + " " + (String(hundred)) + " ₽"
        return str
    }

    func getData() {
        NetworkService.shared.getDataReserve { [weak self] resData in
            guard let self = self else { return }
            if resData != nil, let res = resData {
                self.dataAboutSource = AboutCell.Model(nameHotel: res.hotel_name ?? "None",
                                                       rating: ((String(res.horating ?? 0)) + " " + (res.rating_name ?? "none")),
                                                       adress: res.hotel_adress)
                self.dataOfferSource = OfferInfoCell.Model(name: res.hotel_name ?? "None",
                                                           departure: res.departure ?? "None",
                                                           arrival_country: res.arrival_country ?? "None",
                                                           tour_date: (res.tour_date_start ?? "None") + " - " + (res.tour_date_stop ?? "None"),
                                                           number_of_nights: res.number_of_nights,
                                                           room: res.room,
                                                           nutrition: res.nutrition)


                let totalPrice = (res.tour_price ?? 0) + (res.fuel_charge ?? 0) + (res.service_charge ?? 0)
                self.dataTotalSource = TotalPriceCell.Model(tour_price: self.strWithR(number: res.tour_price ?? 0) ,
                                                            fuel_charge: self.strWithR(number: res.fuel_charge ?? 0),
                                                            service_charge: self.strWithR(number: res.service_charge ?? 0),
                                                            total: self.strWithR(number: totalPrice) )
            }
            self.output?.updateAboutSection(with: self.dataAboutSource)
            self.output?.updateOfferSection(with: self.dataOfferSource)
            self.output?.updateTotalSection(with: self.dataTotalSource)
        }
    }

    func openFinalScreen() {
        let vc = SuccessOrderVC()
        let presenter = SuccessVCPresenter()
        presenter.output = vc
        vc.presenter = presenter
        vc.navigationItem.title = "Заказ оплачен"
        vc.descriptionText = "Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление."
        output?.navigationController?.pushViewController(vc, animated: true)

    }
}



