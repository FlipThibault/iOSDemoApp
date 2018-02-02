import Foundation
import UIKit

class TabViewController : UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let listVC = ListModuleFactory.buildModule()
        let listTitle = NSLocalizedString("tab.title.list", comment: "")
        listVC.title = listTitle
        
        let gridVC = GridModuleFactory.buildModule()
        let gridTitle = NSLocalizedString("tab.title.grid", comment: "")
        gridVC.title = gridTitle
        
        listVC.tabBarItem = UITabBarItem(title: listTitle, image: UIImage(named: "list"), tag: 0)
        gridVC.tabBarItem = UITabBarItem(title: gridTitle, image: UIImage(named: "grid"), tag: 1)
        
        let controllers = [listVC, gridVC]
        self.viewControllers = controllers
        
        self.viewControllers = controllers.map {
            UINavigationController(rootViewController: $0)
        }
    }

}

extension TabViewController : UITabBarControllerDelegate {
    
}
