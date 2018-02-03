import Foundation
import UIKit

class GridViewController : UIViewController {
    
    private let myArray: NSArray = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15"]
    
    var gridView: GridView
    
    init(gridView: GridView) {
        self.gridView = gridView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(Constants.ErrorMessages.notImplementedInitWithCoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupConstraints()
    }
    
    private func setupCollectionView() {
        self.gridView.delegate = self
        self.gridView.dataSource = self
        self.view.addSubview(gridView)
        
        self.gridView.register(GridCellView.self, forCellWithReuseIdentifier: Constants.CollectionViewCellIdentifier.CollectionCellView)
    }
    
    private func setupConstraints() {
        
        self.gridView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            self.gridView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.gridView.bottomAnchor.constraint(equalTo:self.view.bottomAnchor),
            self.gridView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.gridView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
            
        ])
        
    }
    
}

extension GridViewController : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CollectionViewCellIdentifier.CollectionCellView, for: indexPath) as? GridCellView else {
            fatalError(Constants.ErrorMessages.cellTypeNotRegistered)
        }
        
        cell.titleLabel.text = "\(myArray[indexPath.row])"

        return cell
    }
    
}

extension GridViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}
