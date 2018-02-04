import Foundation

class SaveItemInteractor: NSObject {
    
    var dataSource: ListItemDataSource
    
    init(with dataSource: ListItemDataSource) {
        self.dataSource = dataSource
    }
    
}

extension SaveItemInteractor: SaveItemUseCase {
    
    func saveItem(item: AppListItemModel, to list: AppListModel, with completion: (Bool) -> Void) {

        dataSource.save(with: item) { (success) in
            completion(success)
        }
        
    }
    
}
