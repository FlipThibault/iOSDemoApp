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
}

extension ListPresenter: ListViewOutput {
    
    func isLoaded() {
        fetchListUseCase?.fetchList(by: "", with: { (appListModel) in
            self.listModel = appListModel
            let mappedModel = ListViewModelMapper.mapAppListModelToListViewModel(with: appListModel)
            self.listViewModel = mappedModel
            view?.populateViewWithData(listViewModel: mappedModel)
        })
    }
    
    func addItemRequested() {
        router?.goToAddView(with: self)
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
            router?.goToDetail(with: items[indexPath.row], and: list)
        }
    }
    
}

extension ListPresenter: AddItemViewOutput {
    
    func didClickAddAction(with text: String) {
//        if(!text.isEmpty) {
//            saveItemUseCase?.saveItem(item: newItem, to: self.listViewModel, with: { (success) in
//                if(success) {
//
//                }
//            })
//
//        } else {
//        }
    }
    
    func didClickCancelAction() {
    }
    
}
