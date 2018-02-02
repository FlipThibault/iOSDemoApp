import Foundation
import UIKit

class ListViewController : UIViewController {
    
    var presenter: ListViewOutput?
    var listView: ListView
    var dataSourceDelegate: ListViewDelegateDataSource
    
    init(listView: ListView, dataSourceDelegate: ListViewDelegateDataSource) {
        self.listView = listView
        self.dataSourceDelegate = dataSourceDelegate
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupConstraints()
        
//        let btn = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(edit(_:)))
//        navigationItem.rightBarButtonItem = btn
    }
    
    private func setupTableView() {
        self.listView.dataSource = dataSourceDelegate
        self.listView.delegate = dataSourceDelegate
        self.view.addSubview(listView)
        
        listView.register(CellView.self, forCellReuseIdentifier: Constants.TableViewCellIdentifier.cellView)
    }
    
    private func setupConstraints() {
        
        self.listView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([

            self.listView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.listView.bottomAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.bottomAnchor),
            self.listView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.listView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
            
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
