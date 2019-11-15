//
//  ProductDetailInteractor.swift
//  CIViperGenerator
//
//  Created by omur olgunay on 15.11.2019.
//  Copyright © 2019 omur olgunay. All rights reserved.
//

import Foundation

protocol ProductDetailInteractorInterface: class {

}

class ProductDetailInteractor {
    weak var presenter: ProductDetailPresenterInterface?
}

extension ProductDetailInteractor: ProductDetailInteractorInterface {

}
