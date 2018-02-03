import Foundation

protocol ListItemDataSource {
    func getAll(with completion: ([AppListItemModel]) -> Void)
    func get(by identifier: String, with completion: (AppListItemModel) -> Void)
    func save(with item: AppListItemModel, with completion: (Bool) -> Void)
    func delete(by identifier: String, with completion: (Bool) -> Void)
}
