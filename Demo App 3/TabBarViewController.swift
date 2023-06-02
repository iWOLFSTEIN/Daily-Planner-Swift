//
//  TabBarViewController.swift
//  Demo App 3
//
//  Created by BrainX Technologies on 31/05/2023.
//

import UIKit

class TabBarViewController: UIViewController {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var bottomNavigationBar: BottomNavigationBar!
    var dailyPlannerViewController: DailyPlannerViewController!
    var addViewController: AddViewController!
    var profileViewController: ProfileViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.backgroundColor = .green
        
        dailyPlannerViewController = DailyPlannerViewController.instantiate(from: .main)
        addViewController = AddViewController.instantiate(from: .main)
        profileViewController = ProfileViewController.instantiate(from: .main)
        
        contentView.addSubview(dailyPlannerViewController.view)
        dailyPlannerViewController.view.frame = contentView.bounds
        addChild(dailyPlannerViewController)
        
        bottomNavigationBar.addTapGestureToView(bottomNavigationBar.plusButtonView, identifier: "plusButtonView", target: self, action: #selector(goToAddScreen(_:)))
        bottomNavigationBar.addTapGestureToView(bottomNavigationBar.homeIconView, identifier: "homeIconView", target: self, action: #selector(goToHomeScreen(_:)))
        bottomNavigationBar.addTapGestureToView(bottomNavigationBar.profileIconView, identifier: "profileIconView", target: self, action: #selector(goToProfileScreen(_:)))
    }
    
    @objc func goToHomeScreen(_ sender: UITapGestureRecognizer) {
        let transitionOptions: UIView.AnimationOptions = [.transitionCrossDissolve, .curveEaseInOut]
        let duration: TimeInterval = 0.3
        
        UIView.transition(with: contentView, duration: duration, options: transitionOptions, animations: {
            self.contentView.addSubview(self.dailyPlannerViewController.view)
            self.dailyPlannerViewController.view.frame = self.contentView.bounds
            self.addChild(self.dailyPlannerViewController)
            self.dotIndicatorsVisibility(ofHome: false)
        }, completion: nil)
    }

    @objc func goToProfileScreen(_ sender: UITapGestureRecognizer) {
        let transitionOptions: UIView.AnimationOptions = [.transitionCrossDissolve, .curveEaseInOut]
        let duration: TimeInterval = 0.3
        
        UIView.transition(with: contentView, duration: duration, options: transitionOptions, animations: {
            self.contentView.addSubview(self.profileViewController.view)
            self.profileViewController.view.frame = self.contentView.bounds
            self.addChild(self.profileViewController)
            self.dotIndicatorsVisibility(ofProfile: false)
        }, completion: nil)
    }

    @objc func goToAddScreen(_ sender: UITapGestureRecognizer) {
        let transitionOptions: UIView.AnimationOptions = [.transitionCrossDissolve, .curveEaseInOut]
        let duration: TimeInterval = 0.3
        
        UIView.transition(with: contentView, duration: duration, options: transitionOptions, animations: {
            self.contentView.addSubview(self.addViewController.view)
            self.addViewController.view.frame = self.contentView.bounds
            self.addChild(self.addViewController)
            self.dotIndicatorsVisibility()
        }, completion: nil)
    }
    
    func dotIndicatorsVisibility(ofHome homeDotHidden: Bool = true, ofProfile profileDotHidden: Bool = true) {
        bottomNavigationBar.homeIconDotIndicator.isHidden = homeDotHidden
        bottomNavigationBar.profileIconDotIndicator.isHidden = profileDotHidden
    }
}
