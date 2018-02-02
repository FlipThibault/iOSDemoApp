import Foundation
import UIKit

class ListViewController : UIViewController {
    
    var presenter: ListViewOutput?
    private var listView: ListView
    
    private let myArray: NSArray = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15"]
    
    init(with view: ListView) {
        self.listView = view
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError(Constants.ErrorMessages.notImplementedInitWithCoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupConstraints()
        
        let btn = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(edit(_:)))
        navigationItem.rightBarButtonItem = btn
    }
    
    private func setupTableView() {
        self.listView.dataSource = self
        self.listView.delegate = self
        self.view.addSubview(listView)
        
        listView.register(ListCellView.self, forCellReuseIdentifier: Constants.TableViewCellIdentifier.listCellView)
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

    @objc func edit(_ sender : UIBarButtonItem) {
        listView.setEditing(!listView.isEditing, animated: true)

        if listView.isEditing {
            listView.setEditing(true, animated: true)
            sender.title = NSLocalizedString("action.navigation.done", comment: "")
        }
        else {
            listView.setEditing(false, animated: true)
            sender.title = NSLocalizedString("action.navigation.edit", comment: "")
        }
    }
    
}

extension ListViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewCellIdentifier.listCellView, for: indexPath) as! ListCellView
        cell.titleLabel.text = "\(myArray[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}

extension ListViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        presenter?.didClickCellAtIndex(indexPath: indexPath)
    }
    
}
