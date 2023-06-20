//
//  BaseUIView.swift
//  Demo App 3
//
//  Created by BrainX Technologies on 31/05/2023.
//

import UIKit

class BaseUIView: UIView {
    func commonInit() {
        let nib = UINib(nibName: String(describing: Self.self), bundle: nil)
        guard let contentView = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("Could not load BasicTaskTile from nib")
        }
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
