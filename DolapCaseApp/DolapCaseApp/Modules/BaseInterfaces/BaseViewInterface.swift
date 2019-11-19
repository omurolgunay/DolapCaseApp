//
//  BaseInterface.swift
//  DolapCaseApp
//
//  Created by omur olgunay on 18.11.2019.
//  Copyright © 2019 omur olgunay. All rights reserved.
//

import UIKit

protocol BaseViewInterface: class {
    func showLoading()
    func hideLoading()
}

extension BaseViewInterface {
    func showLoading() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }

    func hideLoading() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}
