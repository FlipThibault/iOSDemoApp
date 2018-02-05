import Foundation

protocol ListItemDataSource {
    func get(by identifier: String, with completion:  @escaping  (AppListItemModel, NSError?) -> Void)
    func save(with item: AppListItemModel, with completion:  @escaping  (NSError?) -> Void)
    func delete(by identifier: String, with completion:  @escaping  (NSError?) -> Void)
}

