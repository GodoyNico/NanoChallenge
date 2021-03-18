
import Foundation

// Function to generate menu.
func generateMenu() {
    var running = true
    
    while(running){
        print("===============================================")
        print("CALL LIST ACADEMY 2050. SELECT A OPTION BELOW:")
        print("[1] Create new user")
        print("[2] Read Data")
        print("[3] Update user data")
        print("[4] Delete User")
        print("[5] Search user")
        print("[6] Exit")
        print("===============================================")
        print("> ")
        
        if let readOption = readLine() {
            switch readOption {
            case "1": createUser()
                      clearScreen()
            case "2": readData()
                      clearScreen()
            case "3": updateData()
                      clearScreen()
            case "4": deleteData()
                      clearScreen()
            case "5": searchUser()
                      clearScreen()
            case "6": running = false
                print()
                exit(0)
            default:
                print("\nThis option do not exist\n")
            }
        }
    }
}

fillData()
generateMenu()
