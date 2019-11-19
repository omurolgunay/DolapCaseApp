//
//  CommentStats.swift
//  DolapCaseApp
//
//  Created by omur olgunay on 17.11.2019.
//  Copyright © 2019 omur olgunay. All rights reserved.
//

import Foundation

struct CommentStat: Decodable {
    let averageRating: Double
    let anonymousCommentsCount: Int
    let memberCommentsCount: Int
}
