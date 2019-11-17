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
    func getProductSocialData() -> ProductSocial?
    func getProductImageUrl() -> URL?
}

final class ProductDetailPresenter {

    private let router: ProductDetailRouterInterface
    private let interactor: ProductDetailInteractorInterface
    private weak var view: ProductDetailViewControllerInterface?
    
    var productDataResponse: Product?
    var productSocialResponse: ProductSocial?

    init(interactor: ProductDetailInteractorInterface,
         router: ProductDetailRouterInterface,
         view: ProductDetailViewControllerInterface) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.productDataResponse = nil
        self.productSocialResponse = nil
    }
}

extension ProductDetailPresenter: ProductDetailPresenterInterface {
    
    func viewDidAppear() {
        interactor.fetchProductDetail()
        interactor.fetchProductSocial()
    }
    
    func getProductData() -> Product? {
       return productDataResponse
    }
    
    func getProductSocialData() -> ProductSocial? {
        return productSocialResponse
    }
    
    func getProductImageUrl() -> URL? {
        guard let stringUrl = productDataResponse?.image else { return nil}
        let url = URL(string: stringUrl)
        return url
    }

}

extension ProductDetailPresenter: ProductDetailInteractorInterfaceOutput {
 
    func handleProductDetailResult(result: ProductDetailResutl) {
        switch result {
        case .success(let productDataResult):
            self.productDataResponse = productDataResult
            view?.loadProductDetailTableView()
            break
        case .failure(_):
            break
        }
    }
    
    func handleProductSocialResult(result: ProductSocialResult) {
        switch result {
        case .success(let productSocialResult):
            self.productSocialResponse = productSocialResult
            view?.loadProductSocialInfo()
            break
        case .failure(_):
            break
        }
    }
}
