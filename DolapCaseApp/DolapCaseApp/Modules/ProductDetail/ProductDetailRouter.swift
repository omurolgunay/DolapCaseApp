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

final class ProductDetailRouter: NSObject {

    weak var presenter: ProductDetailPresenterInterface?

    static func setupModule() -> ProductDetailViewController? {
        let storyBoard = StoryBoard.productDetail
        if let view = storyBoard.instantiateInitialViewController() as? ProductDetailViewController {
            let interactor = ProductDetailInteractor()
            let router = ProductDetailRouter()
            let presenter = ProductDetailPresenter(interactor: interactor, router: router, view: view)

            view.presenter = presenter
            router.presenter = presenter
            interactor.output = presenter
            
            return view
        }
        fatalError("ProductDetail module can not created.")
    }
    
    
}

extension ProductDetailRouter: ProductDetailRouterInterface {

}

