import Foundation

protocol ListItemDataSource {
    
    func get(by id: String/*, with completion: SomeCompeltion*/)
    func save(with item: ListItemModel/*, with completion: SomeCompeltion*/)
    func delete(by id: String/*, with completion: SomeCompeltion*/)
    func deleteAll(by id: String/*, with completion: SomeCompeltion*/)
    
}
