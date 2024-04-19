//
//  SignUpView.swift
//  TestSubDeVinci
//
//  Created by Bruno Gomes Peixoto on 19/04/2024.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var model = SignUpModel()
    
    var body: some View {
        Section{
            TextField("Nickname", text: $model.nickname)
            TextField("First name", text: $model.firstname)
            TextField("Last name", text: $model.lastname)
            SecureField("Password", text: $model.password)
            SecureField("Confirm password", text: $model.confirmPassword)
            Toggle("Admin", isOn: $model.isAdmin)
            Button("SIGN UP", action: {model.addUser()}).foregroundStyle(.black).bold()
        }.alert(isPresented: $model.error){
            Alert(title: Text(model.errorMessage))
        }
    }
}

#Preview {
    SignUpView()
}
