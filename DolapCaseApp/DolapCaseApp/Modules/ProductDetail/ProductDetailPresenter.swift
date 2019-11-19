//
//  ProductDetailPresenter.swift
//  CIViperGenerator
//
//  Created by omur olgunay on 15.11.2019.
//  Copyright © 2019 omur olgunay. All rights reserved.
//

import Foundation
import UICircularProgressRing

protocol ProductDetailPresenterInterface: class {
    //MARK: View -> Presenter
    func viewDidAppear()
    func getProductData() -> Product?
    func getProductSocialData() -> ProductSocial?
    func reloadSocialDataWithTimer(_ progressBar: UICircularTimerRing)
    
    //MARK: TableView -> Presenter
    func getNumberOfRows() -> Int
    func getProductImageUrl() -> URL?
    func getEstimatedHeightForRow() -> CGFloat
}

extension ProductDetailPresenter {
    private enum Constant {
        enum Logic {
            //CountDown to reload social data
            static let countDownNumber: TimeInterval = 60
        }
        enum TableView {
            //Image + Info Cell
            static let numberOfRowsInSection: Int = 2
            static let estimatedHeightForRow: CGFloat = 300
        }
    }
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
        view?.showLoading()
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
    
    func reloadSocialDataWithTimer(_ progressBar: UICircularTimerRing) {
        progressBar.startTimer(to: Constant.Logic.countDownNumber) { (state) in
            switch state {
            case .finished:
                self.interactor.fetchProductSocial()
            default: break
            }
        }
    }
    
    func getNumberOfRows() -> Int {
        return Constant.TableView.numberOfRowsInSection
    }
    
    func getEstimatedHeightForRow() -> CGFloat {
        return Constant.TableView.estimatedHeightForRow
    }

}

extension ProductDetailPresenter: ProductDetailInteractorInterfaceOutput {
 
    func handleProductDetailResult(result: ProductDetailResutl) {
        switch result {
        case .success(let productDataResult):
            self.productDataResponse = productDataResult
            view?.loadProductDetailTableView()
            break
        case .failure(let error):
            print(error.localizedDescription)
            break
        }
    }
    
    func handleProductSocialResult(result: ProductSocialResult) {
        switch result {
        case .success(let productSocialResult):
            self.productSocialResponse = productSocialResult
            view?.loadProductSocialInfo()
            break
        case .failure(let error):
            print(error.localizedDescription)
            break
        }
    }
    
    func fetchDataProccess(isLoading: Bool) {
        isLoading ? view?.showLoading() : view?.hideLoading()
    }
    
}
