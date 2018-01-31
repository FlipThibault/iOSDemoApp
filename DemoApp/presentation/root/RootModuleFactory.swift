import Foundation
import UIKit

class RootModuleFactory {
 
    static func buildModule() -> UIViewController {
        
        let vc = RootViewController()
        let router = RootRouter(vc)
        let presenter = RootPresenter()
        
        presenter.router = router
        vc.presenter = presenter
        
        return vc
        
    }

}
