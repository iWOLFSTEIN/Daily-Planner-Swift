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
        contentView.addSubview(dailyPlannerViewController.view)
        dailyPlannerViewController.view.frame = contentView.bounds
        addChild(dailyPlannerViewController)
    }
    
    @objc func goToProfileScreen(_ sender: UITapGestureRecognizer) {
        contentView.addSubview(profileViewController.view)
        profileViewController.view.frame = contentView.bounds
        addChild(profileViewController)
    }
    
    @objc func goToAddScreen(_ sender: UITapGestureRecognizer) {
        contentView.addSubview(addViewController.view)
        addViewController.view.frame = contentView.bounds
        addChild(addViewController)
    }
}
