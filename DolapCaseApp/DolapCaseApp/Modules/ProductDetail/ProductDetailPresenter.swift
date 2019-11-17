//
//  ProductDetailPresenter.swift
//  CIViperGenerator
//
//  Created by omur olgunay on 15.11.2019.
//  Copyright © 2019 omur olgunay. All rights reserved.
//

import Foundation

protocol ProductDetailPresenterInterface: class {
    //MARK: View -> Presenter
    func viewDidAppear()
    func getProductData() -> Product?
}

final class ProductDetailPresenter {

    private let router: ProductDetailRouterInterface
    private let interactor: ProductDetailInteractorInterface
    private weak var view: ProductDetailViewControllerInterface?
    
    var productDataResponse: Product?

    init(interactor: ProductDetailInteractorInterface,
         router: ProductDetailRouterInterface,
         view: ProductDetailViewControllerInterface) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.productDataResponse = nil
    }
}

extension ProductDetailPresenter: ProductDetailPresenterInterface {
    
    func viewDidAppear() {
        interactor.fetchProductDetail()
    }
    
    func getProductData() -> Product? {
       return productDataResponse
    }

}

extension ProductDetailPresenter: ProductDetailInteractorInterfaceOutput {
    
    func handleProductDetailResult(result: ProductDetailResutl) {
        switch result {
        case .success(let productDataResult):
            self.productDataResponse = productDataResult
            break
        case .failure(_):
            break
        }
    }
    
}
