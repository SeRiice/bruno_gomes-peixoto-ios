//
//  AdminView.swift
//  TestSubDeVinci
//
//  Created by Bruno Gomes Peixoto on 19/04/2024.
//

import SwiftUI

struct AdminView: View {
    @StateObject var model = AdminModel()
    
    var body: some View {
        List(model.getUsers()){
            user in
            Section("\(user.firstname!) \(user.lastname!)"){
                Text(user.grade ?? "No grade yet.")
            }
        }
    }
}

#Preview {
    AdminView()
}
