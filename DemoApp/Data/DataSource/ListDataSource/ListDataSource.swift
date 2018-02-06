import Foundation

protocol ListDataSource {
    func getAll(with completion: @escaping ([AppListModel], NSError?) -> Void)
    func get(by identifier: String, with completion: @escaping (AppListModel, NSError?) -> Void)
    func save(with list: AppListModel, with completion: @escaping (AppListModel, NSError?) -> Void)
    func delete(by identifier: String, with completion: @escaping (AppListModel, NSError?) -> Void)
}
