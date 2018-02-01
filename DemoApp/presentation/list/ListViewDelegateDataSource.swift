import Foundation
import UIKit

class ListViewDelegateDataSource : NSObject{
    
}

extension ListViewDelegateDataSource : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}

extension ListViewDelegateDataSource : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didDeselectRowAt: IndexPath) {
        
    }
    
}
