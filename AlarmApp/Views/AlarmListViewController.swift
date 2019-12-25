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
    
    var viewModel: AlarmViewModelProtocol = AlarmViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getAlarms()
        tableView.tableFooterView = UIView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addAlarm" {
            let navigationController = segue.destination as! UINavigationController
            let addAlarmVC = navigationController.topViewController as! AddAlarmViewController
            addAlarmVC.viewModelDelegate = self
            addAlarmVC.viewModel = viewModel
        }
    }
}

//MARK: - UITableViewDataSource
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
//MARK: - UITableViewDelegate
extension AlarmListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (_, _) in
            self.viewModel.deleteAlarm(indexPath: indexPath)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
        return [deleteAction]
    }
}
//MARK: - AlarmViewModelDelegate
extension AlarmListViewController: AlarmViewModelDelegate {
    func passViewModel(viewModel: AlarmViewModelProtocol) {
        self.viewModel = viewModel
        tableView.reloadData()
    }
}

