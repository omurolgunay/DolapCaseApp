//
//  CommentStats.swift
//  DolapCaseApp
//
//  Created by omur olgunay on 17.11.2019.
//  Copyright © 2019 omur olgunay. All rights reserved.
//

import Foundation

struct CommentStat: Decodable {
    var averageRating: Double
    var anonymousCommentsCount: Int
    var memberCommentsCount: Int
}
