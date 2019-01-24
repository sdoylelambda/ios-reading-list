import UIKit

class BookTableViewCell: UITableViewCell {
    
    var book: Book?
    
    func updateViews() {
        if let book = book {
            bookTextLabel.text = book.title
            
            if book.hasBeenRead == true {
                checkOutlet.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
            } else if book.hasBeenRead == false {
                checkOutlet.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
            }
        }
    }
    
    weak var delegate: BookTableViewCellDelegate?
    
    @IBAction func checkAction(_ sender: Any) {
        delegate?.toggleHasBeenRead(for: self)
    }
    
    @IBOutlet weak var bookTextLabel: UILabel!
    @IBOutlet weak var checkOutlet: UIButton!
    
    
    
}
