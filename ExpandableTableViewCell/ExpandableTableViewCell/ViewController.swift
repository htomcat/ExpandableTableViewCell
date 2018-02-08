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
    let currencies = [Currency(country: "United States", name: "Doller", code: "USD", desc: "hogehogehogehogehogehoge"),
                      Currency(country: "China", name: "yuan", code: "CNY", desc: "hogehogehogehogehogehoge"),
                      Currency(country: "United Kingdom", name: "Pound", code: "GBP", desc: "hogehogehogehogehogehoge"),
                      Currency(country: "Canada", name: "Canadian doller", code: "CAD", desc: "hogehogehogehogehogehoge"),
                      Currency(country: "Brazil", name: "Real", code: "BRL", desc: "hogehogehogehogehogehoge")]
    var expandableState = [false, false, false, false, false]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: identifier)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        let currency = currencies[indexPath.row]
        cell.more.tag = indexPath.row
        cell.more.addTarget(self, action: #selector(touchedOpenDescription(_:)), for: .touchUpInside)
        cell.configure(with: currency)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if expandableState[indexPath.row] {
            return 200
        } else {
            return 100
        }
    }
    
    @objc
    func touchedOpenDescription(_ button: UIButton) {
        if expandableState[button.tag] {
            expandableState[button.tag] = false
            button.isSelected = false
        } else {
            expandableState[button.tag] = true
            button.isSelected = true
        }

        tableView.beginUpdates()
        tableView.endUpdates()
    }
}

