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

class NetworkService {

    static let shared = NetworkService()
    private init() {}

    private let startUrl = "https://run.mocky.io/v3/35e0d18e-2521-4f1b-a575-f0fe366f66e3"

    private func getDataHotel(completion: @escaping (HotelData?) -> () ) {
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
}
