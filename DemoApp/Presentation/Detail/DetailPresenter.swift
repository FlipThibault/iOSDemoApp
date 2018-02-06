import Foundation

class DetailPresenter : NSObject {
    
    weak var view : DetailViewInput?
    var updateItemUseCase: UpdateItemUseCase?
    var viewModel: DetailViewModel
    var list: AppListModel
    var listItem: AppListItemModel
    var initialText: String
    var moduleDelegate: DetailViewModuleDelegate?

    init(with item: AppListItemModel, and list: AppListModel) {
        self.listItem = item
        self.list = list
        self.initialText = listItem.descriptionText
        self.viewModel = AppListItemDetailViewModel(with: listItem)
    }
    
}

extension DetailPresenter : DetailViewOutput {
    
    func isLoaded() {
        self.view?.displayData(itemViewModel: viewModel)
    }
    
    func updateText(text: String) {
        self.listItem.descriptionText = text
    }
    
    func isDismissing() {
        if self.initialText != self.listItem.descriptionText {
            self.updateItemUseCase?.updateItem(item: self.listItem, in: self.list, with: { (appListModel, error) in

                if let err = error {
                    //if theres an error after saving, we notify the delegate who can handle it as required
                    self.moduleDelegate?.notifyItemUpdatedError(item: self.listItem, error: err)
                } else {
                    self.moduleDelegate?.notifyItemUpdated(item: self.listItem)
                }
                
            })
        }
    }
    
}
