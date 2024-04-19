//
//  SignUpModel.swift
//  TestSubDeVinci
//
//  Created by Bruno Gomes Peixoto on 19/04/2024.
//

import Foundation
import SwiftUI

class SignUpModel: ObservableObject{
    var dataController = DataController.shared
    
    @Published var nickname = ""
    @Published var firstname = ""
    @Published var lastname = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var isAdmin = false
    @Published var error = false
    @Published var errorMessage = ""
    
    func fieldsAreEmpty() -> Bool{
        if (nickname.isEmpty || firstname.isEmpty || lastname.isEmpty || password.isEmpty || confirmPassword.isEmpty){
            error = true
            errorMessage = "All fields are required!"
            
            return true
        }
        
        return false
    }
    
    func passwordsAreNotEqual() -> Bool{
        if password != confirmPassword{
            error = true
            errorMessage = "Passwords must be equal!"
            
            return true
        }
        
        return false
    }
    
    func resetAttributes(){
        nickname = ""
        firstname = ""
        lastname = ""
        password = ""
        confirmPassword = ""
        isAdmin = false
        error = false
        errorMessage = ""
    }
    
    func addUser(){
        if fieldsAreEmpty(){
            return
        }
        
        if passwordsAreNotEqual(){
            return
        }
        
        let users = dataController.getUsers()
        
        for user in users{
            if user.nickname == nickname{
                error = true
                errorMessage = "User with this nickname already exists."
                
                return
            }
        }
        
        let newUser = User(context: dataController.viewContext)
        newUser.id = UUID()
        newUser.nickname = nickname
        newUser.firstname = firstname
        newUser.lastname = lastname
        newUser.password = password
        newUser.isAdmin = isAdmin
        try? dataController.viewContext.save()
        
        resetAttributes()
    }
}
