import Foundation
import UIKit

class ListModuleFactory {
    
    static func buildModule() -> ListViewController {
        
        let listView = ListView(frame: UIScreen.main.bounds, style: .plain)
        let vc = ListViewController(listView: listView, dataSourceDelegate: ListViewDelegateDataSource())
        
        listView.listViewDelegate = vc
        
        let presenter = ListPresenter()
        let router = ListRouter()
        
        return vc
    }
    
}


