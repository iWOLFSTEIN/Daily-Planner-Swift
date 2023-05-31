//
//  UIView.swift
//  Demo App 3
//
//  Created by BrainX Technologies on 30/05/2023.
//

import UIKit

extension UIView {
    func applyCornerRadius(cornerRadius: CGFloat, corners: UIRectCorner) {
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
    }
    
    func applyGradient(colors: [UIColor], startPoint: CGPoint, endPoint: CGPoint) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

extension BaseUIView {
    static var nibName: String {
        return String(describing: self)
    }
}
