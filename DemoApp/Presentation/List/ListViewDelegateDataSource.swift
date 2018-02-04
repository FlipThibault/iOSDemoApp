import Foundation
import UIKit

protocol ListViewDataProvider {
    func getData() -> ListViewModel?
}

protocol ListViewInteractionHandler {
    func onItemClick(at indexPath: IndexPath)
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
        return dataProvider.getData()?.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewCellIdentifier.listCellView, for: indexPath) as? ListCellView else {
            fatalError(Constants.ErrorMessages.cellTypeNotRegistered)
        }
        if let items = dataProvider.getData()?.items {
            cell.titleLabel.text = items[indexPath.row].displayText
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
    
}

