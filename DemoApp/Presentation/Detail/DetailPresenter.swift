import Foundation

class DetailPresenter : NSObject {
    
    weak var view : DetailViewInput?
    var fetchItemUseCase: FetchItemUseCase?
    var saveItemUseCase: SaveItemUseCase?
    var viewModel: DetailViewModel?
    var list: AppListModel
    var listItem: AppListItemModel
    
    init(with item: AppListItemModel, and list: AppListModel) {
        self.listItem = item
        self.list = list
    }
    
}

extension DetailPresenter : DetailViewOutput {
    
    func isLoaded() {
    
        self.view?.displayData(itemViewModel: AppListItemDetailViewModel(with: listItem))
        
    }
    
}
