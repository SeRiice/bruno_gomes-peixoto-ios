//
//  ShowNextModel.swift
//  TestSubDeVinci
//
//  Created by Bruno Gomes Peixoto on 19/04/2024.
//

import Foundation

class ShowNextModel: ObservableObject{
    var dataController = DataController.shared
    
    func userHaveGrade(nickname: String) -> String?{
        return dataController.getGrade(of: nickname)
    }
    
    func userIsAdmin(nickname: String) -> Bool{
        if let user = dataController.getUser(nickname: nickname){
            return user.isAdmin
        }
        
        return false
    }
}
