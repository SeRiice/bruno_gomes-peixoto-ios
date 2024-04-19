//
//  SignInModel.swift
//  TestSubDeVinci
//
//  Created by Bruno Gomes Peixoto on 19/04/2024.
//

import Foundation

class SignInModel: ObservableObject{
    var dataController = DataController.shared
    
    @Published var nickname = ""
    @Published var password = ""
    @Published var isSignIn = false
    @Published var error = false
    @Published var errorMessage = ""
    
    func fieldsAreEmpty() -> Bool{
        if (nickname.isEmpty || password.isEmpty){
            error = true
            errorMessage = "All fields are required!"
            
            return true
        }
        
        return false
    }
    
    func resetAttributes(){
        nickname = ""
        password = ""
    }
    
    func signIn() -> Bool{
        if fieldsAreEmpty(){
            return false
        }
        
        let users = dataController.getUsers()
        
        for user in users{
            if (user.nickname == nickname && user.password == password){
                return true
            }
        }
        
        if !isSignIn{
            error = true
            errorMessage = "Invalid credentials!"
        }
        
        resetAttributes()
        
        return false
    }
}
