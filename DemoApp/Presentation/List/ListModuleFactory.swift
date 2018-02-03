import Foundation
import UIKit

class ListModuleFactory {
    
    static func buildModule() -> ListViewController {
        
        let listView = ListView(frame: UIScreen.main.bounds, style: .plain)
        let vc = ListViewController(with: listView)
                
        let router = ListRouter(with: vc)
        let presenter = ListPresenter(with: router)
        
        vc.presenter = presenter
        
        return vc
    }
    
}


