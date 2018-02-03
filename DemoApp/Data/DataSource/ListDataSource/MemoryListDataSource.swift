import Foundation

class MemoryListDataSource: NSObject {
    
    private let testList = AppListModel(with: "TestList")
    private var myArray = [AppListModel]()

    override init() {
        for index in 0...15 {
            let item = AppListItemModel(with: testList)
            item.description = String(index)
            testList.items.append(item)
        }
        
        myArray.append(testList)
    }
    
}

extension MemoryListDataSource: ListDataSource {
    
    func getAll(with completion: ([AppListModel]) -> Void) {
        completion(myArray)
    }
    
    func get(by identifier: String, with completion: (AppListModel) -> Void) {
        for list in myArray {
            if(list.identifier == identifier) {
                completion(list)
                break
            }
        }
    }
    
    func save(with item: AppListModel, with completion: (Bool) -> Void) {
        NSLog("Not implemented")
    }
    
    func delete(by identifier: String, with completion: (Bool) -> Void) {
        NSLog("Not implemented")
    }
    
}
