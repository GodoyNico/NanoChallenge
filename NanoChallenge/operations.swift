
import Foundation

// List of User to represents an mini "Database".
var userList : [User] = []
var count = 10


/**
    Function to clear terminal screen.
 */
func clearScreen() {
    print("Press Enter to continue...")
    if let pressEnter = readLine() {
        for _ in 1...100 {
            print(" ")
        }
    }

}


/**
    Function to create a new user.
 */
func createUser() {
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
            
            let date = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
            
            let createNewUser = User(id: count, userName: newUserName, email: newEmail, password: newPassword, created_at: dateFormatter.string(from: date))
            userList.append(createNewUser)
            print("New user registered!")
        }
    }
}


/**
    Function to read all the data from database. Show all users inside the list.
 */
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


/**
    Function to update some user data.
 */
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


/**
    Function to delete some user data.
 */
func deleteData () {
    var index = 0
    var found = false
    
    print ("\nInform the id of the user to delete: ")
    if let deleteUser = readLine() {
        for user in userList {
            let id = String(user.id)
            if (id.elementsEqual(deleteUser)){
                found = true
                userList.remove(at: index)
                print("User deleted successfully!")
            }
            index += 1
        }
    }
    
    if(!found) {
        print("Cannot found this user id...")
    }
}


/**
    Function to search a user.
 */
func searchUser () {
    
    if (userList.isEmpty) {
        print("User list is empty...")
        
    } else {
        var found = false
        print("Inform a name to search: ")
        if let name = readLine() {
            for user in userList {
                if user.userName.contains(name) {
                    found = true
                    print ("\nID: \(user.id)")
                    print ("Username: \(user.userName)")
                    print ("Email: \(user.email)\n")
                }
            }
        }
        
        if (!found) {
            print("No results found...")
        }
    }
}


/**
    Fill user list with some fake data users.
 */
func fillData(){
    let user1 = User(id: 1, userName: "John Doe", email: "johndoe@gmail.com", password: "john123", created_at: "30/02/1984 13:44")
    let user2 = User(id: 2, userName: "Mark Clark", email: "markclark@gmail.com", password: "mark0", created_at: "15/06/1993 11:37")
    let user3 = User(id: 3, userName: "Lara Wess", email: "larawess@gmail.com", password: "lara123", created_at: "14/02/1999 12:19")
    let user4 = User(id: 4, userName: "Rodrigo Crown", email: "rodrigoc@gmail.com", password: "rodrigocrown1", created_at: "08/07/1970 18:25")
    let user5 = User(id: 5, userName: "Samantha Doe", email: "samantha@gmail.com", password: "sam891", created_at: "03/10/1998 13:44")
    let user6 = User(id: 6, userName: "Janeth Rosa", email: "janeth@gmail.com", password: "janeth123", created_at: "28/04/2005 17:50")
    let user7 = User(id: 7, userName: "Rodrigo Santos", email: "santos@gmail.com", password: "santos999", created_at: "25/02/2010 13:40")
    let user8 = User(id: 8, userName: "Angela River", email: "angela@gmail.com", password: "angela222", created_at: "14/12/1992 19:54")
    let user9 = User(id: 9, userName: "Keegan West", email: "keegan@gmail.com", password: "keegan777", created_at: "21/03/1988 23:44")
    let user10 = User(id: 10, userName: "Arthur King", email: "arthur@gmail.com", password: "john123", created_at: "30/02/1984 13:44")
    
    userList.append(user1)
    userList.append(user2)
    userList.append(user3)
    userList.append(user4)
    userList.append(user5)
    userList.append(user6)
    userList.append(user7)
    userList.append(user8)
    userList.append(user9)
    userList.append(user10)

}
