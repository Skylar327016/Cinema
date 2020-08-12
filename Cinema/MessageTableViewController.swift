//
//  MessageTableViewController.swift
//  Cinema
//
//  Created by 陳家豪 on 2020/8/8.
//

import UIKit

class MessageTableViewController: UITableViewController {
    
    struct PropertyKeys{
        static let messageCell = "messageCell"
    }
    
    var messages = [Message]()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMessages()
        DispatchQueue.main.async {
            self.tableView.scrollToRow(at: IndexPath(row: self.messages.count - 1, section: 0), at: .bottom, animated: false)
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    func loadMessages(){
        for i in 1...10{
            guard let image = UIImage(named: "systemPhoto") else{return}
            let message = Message(date: Date(), messageContent: "\(i)訊息：在進階套件中，我們提供了隨機回覆模組，可以對多個訊息模組設定機率，達成隨機回覆訊息的效果，可以廣泛運用於抽獎、小遊戲、心理測驗等情境，更能讓您的機器人變的更加擬人化！", systemPhoto: image)
            messages.append(message)
        }
      
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return messages.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.messageCell, for: indexPath) as? MessageTableViewCell else{
            return UITableViewCell()
        }
        cell.systemImage.contentMode = .scaleAspectFill
        cell.systemImage.layer.cornerRadius = cell.systemImage.frame.width / 2
        cell.systemImage.image = messages[indexPath.row].systemPhoto
        cell.dateLabel.text = messages[indexPath.row].messageDate
        cell.textMessage.text = messages[indexPath.row].messageContent
        cell.messageBox.layer.cornerRadius = 10
        cell.timeLabel.text = messages[indexPath.row].messageTime
        cell.selectionStyle = .none
        // Configure the cell...

        return cell
    }
    
    @IBAction func contactInfo(_ sender: UIBarButtonItem) {
        guard let image = UIImage(named: "systemPhoto") else{return}
        let info = Message(date: Date(), messageContent: """
仁大資訊
技術支援專線:0800-077-758
服務時間:週一至週五09:00-18:00
""", systemPhoto: image)
        messages.append(info)
        tableView.reloadData()
        tableView.scrollToRow(at: IndexPath(row: messages.count - 1, section: 0), at: .bottom, animated: true)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
