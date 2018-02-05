import Foundation

class AddItemPresenter {
    
    var moduleDelegate: AddItemViewModuleDelegate?
    var saveItemUseCase: SaveItemUseCase?
    var list: AppListModel
    
    init(with list: AppListModel) {
        self.list = list
    }
    
}

extension AddItemPresenter: AddItemViewOutput {
    
    func didClickAddAction(with text: String) {
        saveItemUseCase?.saveItem(with: text, to: self.list) { (appListItemModel, error) in

            if let err = error {
                //if theres an error after saving, we notify the delegate who can handle it as required
                self.moduleDelegate?.notifyItemAddedError(item: appListItemModel, error: err)
            } else {
                self.moduleDelegate?.notifyItemAdded(item: appListItemModel)
            }
            
        }
    }
    
    func didClickCancelAction() {
        //cancel currently handled by OS since we're using a native component
    }
    
}
