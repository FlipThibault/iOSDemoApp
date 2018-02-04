import Foundation
import UIKit

class ListViewController : UIViewController {
    
    var presenter: ListViewOutput?
    var delegateDataSource: ListViewDelegateDataSource
    private var listView: ListView
    
    init(with view: ListView, and delegateDataSource: ListViewDelegateDataSource) {
        self.listView = view
        self.delegateDataSource = delegateDataSource
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError(Constants.ErrorMessages.notImplementedInitWithCoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupConstraints()
        setupNavigationBarActions()
        
        self.presenter?.isLoaded()
    }
    
    private func setupTableView() {
        self.listView.dataSource = delegateDataSource
        self.listView.delegate = delegateDataSource
        self.view.addSubview(listView)
        
        listView.register(ListCellView.self, forCellReuseIdentifier: Constants.TableViewCellIdentifier.listCellView)
    }
    
    private func setupConstraints() {
        
        self.listView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([

            self.listView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.listView.bottomAnchor.constraint(equalTo:self.view.bottomAnchor),
            self.listView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.listView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
            
        ])
        
    }
    
    private func setupNavigationBarActions() {
        navigationItem.rightBarButtonItems = [editBtn, addBtn]
    }

    @objc func edit(_ sender : UIBarButtonItem) {
        presenter?.toggleEditMode()
    }
    
    @objc func add(_ sender : UIBarButtonItem) {
        presenter?.addItemRequested()
    }
    
    lazy var addBtn: UIBarButtonItem = {
         let addBtn = UIBarButtonItem(title: NSLocalizedString("action.navigation.add", comment:""), style: .plain, target: self, action: #selector(add(_:)))
        return addBtn
    }()
    
    lazy var editBtn: UIBarButtonItem = {
        let editBtn = UIBarButtonItem(title: NSLocalizedString("action.navigation.edit", comment:""), style: .plain, target: self, action: #selector(edit(_:)))
        return editBtn
    }()
}

extension ListViewController: ListViewInput {
    
    func populateViewWithData(listViewModel: ListViewModel) {
        self.listView.reloadData()
    }
    
    func setEditMode(isEditing: Bool) {
        listView.setEditing(isEditing, animated: true)
        if isEditing {
            editBtn.title = NSLocalizedString("action.navigation.done", comment: "")
            navigationItem.rightBarButtonItems = [editBtn]
        } else {
            editBtn.title = NSLocalizedString("action.navigation.edit", comment: "")
            navigationItem.rightBarButtonItems = [editBtn, addBtn]
        }
    }
    
}
