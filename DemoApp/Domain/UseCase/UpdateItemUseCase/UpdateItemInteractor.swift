import Foundation

class UpdateItemInteractor: NSObject {
    
    var dataSource: ListItemDataSource
    
    init(with dataSource: ListItemDataSource) {
        self.dataSource = dataSource
    }
    
}

extension UpdateItemInteractor: UpdateItemUseCase {
    
    func updateItem(item: AppListItemModel, in list: AppListModel, with completion: @escaping (AppListItemModel, NSError?) -> Void) {
        
        if(!item.descriptionText.isEmpty) {
            //assume no error at first and just pass back the item
            //this is considered a business rule thats why its in the Use Case implementation
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
