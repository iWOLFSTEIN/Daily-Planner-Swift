import Combine
import UIKit

class DailyPlannerViewController: UIViewController {
    
    @IBOutlet weak var contentView: DailyPlannerContentView!
    
    let viewModel: DailyPlannerViewModel = DailyPlannerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuote()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        contentView.setQuoteViewImage()
        contentView.setQuoteViewGradients()
    }
    
    func updateQuote() {
        DispatchQueue.main.async {
            ActivityIndicator.shared.showActivityIndicator(on: self.view, withAlpha: 1.0)
        }
        
        viewModel.$quoteAuthor.sink { [weak self]
            quoteAuthor in
            guard let quoteAuthor else {
                return
            }
            DispatchQueue.main.async {
                self?.contentView.quoteAuthor.text = quoteAuthor
            }
        }
        .store(in: &viewModel.cancellables)
        
        viewModel.$quoteText.sink { [weak self]
            quoteText in
            guard let quoteText else {
                return
            }
            DispatchQueue.main.async {
                self?.contentView.quoteText.text = quoteText
            }
        }
        .store(in: &viewModel.cancellables)
        
        DispatchQueue.main.async {
            ActivityIndicator.shared.hideActivityIndicator()
        }
    }
}
