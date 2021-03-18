
import Foundation

// User
class User {
    let id : Int
    var userName : String
    var email: String
    var password: String
    let created_at : String
    
    init(id: Int, userName: String, email: String, password: String) {
        self.id = id
        self.userName = userName
        self.email = email
        self.password = password
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        self.created_at = dateFormatter.string(from: date)
    }
}
