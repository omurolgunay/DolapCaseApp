//
//  ProductDetailInteractor.swift
//  CIViperGenerator
//
//  Created by omur olgunay on 15.11.2019.
//  Copyright © 2019 omur olgunay. All rights reserved.
//

import Foundation

protocol ProductDetailInteractorInterface {
    func fetchProductDetail()
    func fetchProductSocial()
}

protocol ProductDetailInteractorInterfaceOutput: class {
    func handleProductDetailResult(result: ProductDetailResutl)
    func handleProductSocialResult(result: ProductSocialResult)
}

typealias ProductDetailResutl = Result<Product,Error>
typealias ProductSocialResult = Result<ProductSocial,Error>

class ProductDetailInteractor {
    weak var output: ProductDetailInteractorInterfaceOutput?
}

extension ProductDetailInteractor: ProductDetailInteractorInterface {
    func fetchProductDetail() {
        guard let path = Bundle.main.path(forResource: "ProductData", ofType: "json") else { return }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
            let decoder = JSONDecoder()
            let result = try decoder.decode(Product.self, from: data)
            self.output?.handleProductDetailResult(result: .success(result))
        } catch {
            return
        }
    }
    
    func fetchProductSocial() {
        guard let path = Bundle.main.path(forResource: "SocialData", ofType: "json") else { return }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
            let decoder = JSONDecoder()
            let result = try decoder.decode(ProductSocial.self, from: data)
            self.output?.handleProductSocialResult(result: .success(result))
        } catch {
            return
        }
    }
}
