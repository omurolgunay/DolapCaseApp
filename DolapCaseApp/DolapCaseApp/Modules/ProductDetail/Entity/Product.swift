//
//  Product.swift
//  DolapCaseApp
//
//  Created by omur olgunay on 15.11.2019.
//  Copyright © 2019 omur olgunay. All rights reserved.
//

import Foundation

struct Product: Decodable {
    var id: Int
    var name: String
    var desc: String
    var image: String
    var price: Price
}
