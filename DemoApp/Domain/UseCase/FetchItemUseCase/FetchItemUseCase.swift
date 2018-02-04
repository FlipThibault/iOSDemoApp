import Foundation

protocol FetchItemUseCase {
    func fetchItem(by identifier: String, from list: AppListModel, with completion: (AppListItemModel) -> Void)
}
