import Foundation

class SaveItemInteractor: NSObject {
    
    var dataSource: ListItemDataSource
    
    init(with dataSource: ListItemDataSource) {
        self.dataSource = dataSource
    }
    
}

extension SaveItemInteractor: SaveItemUseCase {
    
    func saveItem(item: AppListItemModel, to list: AppListModel, with completion: (AppListModel, NSError?) -> Void) {

        list.items.insert(item, at: 0)
        
        dataSource.save(with: item) { (success) in
            if(success) {
                completion(list, nil)
            } else {
                completion(list, NSError(with: Constants.ErrorMessages.dataSourceSaveError))
            }
        }
        
    }
    
}
