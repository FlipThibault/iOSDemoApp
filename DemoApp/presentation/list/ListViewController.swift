import Foundation
import UIKit

class ListViewController : UIViewController {
    
    var presenter: ListViewOutput?
    var listView: ListView
    
    init(listView: ListView) {
        self.listView = listView
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(listView)
        
        setupConstraints()
        
//        let btn = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(edit(_:)))
//        navigationItem.rightBarButtonItem = btn
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([

        ])
        
    }
//
//    @objc func edit(_ sender : UIBarButtonItem) {
//        listView.setEditing(!listView.isEditing, animated: true)
//
//        if listView.isEditing {
//            listView.setEditing(true, animated: true) // func setEditing(_ editing: Bool, animated: Bool)
//            sender.title = "Done"
//        }
//        else {
//            print("not editing")
//            listView.setEditing(false, animated: true)
//            sender.title = "Edit"
//        }
//    }
    
}

extension ListViewController : ListViewDelegate {
    
}
