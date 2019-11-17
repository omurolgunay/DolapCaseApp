//
//  UITableViewCellExtension.swift
//  DolapCaseApp
//
//  Created by omur olgunay on 17.11.2019.
//  Copyright © 2019 omur olgunay. All rights reserved.
//

import UIKit

extension UITableViewCell {
    class func getNib() -> UINib {
        return UINib(nibName: self.className, bundle: nil)
    }
    
    class var identifier: String {
        return self.className
    }
}

extension NSObject {
    @objc public var className: String {
        return type(of: self).className
    }
    
    @objc public static var className: String {
        return String(describing: self)
    }
}
