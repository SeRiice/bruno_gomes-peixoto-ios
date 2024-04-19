//
//  ShowNextView.swift
//  TestSubDeVinci
//
//  Created by Bruno Gomes Peixoto on 19/04/2024.
//

import SwiftUI

struct ShowNextView: View {
    @Binding var userNickname: String
    @StateObject var model = ShowNextModel()
    
    var body: some View {
        if model.userIsAdmin(nickname: userNickname){
            AdminView()
        }
        else if let grade = model.userHaveGrade(nickname: userNickname){
            Text(grade)
        } else{
            QcmView(userNickname: $userNickname)
        }
    }
}

#Preview {
    ShowNextView(userNickname: .constant(""))
}
