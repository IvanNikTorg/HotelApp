//
//  NetworkServices.swift
//  hotelRes
//
//  Created by user on 05.09.2023.
//

import Foundation

struct HotelData: Codable {
    let id: Int?
    let name: String?
    let adress: String?
    let minimal_price: Int?
    let price_for_it: String?
    let rating: Int?
    let rating_name: String?
    let image_urls: [String]?
    let about_the_hotel: AboutHotel
      }

struct AboutHotel: Codable {
    let description: String?
    let peculiarities: [String]?
}

struct RoomData: Codable {
    let rooms: [HotelRoom]?
}

struct HotelRoom: Codable {
    let id: Int?
    let name: String?
    let price: Int?
    let price_per: String?
    let peculiarities: [String]?
    let image_urls: [String]?
}



class NetworkService {
    //для создания singletone поэтому инит приватный
    static let shared = NetworkService()
    private init() {}

    private let startUrl = "https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3"
    private let roomUrl = "https://run.mocky.io/v3/f9a38183-6f95-43aa-853a-9c83cbb05ecd"
    private let reserveUrl = "https://run.mocky.io/v3/e8868481-743f-4eb2-a0d7-2bc4012275c8"

    func getDataHotel(completion: @escaping (HotelData?) -> () ) {
        guard let url = URL(string: startUrl) else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            do {
                let urlList = try JSONDecoder().decode(HotelData.self, from: data)
                completion(urlList)
            } catch let error {
                print(error)
            }
        }.resume()
    }

    func getDataRoom(completion: @escaping (RoomData?) -> () ) {
        guard let url = URL(string: roomUrl) else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            do {
                let urlList = try JSONDecoder().decode(RoomData.self, from: data)
                completion(urlList)
            } catch let error {
                print(error)
            }
        }.resume()
    }

//    func getDataReserve(completion: @escaping (RoomData?) -> () ) {
//        guard let url = URL(string: roomUrl) else {
//            completion(nil)
//            return
//        }
//
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            guard let data = data, error == nil else {
//                completion(nil)
//                return
//            }
//            do {
//                let urlList = try JSONDecoder().decode(RoomData.self, from: data)
//                completion(urlList)
//            } catch let error {
//                print(error)
//            }
//        }.resume()
//    }

}
