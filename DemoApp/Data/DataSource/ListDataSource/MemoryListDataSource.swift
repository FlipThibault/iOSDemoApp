import Foundation

class MemoryListDataSource: NSObject {
    
    var newList: AppListModel //copy of fakeList
    
    override init() {
        self.newList = AppListModel(with: fakeList.name)
        newList.identifier = fakeList.identifier
        newList.items = []
        for (key, value) in fakeList.items.enumerated() {
            let item = AppListItemModel()
            item.identifier = value.identifier
            item.description = value.description
            item.dateCreated = value.dateCreated
            item.orderByDate = value.orderByDate
            newList.items.append(item)
        }
    }
    
}

extension MemoryListDataSource: ListDataSource {
    
    func getAll(with completion: @escaping ([AppListModel], NSError?) -> Void) {
        //fetch the fake data in data and make a copy
        completion([newList], nil)
    }
    
    func get(by identifier: String, with completion: @escaping (AppListModel, NSError?) -> Void) {
        completion(newList, nil)
    }
    
    func save(with item: AppListModel, with completion: @escaping (NSError?) -> Void) {
        NSLog("Not implemented")
    }
    
    func delete(by identifier: String, with completion: @escaping (NSError?) -> Void) {
        NSLog("Not implemented")
    }
    
}
