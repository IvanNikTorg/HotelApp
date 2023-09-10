//
//  SuccessVCPresenter.swift
//  hotelRes
//
//  Created by user on 10.09.2023.
//

protocol FinalVCPresenterProtocol: AnyObject {
    func closeItApp()
    func getData()
}

final class SuccessVCPresenter: FinalVCPresenterProtocol {

    weak var output: SuccessVCPresenterOutput?
    
    func getData() {
        
    }

    func closeItApp() {
        output?.navigationController?.popToRootViewController(animated: true)
    }

}
