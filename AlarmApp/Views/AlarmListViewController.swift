//
//  ViewController.swift
//  AlarmApp
//
//  Created by Zhassulan Aimukhambetov on 12/23/19.
//  Copyright © 2019 Zhassulan Aimukhambetov. All rights reserved.
//

import UIKit

class AlarmListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: AlarmViewModelProtocol! {
        didSet {
            viewModel.getAlarms()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = AlarmViewModel()
        tableView.tableFooterView = UIView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.getAlarms()
        tableView.reloadData()
    }
}

extension AlarmListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alarmCell") as! AlarmCell
        cell.configureCell(viewModel: viewModel, indexPath: indexPath)
        return cell
    }
}

extension AlarmListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (_, _) in
            self.viewModel.deleteAlarm(indexPath: indexPath)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
        return [deleteAction]
    }
}

