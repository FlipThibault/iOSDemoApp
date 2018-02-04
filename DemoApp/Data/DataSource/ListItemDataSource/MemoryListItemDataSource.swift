import Foundation

class MemoryListItemDataSource: NSObject {
    
}

extension MemoryListItemDataSource: ListItemDataSource {
    
    func getAll(with completion: ([AppListItemModel]) -> Void) {
        completion(fakeList.items)
    }
    
    func get(by identifier: String, with completion: (AppListItemModel) -> Void) {
        for item in fakeList.items {
            if(item.identifier == identifier) {
                completion(item)
                break
            }
        }
    }
    
    func save(with item: AppListItemModel, with completion: (Bool) -> Void) {
        fakeList.items.append(item)
        completion(true)
    }
    
    func delete(by identifier: String, with completion: (Bool) -> Void) {
        for (index, value) in fakeList.items.enumerated() {
            if( value.identifier == identifier) {
                fakeList.items.remove(at: index)
                completion(true)
                break
            }
        }
    }
    
}
