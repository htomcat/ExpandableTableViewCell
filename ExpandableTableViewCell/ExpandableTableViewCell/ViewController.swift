//
//  ViewController.swift
//  ExpandableTableViewCell
//
//  Created by htomcat on 2018/02/07.
//  Copyright © 2018年 htomcat. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    let identifier = "CustomTableViewCell"
    var isExpandable = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: identifier)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        cell.backgroundColor = .red
        cell.selectionStyle = .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if isExpandable {
            return 200
        } else {
            return 50
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        isExpandable = true
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}

