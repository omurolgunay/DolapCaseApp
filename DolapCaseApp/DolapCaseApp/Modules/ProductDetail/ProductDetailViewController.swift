//
//  ProductDetailViewController.swift
//  CIViperGenerator
//
//  Created by omur olgunay on 15.11.2019.
//  Copyright © 2019 omur olgunay. All rights reserved.
//

import UIKit

protocol ProductDetailViewControllerInterface: class {

}

class ProductDetailViewController: UIViewController {
    var presenter: ProductDetailPresenterInterface?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        presenter?.viewDidAppear()
    }
}

extension ProductDetailViewController: ProductDetailViewControllerInterface {
    
}
