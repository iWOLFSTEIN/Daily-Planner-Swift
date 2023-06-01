import UIKit

class DailyPlannerContentView: UIView {
    
    @IBOutlet weak var quoteView: UIView!
    @IBOutlet weak var itemsListView: UIView!
    @IBOutlet weak var quoteViewImage: UIImageView!
    
    @IBOutlet weak var quoteAuthor: UILabel!
    @IBOutlet weak var quoteText: UILabel!
    @IBOutlet var dailyPlannerListTiles: [DailyPlannerItemListTile]!
    
    let dailyPlannerListTilesIcons = ["icn_surfing", "Path 22560", "Group 163622", "maybe later", "Component 131 – 1", "add notes"]
    let dailyPlannerListTilesTitles = ["Health", "Gratitude", "Get It Done", "Maybe Later", "Best Part Of My Day", "My Notes"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        quoteView.clipsToBounds = true
        quoteView.layer.cornerRadius = 12
        
        itemsListView.layer.cornerRadius = 12
        
        let firstTileIndex = 0
        let lastTileIndex = dailyPlannerListTiles.count - 1
        
        for (index, dailyPlannerListTile) in dailyPlannerListTiles.enumerated() {
            dailyPlannerListTile.leadingIcon.image = UIImage(named: dailyPlannerListTilesIcons[index])
            dailyPlannerListTile.title.text = dailyPlannerListTilesTitles[index]
            
            switch index {
            case firstTileIndex:
                dailyPlannerListTile.applyCornerRadius(cornerRadius: 12, corners: [.topLeft, .topRight])
            case lastTileIndex:
                dailyPlannerListTile.applyCornerRadius(cornerRadius: 12, corners: [.bottomLeft, .bottomRight])
            default:
                break
            }
        }
    }
    
    func setQuoteViewGradients() {
        let startPoint = CGPoint(x: 0.0, y: 0.5)
        let endPoint = CGPoint(x: 1.0, y: 0.5)
        self.quoteView.applyGradient(colors: [.quoteGradientLeft!, .quoteGradientRight!], startPoint: startPoint, endPoint: endPoint)
    }
    
    func setQuoteViewImage() {
        quoteViewImage.image = UIImage(named: "Mask Group 35")
    }
}
