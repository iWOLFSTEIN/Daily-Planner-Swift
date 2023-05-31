//
//  BottomNavigationBar.swift
//  Demo App 3
//
//  Created by BrainX Technologies on 31/05/2023.
//

import UIKit

class BottomNavigationBar: UITabBar {
    @IBOutlet weak var plusButtonView: UIView!
    @IBOutlet weak var homeIconDotIndicator: UIView!
    @IBOutlet weak var profileIconDotIndicator: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        uiConfigurations()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        uiConfigurations()
    }
    
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
    
    func uiConfigurations() {
        self.applyCornerRadius(cornerRadius: 20.5, corners: [.topLeft, .topRight])
        
        homeIconDotIndicator.layer.cornerRadius = 3.5
        profileIconDotIndicator.layer.cornerRadius = 3.5
        
        plusButtonView.clipsToBounds = true
        plusButtonView.layer.cornerRadius = 21.835
        plusButtonView.layer.shadowColor = UIColor.black.cgColor
        plusButtonView.layer.shadowOpacity = 0.2
        plusButtonView.layer.shadowOffset = CGSize(width: 2, height: 2)
        plusButtonView.layer.shadowRadius = 4
        
        let startPoint = CGPoint(x: 0.5, y: 0)
        let endPoint = CGPoint(x: 0.5, y: 1)
        plusButtonView.applyGradient(colors: [.plusButtonGradientTop!, .plusButtonGradientBottom!], startPoint: startPoint, endPoint: endPoint)
        
        homeIconDotIndicator.isHidden = false
        profileIconDotIndicator.isHidden = true
    }
}
