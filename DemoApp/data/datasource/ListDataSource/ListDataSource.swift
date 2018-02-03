import Foundation

protocol ListDataSource {
    func get(by identifier: String/*, with completion: SomeCompeltion*/)
    func save(with list: ListModel/*, with completion: SomeCompeltion*/)
    func delete(by identifier: String/*, with completion: SomeCompeltion*/)
    func deleteAll(by identifier: String/*, with completion: SomeCompeltion*/)
}
