import Foundation

protocol SaveItemUseCase {
    func saveItem(item: AppListItemModel, to list: AppListModel, with completion: (AppListModel, NSError?) -> Void)
}
