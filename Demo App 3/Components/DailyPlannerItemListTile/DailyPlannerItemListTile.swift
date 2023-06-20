//
//  DailyPlannerItemListTile.swift
//  Demo App 3
//
//  Created by BrainX Technologies on 30/05/2023.
//

import UIKit

class DailyPlannerItemListTile: BaseUIView {
    
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var leadingIcon: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
}
