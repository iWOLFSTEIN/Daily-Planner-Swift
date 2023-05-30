//
//  UITableView.swift
//  Demo App 3
//
//  Created by BrainX Technologies on 30/05/2023.
//

import UIKit

extension UITableView {
    func dequeue<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        let identifier = T.reusableCellIdentifier
        let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        return cell as! T
    }
}
