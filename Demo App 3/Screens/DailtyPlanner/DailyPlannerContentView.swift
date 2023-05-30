import UIKit

class DailyPlannerContentView: UIView {
    
    @IBOutlet weak var quoteView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        quoteView.clipsToBounds = true
        quoteView.layer.cornerRadius = 12
        
        let colors = ["quoteViewGradientLeft", "quoteViewGradientRight"]
        let startPoint = CGPoint(x: 0.0, y: 0.5)
        let endPoint = CGPoint(x: 1.0, y: 0.5)
        
        DispatchQueue.main.async {
            self.quoteView.applyGradient(colors: colors, startPoint: startPoint, endPoint: endPoint)
        }
    }
}
