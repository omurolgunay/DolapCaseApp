//
//  ProductDetailViewController.swift
//  CIViperGenerator
//
//  Created by omur olgunay on 15.11.2019.
//  Copyright © 2019 omur olgunay. All rights reserved.
//

import UIKit

protocol ProductDetailViewControllerInterface: BaseViewInterface {
    func loadProductDetailTableView()
    func loadProductSocialInfo()
}

extension ProductDetailViewController {
    private enum CellType: Int {
        case productImageCell = 0
        case productInfoCell = 1
    }
}

final class ProductDetailViewController: UIViewController {
    
    //MARK: Variables
    var presenter: ProductDetailPresenterInterface?
    
    //MARK: IBOutlets
    @IBOutlet weak var productDetailTableView: UITableView! {
        didSet {
            productDetailTableView.register(cellType: ProductDetailImageTableViewCell.self)
            productDetailTableView.register(cellType: ProductDetailInfoTableViewCell.self)
            productDetailTableView.tableFooterView = UIView()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        presenter?.viewDidAppear()
        showLoading()
    }
}

extension ProductDetailViewController: ProductDetailViewControllerInterface {
    
    func loadProductDetailTableView() {
        productDetailTableView.reloadData()
    }
    
    func loadProductSocialInfo() {
        productDetailTableView.reloadRows(at: [IndexPath(row: CellType.productInfoCell.rawValue, section: 0)], with: .none)
    }
    
}

extension ProductDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getNumberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case CellType.productImageCell.rawValue:
            let cell = tableView.dequeueReusableCell(with: ProductDetailImageTableViewCell.self, for: indexPath)
            if let url = presenter?.getProductImageUrl() {
                cell.configure(url: url) {
                    self.productDetailTableView.reloadRows(at: [IndexPath(row: CellType.productImageCell.rawValue, section: 0)], with: .none)
                    self.hideLoading()
                }                
            }
            return cell  
        case CellType.productInfoCell.rawValue:
            let cell = tableView.dequeueReusableCell(with: ProductDetailInfoTableViewCell.self, for: indexPath)
            if let product = presenter?.getProductData() {
                cell.configure(product: product)
            }
            if let socialData = presenter?.getProductSocialData() {
                cell.updateSocialData(socialData: socialData)
            }
            presenter?.reloadSocialDataWithTimer(cell.progressBar) //Trigger countDown to start
            return cell
        default:
            break
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return presenter?.getEstimatedHeightForRow() ?? 50
    }
}
