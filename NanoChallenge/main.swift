
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

// List of User to represents an mini "Database".
var userList : [User] = []
var count = 0

// Create a new user.
func createData() {
    print("Enter the name of the new username: ")
    guard let newUserName = readLine() else {
        return
    }
    print("Enter email: ")
    guard let newEmail = readLine() else {
        return
    }
    
    var pwdMatch = false
    while(!pwdMatch) {
        print("Enter Password: ")
        guard let newPassword = readLine() else {
            return
        }
        print("Confirm your Password: ")
        guard let confirmPassword = readLine() else {
            return
        }
        
        if(!newPassword.elementsEqual(confirmPassword)) {
            print("Confirmation password do not match! Please try again...")
        } else {
            pwdMatch = true
            // Generate new user
            count += 1
            let createNewUser = User(id: count, userName: newUserName, email: newEmail, password: newPassword)
            userList.append(createNewUser)
        }
    }
}

// Read all users in database
func readData() {
    
    if (userList.isEmpty) {
        print("User list are empty.")
    } else {
        print("All users data stored.")
        for user in userList {
            print ("ID: ", user.id)
            print ("Username: ", user.userName)
            print ("Email: ", user.email)
            print ("User created at: ", user.created_at)
        }
    }
}

// Update a user data
func updateData() {
    print ("Inform the id of the user to update: ")
    if let updateUser = readLine() {
        for user in userList {
            let id = String(user.id)
            if (id.elementsEqual(updateUser)){
                let myOption = showUpdateOptions()
                switch myOption {
                case "1":
                    let newName = updateUsername()
                    user.userName = newName
                    print("Name updated sucessfuly!")
                case "2":
                    let newEmail = updateEmail()
                    user.email = newEmail
                    print("Email updated sucessfuly!")
                case "3":
                    let newPwd = updatePassword()
                    user.password = newPwd
                    print("Password updated sucessfuly!")
                default:
                    print(myOption)
                }
            }
        }
    }
}

// Delete user data.
func deleteData () {
    var index = 0
    
    print ("Inform the id of the user to delete: ")
    if let deleteUser = readLine() {
        for user in userList {
            let id = String(user.id)
            if (id.elementsEqual(deleteUser)){
                userList.remove(at: index)
            }
            index += 1
        }
    }
}

// Update username property.
func updateUsername () -> String {
    print("Enter the new name: ")
    guard let newUserName = readLine() else {
        return "Error"
    }
    return newUserName
}

// Update email property.
func updateEmail () -> String {
    print("Enter the new email: ")
    guard let newEmail = readLine() else {
        return "Error"
    }
    return newEmail
}

// Update password property.
func updatePassword () -> String {
    
    var pwdMatch = false
    while(!pwdMatch) {
        print("Enter your new Password: ")
        guard let newPassword = readLine() else {
            return "Error"
        }
        print("Confirm your Password: ")
        guard let confirmPassword = readLine() else {
            return " Error"
        }
        
        if(!newPassword.elementsEqual(confirmPassword)) {
            print("Confirmation password do not match! Please try again...")
        } else {
            pwdMatch = true
            return newPassword
        }
    }
}

// Show the update option list to the user.
func showUpdateOptions() -> String {
    print("What do you want to update?")
    print("[1] The username")
    print("[2] The email")
    print("[3] Update my password")
    
    guard let updateOption = readLine() else {
        return "Option not available"
    }
    return updateOption
}

// Function to generate menu.
func generateMenu() {
    var running = true
    
    while(running){
        print("\n==========================================")
        print("SIMPLE CRUD 1.0. SELECT A OPTION BELOW:")
        print("[1] Create new user")
        print("[2] Read Data")
        print("[3] Update user data")
        print("[4] Delete User")
        print("[5] Exit")
        print("==========================================")
        print("> ")
        
        if let readOption = readLine() {
            switch readOption {
            case "1": createData()
            case "2": readData()
            case "3": updateData()
            case "4": deleteData()
            case "5": running = false
                      exit(0)
            default:
                print("This option do not exist")
            }
        }
    }
}

generateMenu()
