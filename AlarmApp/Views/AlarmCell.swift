//
//  AlarmCell.swift
//  AlarmApp
//
//  Created by Zhassulan Aimukhambetov on 12/24/19.
//  Copyright © 2019 Zhassulan Aimukhambetov. All rights reserved.
//

import UIKit

class AlarmCell: UITableViewCell {

    @IBOutlet weak var alarmLabel: UILabel!
    
    func configureCell(viewModel: AlarmViewModelProtocol, indexPath: IndexPath) {
        alarmLabel.text = viewModel.getAlarmText(indexPath: indexPath)
    }

}
