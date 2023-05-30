import UIKit

class DailyPlannerViewController: UIViewController {
    
    @IBOutlet weak var contentView: DailyPlannerContentView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        contentView.setQuoteViewImage()
        contentView.setQuoteViewGradients()
        
    }
}
