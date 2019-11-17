//
//  ProductInfoTableViewCell.swift
//  DolapCaseApp
//
//  Created by omur olgunay on 17.11.2019.
//  Copyright © 2019 omur olgunay. All rights reserved.
//

import UIKit
import Cosmos

class ProductDetailInfoTableViewCell: UITableViewCell {
    
    //MARK: IBOutlets
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var likeCountLabel: UILabel!
    
    @IBOutlet weak var ratingStarsView: CosmosView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(product: Product) {
        self.productNameLabel.text = product.name
        self.productDescriptionLabel.text = product.desc
        self.productPriceLabel.text = product.price.value.convertToPriceString(currency: product.price.currency)
    }
    
    func updateSocialData(socialData: ProductSocial) {
        let totalCommentCountString = String(socialData.commentCounts.anonymousCommentsCount + socialData.commentCounts.memberCommentsCount)
        self.likeCountLabel.text = String(socialData.likeCount)
        self.ratingStarsView.rating = socialData.commentCounts.averageRating
        self.ratingStarsView.text = "(\(totalCommentCountString) Yorum)"
    }
}
