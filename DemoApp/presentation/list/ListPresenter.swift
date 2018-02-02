import Foundation

class ListPresenter {
    
    var router: ListRouterInput
    private let myArray: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15"]

    init(with router: ListRouterInput) {
        self.router = router
    }
    
}

extension ListPresenter : ListViewOutput {
    
    func didClickCellAtIndex(indexPath: IndexPath) {
        router.goToDetail(for: myArray[indexPath.row])
    }
    
}
