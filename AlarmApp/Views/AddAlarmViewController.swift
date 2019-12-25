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
    
    var viewModel: AlarmViewModelProtocol!
    var viewModelDelegate: AlarmViewModelDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        configureDatePicker()
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        let date = self.datePicker.date
        self.viewModel.addAlarms(date: date)
        viewModelDelegate?.passViewModel(viewModel: self.viewModel)
        dismiss(animated: true, completion: nil)
    }
    
    func configureDatePicker() {
        datePicker.backgroundColor = .darkGray
        datePicker.setValue(UIColor.white, forKey: "textColor")
    }
}
