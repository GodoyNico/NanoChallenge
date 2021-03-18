
import Foundation

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
