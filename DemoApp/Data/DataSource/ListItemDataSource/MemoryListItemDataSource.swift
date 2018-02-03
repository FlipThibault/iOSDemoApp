import Foundation

class MemoryListItemDataSource: NSObject {
    
    private let testList = AppListModel(with: "TestList")
    private var myArray = [AppListItemModel]()
    
    override init() {
        for index in 0...15 {
            let item = AppListItemModel(with: testList)
            item.description = String(index)
            myArray.append(item)
        }
    }

}

extension MemoryListItemDataSource: ListItemDataSource {
    
    func getAll(with completion: ([AppListItemModel]) -> Void) {
        completion(myArray)
    }
    
    func get(by identifier: String, with completion: (AppListItemModel) -> Void) {
        for item in myArray {
            if(item.identifier == identifier) {
                completion(item)
                break
            }
        }
    }
    
    func save(with item: AppListItemModel, with completion: (Bool) -> Void) {
        NSLog("Not implemented")
    }
    
    func delete(by identifier: String, with completion: (Bool) -> Void) {
        NSLog("Not implemented")
    }
    
}
