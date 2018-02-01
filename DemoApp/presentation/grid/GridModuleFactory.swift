import Foundation
import UIKit

class GridModuleFactory {
    
    static func buildModule() -> GridViewController {
        
        let gridView = GridView(frame: CGRect(), collectionViewLayout: UICollectionViewFlowLayout())

        let vc = GridViewController(gridView: gridView)
        
        let delegateDataSource = GridViewDelegateDataSource()
        gridView.delegate = delegateDataSource
        gridView.dataSource = delegateDataSource
        
        vc.view.addSubview(gridView)
        
        return vc
        
    }
    
}
