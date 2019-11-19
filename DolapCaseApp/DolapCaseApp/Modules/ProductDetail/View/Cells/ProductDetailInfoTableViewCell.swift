//
//  ProductInfoTableViewCell.swift
//  DolapCaseApp
//
//  Created by omur olgunay on 17.11.2019.
//  Copyright © 2019 omur olgunay. All rights reserved.
//

import UIKit
import Cosmos
import UICircularProgressRing

class ProductDetailInfoTableViewCell: UITableViewCell {
    
    
    //MARK: IBOutlets
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var ratingStarsView: CosmosView!
    @IBOutlet weak var avarageRatinLabel: UILabel!
    
    @IBOutlet weak var progressBar: UICircularTimerRing!{
        didSet{
            progressBar.valueFormatter = UICircularProgressRingFormatter(valueIndicator: "", rightToLeft: false, showFloatingPoint: false, decimalPlaces: 0)
            progressBar.font = UIFont.systemFont(ofSize: 14)
            progressBar.outerRingColor = #colorLiteral(red: 0.968627451, green: 0.7529411765, blue: 0.2117647059, alpha: 1)
            progressBar.innerRingColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            progressBar.innerRingWidth = 3
            progressBar.outerRingWidth = 3
            progressBar.fontColor = #colorLiteral(red: 0.968627451, green: 0.7529411765, blue: 0.2117647059, alpha: 0.8066138699)
            progressBar.startAngle = 270
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(product: Product) {
        self.productNameLabel.text = product.name
        self.productDescriptionLabel.text = product.desc
        self.productPriceLabel.text = product.price.value.convertToPriceStringWithCurrency(product.price.currency)
    }
    
    func updateSocialData(socialData: ProductSocial) {
        let totalCommentCountString = String(socialData.commentCounts.anonymousCommentsCount + socialData.commentCounts.memberCommentsCount)
        self.likeCountLabel.text = String(socialData.likeCount)
        self.ratingStarsView.rating = socialData.commentCounts.averageRating
        self.ratingStarsView.text = "(\(totalCommentCountString) Yorum)"
        self.avarageRatinLabel.text = String(socialData.commentCounts.averageRating)
    }
}
