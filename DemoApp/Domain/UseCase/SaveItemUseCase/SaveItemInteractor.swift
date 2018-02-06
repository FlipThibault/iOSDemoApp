import Foundation

class SaveItemInteractor: NSObject {
    
    var dataSource: ListItemDataSource
    
    init(with dataSource: ListItemDataSource) {
        self.dataSource = dataSource
    }
    
}

extension SaveItemInteractor: SaveItemUseCase {
    
    func saveItem(with description: String, to list: AppListModel, with completion: @escaping (AppListItemModel, NSError?) -> Void) {
        
        let item = AppListItemModel()
        item.descriptionText = description
        
        if(!item.descriptionText.isEmpty) {
            
            list.items.insert(item, at: 0)
            
            completion(item, nil)
            
            dataSource.save(with: item) { (error) in
                if(error != nil) {
                    completion(item, NSError(with: Constants.ErrorMessages.dataSourceSaveError))
                }
            }
        } else {
            //this error message shouldn't be empty. Just for demo purposes
            completion(item, NSError(with: ""))
        }
        
    }
    
    func saveItem(item: AppListItemModel, to list: AppListModel, with completion: @escaping (AppListItemModel, NSError?) -> Void) {

        if(!item.descriptionText.isEmpty) {
            list.items.insert(item, at: 0)
            
            completion(item, nil)
            
            dataSource.save(with: item) { (error) in
                if(error != nil) {
                    completion(item, NSError(with: Constants.ErrorMessages.dataSourceSaveError))
                }
            }
        } else {
            //this error message shouldn't be empty. Just for demo purposes
            completion(item, NSError(with: ""))
        }
        
    }
    
}
