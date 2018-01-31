import Foundation
import UIKit

class MainModuleFactory {
    
    static func buildModule() -> MainViewController {
        
        let tabVC = MainViewController()
        
        let listVC = ListModuleFactory.buildModule()
        listVC.title = "List"
        
        let gridVC = GridModuleFactory.buildModule()
        gridVC.title = "Grid"

        listVC.tabBarItem = UITabBarItem(title: "List", image: UIImage(named: "list"), tag: 0)
        gridVC.tabBarItem = UITabBarItem(title: "Grid", image: UIImage(named: "grid"), tag: 1)

        let controllers = [listVC, gridVC]
        tabVC.viewControllers = controllers
        
        tabVC.viewControllers = controllers.map {
            UINavigationController(rootViewController: $0)
        }
        
        return tabVC
    }
    
}

