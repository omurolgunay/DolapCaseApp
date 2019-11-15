//
//  ProductDetailRouter.swift
//  CIViperGenerator
//
//  Created by omur olgunay on 15.11.2019.
//  Copyright © 2019 omur olgunay. All rights reserved.
//

import Foundation
import UIKit

protocol ProductDetailRouterInterface: class {

}

class ProductDetailRouter: NSObject {

    weak var presenter: ProductDetailPresenterInterface?

    static func setupModule() -> ProductDetailViewController {
        let vc = ProductDetailViewController()
        let interactor = ProductDetailInteractor()
        let router = ProductDetailRouter()
        let presenter = ProductDetailPresenter(interactor: interactor, router: router, view: vc)

        vc.presenter = presenter
        router.presenter = presenter
        interactor.presenter = presenter
        return vc
    }
}

extension ProductDetailRouter: ProductDetailRouterInterface {

}

