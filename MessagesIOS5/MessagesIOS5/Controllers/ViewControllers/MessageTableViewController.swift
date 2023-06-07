//
//  MessageTableViewController.swift
//  MessagesIOS5
//
//  Created by Colton Brenneman on 6/7/23.
//

import UIKit

class MessageTableViewController: UITableViewController {

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessageController.sharedInstance.messages.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath) as? MessageTableViewCell else { return UITableViewCell() }

        let message = MessageController.sharedInstance.messages[indexPath.row]
        cell.updateUI(message: message)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let message = MessageController.sharedInstance.messages[indexPath.row]
            MessageController.sharedInstance.deleteMessage(message: message)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Thursday, the best day of the year
    }
} //End of class

// MARK: - Extensions
