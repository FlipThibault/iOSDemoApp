import Foundation
import UIKit

class TabModuleFactory {
    
    static func buildModule() -> TabViewController {
        
        let tabVC = TabViewController()

        let listVC = ListModuleFactory.buildModule()
        let listTitle = NSLocalizedString("tab.title.list", comment: "")
        listVC.title = listTitle
        
        let gridVC = GridModuleFactory.buildModule()
        let gridTitle = NSLocalizedString("tab.title.grid", comment: "")
        gridVC.title = gridTitle
        
        listVC.tabBarItem = UITabBarItem(title: listTitle, image: UIImage(named: "list"), tag: 0)
        gridVC.tabBarItem = UITabBarItem(title: gridTitle, image: UIImage(named: "grid"), tag: 1)

        let controllers = [listVC, gridVC]
        tabVC.viewControllers = controllers
        
        tabVC.viewControllers = controllers.map {
            UINavigationController(rootViewController: $0)
        }
        
        return tabVC
    }
    
}

