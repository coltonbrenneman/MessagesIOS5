//
//  MarkAllViewController.swift
//  MessagesIOS5
//
//  Created by Colton Brenneman on 6/8/23.
//

import UIKit

class MarkAllViewController: UIViewController {
    
    // MARK: - Actions
    @IBAction func markAllAsReadButtonTapped(_ sender: Any) {
        NotificationCenter.default.post(name: Constants.Notifications.markAllAsRead, object: nil)
    }
    
    @IBAction func markAllAsUnreadButtonTapped(_ sender: Any) {
        NotificationCenter.default.post(name: Constants.Notifications.markAllAsUnread, object: nil)
    }
} //End of class
//Protocols and delegates are 1 to 1 comminucation
