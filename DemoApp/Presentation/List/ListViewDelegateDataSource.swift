import Foundation
import UIKit

@objc protocol ListViewDataProvider {
    func getData() -> ListViewModel?
}

@objc protocol ListViewInteractionHandler {
    func onItemClick(at indexPath: IndexPath)
    func onItemDelete(at indexPath: IndexPath)
}

class ListViewDelegateDataSource: NSObject {
    
    var dataProvider: ListViewDataProvider
    var interactionHandler: ListViewInteractionHandler

    init(with dataProvider: ListViewDataProvider, and interactionHandler: ListViewInteractionHandler) {
        self.dataProvider = dataProvider
        self.interactionHandler = interactionHandler
    }
    
}

extension ListViewDelegateDataSource : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataProvider.getData()?.getDisplayItems().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewCellIdentifier.listCellView, for: indexPath) as? ListCellView else {
            fatalError(Constants.ErrorMessages.cellTypeNotRegistered)
        }
        if let items = dataProvider.getData()?.getDisplayItems() {
            cell.titleLabel.text = items[indexPath.row].getDisplayText()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}

extension ListViewDelegateDataSource : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.interactionHandler.onItemClick(at: indexPath)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete) {
            self.interactionHandler.onItemDelete(at: indexPath)
        }
    }
        
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
}

