import Foundation

protocol DeleteItemUseCase {
    func deleteItem(item: AppListItemModel, from list: AppListModel, with completion: (Bool) -> Void)
}
