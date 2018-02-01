import Foundation
import UIKit

class GridViewController : UIViewController {
    
    var gridView: GridView
    
    init(gridView: GridView) {
        self.gridView = gridView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(gridView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        self.gridView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            self.gridView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.gridView.bottomAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.bottomAnchor),
            self.gridView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.gridView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
            
        ])
        
    }
    
}
