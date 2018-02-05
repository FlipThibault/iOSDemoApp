import Foundation

class MemoryListItemDataSource: NSObject {
    
}

extension MemoryListItemDataSource: ListItemDataSource {

    func get(by identifier: String, with completion: @escaping (AppListItemModel, NSError?) -> Void) {
        for item in fakeList.items {
            if(item.identifier == identifier) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { //simulate and async call
                    completion(item, nil)
                }
                break
            }
        }
    }

    func save(with item: AppListItemModel, with completion: @escaping (NSError?) -> Void) {
        fakeList.items.append(item)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { //simulate and async call
            completion(nil)
        }
    }

    func delete(by identifier: String, with completion: @escaping (NSError?) -> Void) {
        for (index, value) in fakeList.items.enumerated() {
            if( value.identifier == identifier) {
                fakeList.items.remove(at: index)
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { //simulate and async call
                    completion(nil)
                }
                break
            }
        }
    }

}

