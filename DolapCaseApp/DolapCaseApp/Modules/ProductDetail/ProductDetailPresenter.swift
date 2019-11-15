//
//  ProductDetailPresenter.swift
//  CIViperGenerator
//
//  Created by omur olgunay on 15.11.2019.
//  Copyright © 2019 omur olgunay. All rights reserved.
//

import Foundation

protocol ProductDetailPresenterInterface: class {

}

final class ProductDetailPresenter {

    private let router: ProductDetailRouterInterface
    private let interactor: ProductDetailInteractorInterface
    private weak var view: ProductDetailViewControllerInterface?

    init(interactor: ProductDetailInteractorInterface,
         router: ProductDetailRouterInterface,
         view: ProductDetailViewControllerInterface) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension ProductDetailPresenter: ProductDetailPresenterInterface {

}
