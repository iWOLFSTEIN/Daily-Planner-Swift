import Combine
import UIKit

class DailyPlannerViewController: UIViewController {
    
    @IBOutlet weak var contentView: DailyPlannerContentView!
    
    let viewModel: DailyPlannerViewModel = DailyPlannerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTaskCount()
        updateQuote()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        contentView.setQuoteViewImage()
        contentView.setQuoteViewGradients()
    }
    
    func updateQuote() {
        ActivityIndicator.shared.showActivityIndicator(on: self.view, withAlpha: 1.0)
        
        viewModel.$quoteAuthor.sink { [weak self] quoteAuthor in
            guard let quoteAuthor = quoteAuthor else { return }
            DispatchQueue.main.async {
                self?.contentView.quoteAuthor.text = quoteAuthor
            }
        }.store(in: &viewModel.cancellables)
        
        viewModel.$quoteText.sink { [weak self] quoteText in
            guard let quoteText = quoteText else { return }
            DispatchQueue.main.async {
                self?.contentView.quoteText.text = quoteText
            }
        }.store(in: &viewModel.cancellables)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            ActivityIndicator.shared.hideActivityIndicator()
        }
    }
    
    func updateTaskCount() {
        viewModel.$tasksCountDictionaryList.sink { [weak self] taskCountList in
            for (index, taskDictionary) in taskCountList.enumerated() {
                DispatchQueue.main.async {
                    let dailyPlannerListTile = self?.contentView.dailyPlannerListTiles[index]
                    dailyPlannerListTile!.taskLabel.text = "\(taskDictionary["taskCount"]!)/\(taskDictionary["totalTaskCount"]!) task"
                }
            }
        }
        .store(in: &viewModel.cancellables)
    }
}
