import Foundation

protocol ListDataSource {
    
    func get(by id: String/*, with completion: SomeCompeltion*/)
    func save(with list: ListModel/*, with completion: SomeCompeltion*/)
    func delete(by id: String/*, with completion: SomeCompeltion*/)
    func deleteAll(by id: String/*, with completion: SomeCompeltion*/)
    
}
