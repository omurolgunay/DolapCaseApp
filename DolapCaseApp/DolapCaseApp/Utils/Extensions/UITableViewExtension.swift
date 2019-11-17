//
//  UITableViewExtension.swift
//  DolapCaseApp
//
//  Created by omur olgunay on 17.11.2019.
//  Copyright © 2019 omur olgunay. All rights reserved.
//

import UIKit

extension UITableView {
    
    public func register(cellType: UITableViewCell.Type, bundle: Bundle? = nil) {
        register(cellType.getNib(), forCellReuseIdentifier: cellType.identifier)
    }
    
    public func dequeueReusableCell<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: type.className, for: indexPath) as? T else {
            fatalError()
        }
        return cell
    }

}
