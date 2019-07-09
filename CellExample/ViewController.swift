//
//  ViewController.swift
//  CellExample
//
//  Copyright © 2019 The Dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var selectionLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
        self.tableView.reloadData()
    }
}

extension ViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TableViewCell else { return UITableViewCell()}
        cell.nameLabel.text = "Pinko pota"
        cell.delegate = self
        return cell
    }
    
    
}

extension ViewController:CellUpdateDelegate{
    func cellUpdated(text: String) {
        selectionLabel.text = text
    }
    
}
