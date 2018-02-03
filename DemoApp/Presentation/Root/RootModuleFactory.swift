import Foundation
import UIKit

class RootModuleFactory {
 
    static func buildModule() -> RootViewController {
        
        let vc = RootViewController()
        let router = RootRouter(vc)
        let presenter = RootPresenter()
        let interactor = FetchOnboardingStatusInteractor()
        let dataSource = NSUserDefaultsDataSource()
        interactor.dataSource = dataSource
        
        presenter.interactor = interactor
        presenter.router = router
        vc.presenter = presenter
        
        return vc
        
    }

}
