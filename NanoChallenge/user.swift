
import Foundation

// User
class User {
    let id : Int
    var userName : String
    var email: String
    var password: String
    let created_at : String
    
    init(id: Int, userName: String, email: String, password: String, created_at: String) {
        self.id = id
        self.userName = userName
        self.email = email
        self.password = password
        self.created_at = created_at
    }
}
