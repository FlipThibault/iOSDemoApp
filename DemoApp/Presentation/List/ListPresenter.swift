import Foundation

class ListPresenter {
    
    var router: ListRouterInput

    init(with router: ListRouterInput) {
        self.router = router
    }
    
}

extension ListPresenter : ListViewOutput {
    
    func didClickCellAtIndex(indexPath: IndexPath) {
//        router.goToDetail(for: myArray[indexPath.row])
    }
    
}
