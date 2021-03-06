import Foundation
import UIKit

class DetailViewController : UIViewController {
    
    var presenter : DetailViewOutput?
    var detailView : DetailView
    
    init(with view: DetailView) {
        self.detailView = view
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(Constants.ErrorMessages.notImplementedInitWithCoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.detailView)
        
        self.detailView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.detailView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.detailView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.detailView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.detailView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
        
        self.presenter?.isLoaded()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.presenter?.isDismissing()
    }
    
    @objc private func textChanged(_ sender: UITextField) {
        presenter?.updateText(text: sender.text ?? "")
    }
}

extension DetailViewController : DetailViewInput {
    
    func displayData(itemViewModel: DetailViewModel) {
        self.detailView.textField.text = itemViewModel.getText()
        self.detailView.textField.addTarget(self, action: #selector(textChanged(_:)), for: .editingChanged)
    }
    
}
