//
//  ViewController.swift
//  Shopping list
//
//  Created by Ekaterina Akchurina on 24.09.2020.
//

import UIKit

class ViewController: UITableViewController {
    
    var items = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Shopping list"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(removeAll))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItem))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Shopping", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    @objc func removeAll(){
        items.removeAll()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    @objc func addItem(){
        let addAc = UIAlertController(title: "Add an item", message: nil, preferredStyle: .alert)
        addAc.addTextField(configurationHandler: nil)
        addAc.addAction(UIAlertAction(title: "Add", style: .default, handler: { [weak addAc] (action) in
            if let text = addAc?.textFields?[0].text {
                self.items.insert(text, at: 0)
                DispatchQueue.main.async {
                    self.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
                }
            }
        }))
        addAc.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(addAc, animated: true)

    }


}

