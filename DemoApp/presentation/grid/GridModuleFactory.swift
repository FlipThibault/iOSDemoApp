import Foundation
import UIKit

class GridModuleFactory {
    
    static func buildModule() -> GridViewController {
        
        let vc = GridViewController()
                
        let gridView = GridView(frame: UIScreen.main.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        
        let delegateDataSource = GridViewDelegateDataSource()
        gridView.delegate = delegateDataSource
        gridView.dataSource = delegateDataSource
        
        vc.view.addSubview(gridView)
        
        return vc
        
    }
    
}
