//
//  ProductDetailViewController.swift
//  CIViperGenerator
//
//  Created by omur olgunay on 15.11.2019.
//  Copyright © 2019 omur olgunay. All rights reserved.
//

import UIKit

protocol ProductDetailViewControllerInterface: class {
    func loadProductDetailTableView()
}

extension ProductDetailViewController {
    private enum CellType: Int {
        case productImageCell = 0
        case productInfoCell = 1
    }
}

class ProductDetailViewController: UIViewController {
    
    //MARK: Variables
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
    func loadProductDetailTableView() {
        productDetailTableView.reloadData()
    }
}

extension ProductDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case CellType.productImageCell.rawValue:
            let cell = tableView.dequeueReusableCell(with: ProductDetailImageTableViewCell.self, for: indexPath)
            if let url = presenter?.getProductImageUrl() {
                cell.configure(url: url)
            }
            return cell
        default:
            break
        }
        return UITableViewCell()
    }
    
}
