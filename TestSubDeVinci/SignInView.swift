//
//  SignInView.swift
//  TestSubDeVinci
//
//  Created by Bruno Gomes Peixoto on 19/04/2024.
//

import SwiftUI

struct SignInView: View {
    @Binding var showNext: Bool
    @Binding var userNickname: String
    @StateObject private var model = SignInModel()
    
    var body: some View {
        Section{
            TextField("Nickname", text: $model.nickname)
            SecureField("Password", text: $model.password)
            Button("SIGN IN", action: {
                if model.signIn(){
                    showNext = true
                    userNickname = model.nickname
                }
            }).foregroundStyle(.black).bold()
        }.alert(isPresented: $model.error){
            Alert(title: Text(model.errorMessage))
        }
    }
}

#Preview {
    SignInView(showNext: .constant(false), userNickname: .constant(""))
}
