
import UIKit

class ViewController: UIViewController {
    
    let tableVC = UITableViewController(style: .plain)
    var allItem = ["Vasya", "Dennis", "Artem", "Alex"]
    let id = "Cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTableView()
        self.view.addSubview(tableVC.tableView)
    }
    
    func createTableView() {
        tableVC.tableView.register(UITableViewCell.self, forCellReuseIdentifier: id)
        tableVC.tableView.delegate = self
        tableVC.tableView.dataSource = self
        tableVC.tableView.prefetchDataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSourcePrefetching, UITableViewDataSource {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        print(indexPaths)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath)
        let item = allItem[indexPath.row]
        cell.textLabel?.text = item
        
        return cell
    }
    
}
