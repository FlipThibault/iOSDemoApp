import Foundation

class ListPresenter: NSObject {
    
    var router: ListRouterInput?
    var deleteItemUseCase: DeleteItemUseCase?
    var saveItemUseCase: SaveItemUseCase?
    var fetchListUseCase: FetchListUseCase?
    var view: ListViewInput?
    
    //data used to pass to the view
    var listViewModel: ListViewModel?
    
    //actual data
    var listModel: AppListModel?
    var isEditing: Bool = false
    
    private func updateViewModel() {
        if let list = self.listModel {
            let mappedModel = ListViewModelMapper.mapAppListModelToListViewModel(with: list)
            self.listViewModel = mappedModel
        }
    }
}

extension ListPresenter: ListViewOutput {
    
    func isLoaded() {
        fetchListUseCase?.fetchList(by: "", with: { (appListModel, error) in
            self.listModel = appListModel
            self.updateViewModel()
            if(self.listModel?.items.count == 0) {
                self.view?.showEmptyView()
            } else {
                self.view?.populateViewWithData()
            }
        })
    }
    
    func addItemRequested() {
        if let list = self.listModel {
            router?.goToAddView(with: self, and: list)
        }
    }
    
    func toggleEditMode() {
        self.isEditing = !self.isEditing
        self.view?.setEditMode(isEditing: self.isEditing)
    }
    
}

extension ListPresenter: ListViewDataProvider {
    
    func getData() -> ListViewModel? {
        return self.listViewModel
    }
    
}

extension ListPresenter: ListViewInteractionHandler {
    
    func onItemClick(at indexPath: IndexPath) {
        if let list = self.listModel, let items = self.listModel?.items {
            router?.goToDetail(with: self, and: items[indexPath.row], and: list)
        }
    }
    
    func onItemDelete(at indexPath: IndexPath) {
        if let list = self.listModel, let items = self.listModel?.items {
            deleteItemUseCase?.deleteItem(item: items[indexPath.row], from: list, with: { (appListItem, success) in
                self.updateViewModel()
                self.view?.notifyItemRemoved(at: IndexPath(row: indexPath.row, section: 0))
                if(self.listModel?.items.count == 0) {
                    self.toggleEditMode()
                    self.view?.showEmptyView()
                }
            })
        }
    }
    
}

extension ListPresenter: DetailViewModuleDelegate {
    
    func notifyItemUpdated(item: AppListItemModel) {
        if let row = self.listModel?.items.index(of: item) {
            self.view?.notifyItemUpdated(at: IndexPath(row: row, section: 0))
        }
    }
    
    func notifyItemUpdatedError(item: AppListItemModel, error: NSError?) {
        //assume for now we're only ever receiving this error for demo purposes
        view?.showError(listViewErrorViewModel: EmptyItemDescriptionError())
    }
    
}

extension ListPresenter: AddItemViewModuleDelegate {
    
    func notifyItemAdded(item: AppListItemModel) {
        if let row = self.listModel?.items.index(of: item) {
            updateViewModel()
            self.view?.notifyItemAdded(at: IndexPath(row: row, section: 0))
            if(self.listModel?.items.count == 1) {
                self.view?.hideEmptyView()
            }
        }
    }
    
    func notifyItemAddedError(item: AppListItemModel, error: NSError?) {
        //assume for now we're only ever receiving this error for demo purposes
        view?.showError(listViewErrorViewModel: EmptyItemDescriptionError())
    }
    
}
