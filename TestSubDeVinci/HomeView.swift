//
//  HomeView.swift
//  TestSubDeVinci
//
//  Created by Bruno Gomes Peixoto on 19/04/2024.
//

import SwiftUI

struct HomeView: View {
    @State var showNext = false
    @State var userNickname = ""
    @State var path = NavigationPath()
    
    var body: some View {
        
        if showNext {
            ShowNextView(userNickname: $userNickname)
        } else{
            Form{
                SignInView(showNext: $showNext, userNickname: $userNickname)
                SignUpView()
            }
        }
        if showNext{
            Button(action: {
                showNext = false
            }, label: {
                Text("Logout").padding(.all)
            })
        }}
}

#Preview {
    HomeView()
}
