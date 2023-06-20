//
//  ActivityIndicator.swift
//  Demo App 3
//
//  Created by BrainX Technologies on 01/06/2023.
//

import UIKit

class ActivityIndicator {
    static let shared = ActivityIndicator()
    
    private var activityIndicatorView: UIView?
    
    func showActivityIndicator(on view: UIView, withAlpha alpha: CGFloat) {
        activityIndicatorView = UIView(frame: view.bounds)
        activityIndicatorView?.backgroundColor = UIColor(white: 1.0, alpha: alpha)
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = activityIndicatorView!.center
        activityIndicator.startAnimating()
        
        activityIndicatorView?.addSubview(activityIndicator)
        view.addSubview(activityIndicatorView!)
    }
    
    func hideActivityIndicator() {
        activityIndicatorView?.removeFromSuperview()
        activityIndicatorView = nil
    }
}

