//
//  DetailViewController.swift
//  AlarmApp
//
//  Created by Zhassulan Aimukhambetov on 12/23/19.
//  Copyright © 2019 Zhassulan Aimukhambetov. All rights reserved.
//

import UIKit

class AddAlarmViewController: UITableViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    var viewModel = AlarmViewModel()
    var isEditMode = false
    var date: Date!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getAlarms()
        configureNavigationBar()
    }
    
    func configureNavigationBar() {
        if isEditMode {
            navigationItem.leftBarButtonItem = nil
            navigationController?.title = "Edit Alarm"
            datePicker.date = date
        }
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        let str = [String]()
        UserDefaults.standard.set(str, forKey: "alarms")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        print("save")
        let date = self.datePicker.date
        self.viewModel.saveAlarms(date: date)
        dismiss(animated: true, completion: nil)
    }
}
