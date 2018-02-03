import Foundation
import UIKit

class GridModuleFactory {
    
    static func buildModule() -> GridViewController {
        
        let gridView = GridView(frame: CGRect(), collectionViewLayout: UICollectionViewFlowLayout())

        let vc = GridViewController(gridView: gridView)
        vc.view.addSubview(gridView)
        
        return vc
        
    }
    
}
