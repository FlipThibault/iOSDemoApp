import Foundation

protocol UpdateItemUseCase {
    func updateItem(item: AppListItemModel, in list: AppListModel, with completion: @escaping (AppListItemModel, NSError?) -> Void)
}
