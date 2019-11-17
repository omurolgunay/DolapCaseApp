//
//  DoubleExtension.swift
//  DolapCaseApp
//
//  Created by omur olgunay on 17.11.2019.
//  Copyright © 2019 omur olgunay. All rights reserved.
//

import Foundation

extension Double {
    func convertToPriceString(currency: String) -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        formatter.currencySymbol = "" // If we don't do that, currency symbol(₺) localized.
        if let price = formatter.string(from: self as NSNumber) {
            return price + " " + currency
        }
        return String(format: "%.2f ", self) + currency
    }
}
