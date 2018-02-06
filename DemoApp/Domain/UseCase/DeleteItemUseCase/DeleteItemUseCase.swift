import Foundation

@objc protocol DeleteItemUseCase: NSObjectProtocol {
    func deleteItem(item: AppListItemModel, from list: AppListModel, with completion: @escaping (AppListItemModel, NSError?) -> Void)
}
