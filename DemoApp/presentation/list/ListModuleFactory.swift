import Foundation

class ListModuleFactory {
    
    static func buildModule() -> ListViewController {
        
        let listView = ListView()
        let vc = ListViewController(listView: listView)
        vc.listView = listView
        
        let listViewDelegateDataSource = ListViewDelegateDataSource()
        
        listView.listViewDelegate = vc
        listView.delegate = listViewDelegateDataSource
        listView.dataSource = listViewDelegateDataSource
        
        let presenter = ListPresenter()
        let router = ListRouter()
        
        return vc
    }
    
}


