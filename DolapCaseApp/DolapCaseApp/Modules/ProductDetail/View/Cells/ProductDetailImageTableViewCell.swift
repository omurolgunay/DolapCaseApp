//
//  ProductDetailImageTableViewCell.swift
//  DolapCaseApp
//
//  Created by omur olgunay on 17.11.2019.
//  Copyright © 2019 omur olgunay. All rights reserved.
//

import UIKit
import Kingfisher

class ProductDetailImageTableViewCell: UITableViewCell {
    //MARK: IBOutlets
    @IBOutlet weak var productImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(url: URL, complation: @escaping () -> Void ) {
        productImageView.kf.setImage(with: url, placeholder: nil, options: nil, progressBlock: nil) { (result) in
            switch result{
            case .success(_):
                complation()
            default: break
            }
        }
    }
}
