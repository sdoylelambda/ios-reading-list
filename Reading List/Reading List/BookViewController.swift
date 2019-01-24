
import UIKit

class BookViewController: UIViewController {
    
    var bookController: BookController?
    
    var book: Book?
    
    @IBAction func saveTapped(_ sender: Any) {
        guard let title = addBookLabel.text,
            let reason = reasonToReadOutlet.text else {
                return
        }
        bookController?.createBook(title: title, reasonToBeRead: reason)
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var addBookLabel: UITextField!
    @IBOutlet weak var reasonToReadOutlet: UITextView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        //viewwllaperar
    }
    
    func updateViews() {
        if let book = book {
            addBookLabel.text = book.title
            reasonToReadOutlet.text = book.reasonToRead
            navigationItem.title = book.title
        }
    }
}
