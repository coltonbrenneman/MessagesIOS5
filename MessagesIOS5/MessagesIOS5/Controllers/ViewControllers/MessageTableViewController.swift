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

    // MARK: - Actions
    @IBAction func addMessageButtonTapped(_ sender: Any) {
      presentNewMessageAlert()
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
    
    // MARK: - Function
    func presentNewMessageAlert() {
        let alert = UIAlertController(title: "New Message", message: "Type your message below hoe", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Your message here hoe..."
        }
        let dismissAction = UIAlertAction(title: "Cancel Hoe", style: .cancel)
        let confirmAction = UIAlertAction(title: "Post Bitch", style: .default) { _ in
            guard let textField = alert.textFields?.first,
                  let messageText = textField.text else { return }
            MessageController.sharedInstance.createMessage(text: messageText)
            self.tableView.reloadData()
        }
        
        alert.addAction(dismissAction)
        alert.addAction(confirmAction)
        present(alert, animated: true)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Thursday, the best day of the year
    }
} //End of class
