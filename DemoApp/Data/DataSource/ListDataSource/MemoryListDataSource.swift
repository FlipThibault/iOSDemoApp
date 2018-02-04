import Foundation

class MemoryListDataSource: NSObject {
    
}

extension MemoryListDataSource: ListDataSource {
    
    func getAll(with completion: ([AppListModel]) -> Void) {
        completion([fakeList])
    }
    
    func get(by identifier: String, with completion: (AppListModel) -> Void) {
        completion(fakeList)
    }
    
    func save(with item: AppListModel, with completion: (Bool) -> Void) {
        NSLog("Not implemented")
    }
    
    func delete(by identifier: String, with completion: (Bool) -> Void) {
        NSLog("Not implemented")
    }
    
}
