import Foundation

protocol ListItemDataSource {
    func get(by identifier: String/*, with completion: SomeCompeltion*/)
    func save(with item: ListItemModel/*, with completion: SomeCompeltion*/)
    func delete(by identifier: String/*, with completion: SomeCompeltion*/)
    func deleteAll(by identifier: String/*, with completion: SomeCompeltion*/)
}
