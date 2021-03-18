
import Foundation

// List of User to represents an mini "Database".
var userList : [User] = []
var count = 0

// Create a new user.
func createData() {
    print("\nEnter the name of the new username: ")
    guard let newUserName = readLine() else {
        return
    }
    print("\nEnter email: ")
    guard let newEmail = readLine() else {
        return
    }
    
    var pwdMatch = false
    while(!pwdMatch) {
        print("\nEnter Password: ")
        guard let newPassword = readLine() else {
            return
        }
        print("\nConfirm your Password: ")
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
        print("\nUser list are empty.")
    } else {
        print("\nAll users data stored:")
        for user in userList {
            print ("ID: \(user.id)")
            print ("Username: \(user.userName)")
            print ("Email: \(user.email)")
            print ("User created at: \(user.created_at)\n")
        }
    }
}

// Show the update option list to the user.
func showUpdateOptions() -> String {
    print("\nWhat do you want to update?")
    print("[1] The username")
    print("[2] The email")
    print("[3] Update my password")
    
    guard let updateOption = readLine() else {
        return "\nOption not available"
    }
    return updateOption
}

// Update a user data
func updateData() {
    print ("\nInform the id of the user to update: ")
    if let updateUser = readLine() {
        for user in userList {
            let id = String(user.id)
            if (id.elementsEqual(updateUser)){
                let myOption = showUpdateOptions()
                switch myOption {
                case "1":
                    let newName = updateUsername()
                    user.userName = newName
                    print("\nName updated sucessfuly!")
                case "2":
                    let newEmail = updateEmail()
                    user.email = newEmail
                    print("\nEmail updated sucessfuly!")
                case "3":
                    let newPwd = updatePassword()
                    user.password = newPwd
                    print("\nPassword updated sucessfuly!")
                default:
                    print(myOption)
                }
            }
        }
    }
}

// Update username property.
func updateUsername () -> String {
    print("\nEnter the new name: ")
    guard let newUserName = readLine() else {
        return "Error"
    }
    return newUserName
}

// Update email property.
func updateEmail () -> String {
    print("\nEnter the new email: ")
    guard let newEmail = readLine() else {
        return "Error"
    }
    return newEmail
}

// Update password property.
func updatePassword () -> String {
    
    var pwdMatch = false
    while(!pwdMatch) {
        print("\nEnter your new Password: ")
        guard let newPassword = readLine() else {
            return "Error"
        }
        print("\nConfirm your Password: ")
        guard let confirmPassword = readLine() else {
            return " Error"
        }
        
        if(!newPassword.elementsEqual(confirmPassword)) {
            print("\nConfirmation password do not match! Please try again...")
        } else {
            pwdMatch = true
            return newPassword
        }
    }
}

// Delete user data.
func deleteData () {
    var index = 0
    
    print ("\nInform the id of the user to delete: ")
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
