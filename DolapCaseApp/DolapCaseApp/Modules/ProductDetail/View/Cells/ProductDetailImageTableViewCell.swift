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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(url: URL) {
        productImageView.kf.setImage(with: url)
    }
}