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
    func fetchDataProccess(isLoading: Bool)
}

typealias ProductDetailResutl = Result<Product,Error>
typealias ProductSocialResult = Result<ProductSocial,Error>

final class ProductDetailInteractor {
    weak var output: ProductDetailInteractorInterfaceOutput?
}

extension ProductDetailInteractor: ProductDetailInteractorInterface {
    
    func fetchProductDetail() {
        guard let path = Bundle.main.path(forResource: "ProductData", ofType: "json") else { return }
        let result = decodeJSON(with: Product.self, path: path)
        self.output?.handleProductDetailResult(result: result)
    }
    
    func fetchProductSocial() {
        guard let path = Bundle.main.path(forResource: "SocialData", ofType: "json") else { return }
        let result = decodeJSON(with: ProductSocial.self, path: path)
        self.output?.handleProductSocialResult(result: result)
    }
    
    func decodeJSON <T: Decodable>(with type: T.Type, path: String) -> Result<T, Error> {
        self.output?.fetchDataProccess(isLoading: true)
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
            let decoder = JSONDecoder()
            let result = try decoder.decode(type.self, from: data)
            self.output?.fetchDataProccess(isLoading: false)
            return .success(result)
        } catch let error {
            self.output?.fetchDataProccess(isLoading: false)
            return .failure(error)
        }
    }
    
}
