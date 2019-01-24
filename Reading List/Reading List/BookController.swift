import UIKit

class BookController: Codable {
    
    var books: [Book] = []
    
    func createBook(title: String, reasonToBeRead: String) {
        let book = Book(title: title, reasonToRead: reasonToBeRead)
        books.append(book)
        saveToPersitentStore()
    }
    
    var readBooks: [Book] {
        let booksRead = books.filter({ $0.hasBeenRead == true })
        return booksRead
    }
    
    var unreadBooks: [Book] {
        let unreadBook = books.filter({ $0.hasBeenRead == false })
        return unreadBook
    }
    
    func saveToPersitentStore() {
        guard let url = readingListURL else { return }
        let propertyListEncoder = PropertyListEncoder()
        do {
            let data = try propertyListEncoder.encode(books)
            try data.write(to: url)
        } catch {
            print(error)
        }
    }
    
    func loadToPersistentStore() {
        guard let url = readingListURL,
            FileManager.default.fileExists(atPath: url.path)   else { return }
        do {
            let decoder = PropertyListDecoder()
            let data = try Data(contentsOf: url)
            books = try decoder.decode([Book].self, from: data)
        } catch {
            print(error)
        }
    }
    
    var readingListURL: URL? {
        let fileManger = FileManager.default
        guard let documentsDirectory = fileManger.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }
        
        let finalLocation = documentsDirectory.appendingPathComponent("readingList.plist")
        return finalLocation
    }
}
