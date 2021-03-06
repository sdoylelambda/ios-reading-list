import UIKit

class ReadingListTableViewController: UITableViewController {
    
    let bookController = BookController()
    //
    //    let book = bookController.books[indexPath.row]
    //
    //    func bookFor(indexPath: IndexPath) -> Book {
    //        bookController.books[indexPath.row]
    //    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        // load persitant data
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookController.books.count
        //return bookController.readBooks.count
    }
    
    //    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: 1) -> Int {
    //        return bookController.unreadBooks.count
    //    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookCell", for: indexPath) as? BookTableViewCell else { return UITableViewCell() }
        
        let book = bookController.readBooks[indexPath.row]
        cell.book = book
        return cell
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
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
    
    
    // MARK: - Navigation
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        if  segue.identifier == "AddSegue" {
    //            guard let bookVC = segue.destination as? BookViewController else { return }
    //            bookVC.bookController = bookController
    //        } else if segue.identifier == "BookSegue"
    //            tableView.indexPathForSelectedRow,
    //
    
    //   }
    
    
}
