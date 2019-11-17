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
    
    //MARK: IBOutlets
    
    @IBOutlet weak var productDetailTableView: UITableView! {
        didSet {
            productDetailTableView.register(cellType: ProductDetailImageTableViewCell.self)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        presenter?.viewDidAppear()
    }
}

extension ProductDetailViewController: ProductDetailViewControllerInterface {
    
}

extension ProductDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(with: ProductDetailImageTableViewCell.self, for: indexPath)
        return cell
    }
    
}
