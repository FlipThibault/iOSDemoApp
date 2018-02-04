import Foundation

class ListPresenter: NSObject {
    
    var router: ListRouterInput?
    var deleteItemUseCase: DeleteItemUseCase?
    var saveItemUseCase: SaveItemUseCase?
    var fetchListUseCase: FetchListUseCase?
    var listViewModel: ListViewModel?
    var view: ListViewInput?
    
}

extension ListPresenter: ListViewOutput {
    
    func isLoaded() {
        fetchListUseCase?.fetchList(by: "", with: { (appListModel) in
            let mappedModel = ListViewModelMapper.mapAppListModelToListViewModel(with: appListModel)
            self.listViewModel = mappedModel
            view?.populateView(listViewModel: mappedModel)
        })
    }
    
}

extension ListPresenter: ListViewDataProvider {
    
    func getData() -> ListViewModel? {
        return self.listViewModel
    }
    
}

extension ListPresenter: ListViewInteractionHandler {
    
    func onItemClick(at indexPath: IndexPath) {
        if let items = self.listViewModel?.items {
            router?.goToDetail(for: items[indexPath.row].identifier)
        }
    }
    
}
