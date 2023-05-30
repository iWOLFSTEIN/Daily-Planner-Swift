import UIKit

class DailyPlannerContentView: UIView {
    
    @IBOutlet weak var quoteView: UIView!
    @IBOutlet weak var itemsListView: UIView!
    @IBOutlet weak var quoteViewImage: UIImageView!
        
    @IBOutlet weak var tiles: DailyPlannerItemListTile!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        quoteView.clipsToBounds = true
        quoteView.layer.cornerRadius = 12
        
        itemsListView.layer.cornerRadius = 12
 
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
