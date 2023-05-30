//
//  UITableViewCell.swift
//  Demo App 3
//
//  Created by BrainX Technologies on 30/05/2023.
//

import UIKit

extension UITableViewCell {
    static var nibName: String {
        return String(describing: self)
    }
    static var reusableCellIdentifier: String {
        return String(describing: self)
    }
}
