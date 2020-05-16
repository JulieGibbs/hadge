//
//  SettingsSyncHelper.swift
//  Hadge
//
//  Created by Thomas Dohmke on 5/16/20.
//  Copyright © 2020 Entire. All rights reserved.
//

import UIKit

class SettingsSyncHelper {
    func tableView(_ tableView: UITableView, cellForRow: Int) -> UITableViewCell {
        let identifier = "SettingsCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) ?? UITableViewCell.init(style: .subtitle, reuseIdentifier: identifier)
        cell.separatorInset = UIEdgeInsets.init(top: 0, left: 15.0, bottom: 0, right: 0)

        switch cellForRow {
        case 0:
            cell.textLabel?.text = "Re-upload all data"
        default:
            cell.textLabel?.text = "Undefined"
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRow: Int, viewController: SettingsViewController) {
        switch didSelectRow {
        default: // No op
            break
        }
    }
}
