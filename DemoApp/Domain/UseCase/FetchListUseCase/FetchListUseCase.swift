import Foundation

protocol FetchListUseCase {
    
    func fetchList(by id: String, with completion: (AppListModel) -> Void)
    
}
