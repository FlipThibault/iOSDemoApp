import Foundation

@objc protocol SaveItemUseCase: NSObjectProtocol {
    func saveItem(with description: String, to list: AppListModel, with completion: @escaping (AppListItemModel, NSError?) -> Void)
    func saveItem(item: AppListItemModel, to list: AppListModel, with completion: @escaping (AppListItemModel, NSError?) -> Void)
}
