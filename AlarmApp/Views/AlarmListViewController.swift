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
    
    var viewModel =  AlarmViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getAlarms()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.getAlarms()
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "edit" {
            let editAlarmVC = segue.destination as! AddAlarmViewController
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            editAlarmVC.isEditMode = true
            editAlarmVC.date = viewModel.getAlarmDate(indexPath: indexPath)
        }
    }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {}
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

