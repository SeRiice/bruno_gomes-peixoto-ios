//
//  AdminModel.swift
//  TestSubDeVinci
//
//  Created by Bruno Gomes Peixoto on 19/04/2024.
//

import Foundation

class AdminModel: ObservableObject{
    var dataController = DataController.shared
    
    func getUsers() -> [User]{
        let users = dataController.getUsers()
        
        return users.filter{
            user in
            if user.isAdmin{
                return false
            } else{
                return true
            }
        }
    }
}
