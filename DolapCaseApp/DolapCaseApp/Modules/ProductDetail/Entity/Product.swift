//
//  Product.swift
//  DolapCaseApp
//
//  Created by omur olgunay on 15.11.2019.
//  Copyright © 2019 omur olgunay. All rights reserved.
//

import Foundation

struct Product: Decodable {
    let id: Int
    let name: String
    let desc: String
    let image: String
    let price: Price
}
