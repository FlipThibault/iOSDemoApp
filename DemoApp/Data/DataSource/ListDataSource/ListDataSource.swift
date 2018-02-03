import Foundation

protocol ListDataSource {
    func getAll(with completion: ([AppListModel]) -> Void)
    func get(by identifier: String, with completion: (AppListModel) -> Void)
    func save(with item: AppListModel, with completion: (Bool) -> Void)
    func delete(by identifier: String, with completion: (Bool) -> Void)
}
