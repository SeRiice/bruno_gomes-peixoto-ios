//
//  QcmView.swift
//  TestSubDeVinci
//
//  Created by Bruno Gomes Peixoto on 19/04/2024.
//

import SwiftUI

struct QcmView: View {
    @Binding var userNickname: String
    @State var index = 0
    @State var userAnswers: [Int] = []
    var model = Model()
    
    var body: some View {
        if index == model.questions.count{
            Text("Your grade: \(model.getGrade(of: userNickname))")
        } else {
            List{
                Section("Question \(index + 1)"){
                    Text(model.questions[index].statement)
                }
                Section("Choose answer"){
                    ForEach(Array(model.questions[index].proposal.enumerated()), id: \.offset){
                        proposalIndex, proposal in
                        HStack{
                            Text(proposal)
                        }.onTapGesture {
                            index += 1
                            userAnswers.append(proposalIndex)
                            
                            if index == model.questions.count{
                                model.saveGrade(of: userNickname, results: userAnswers)
                            }
                        }
                    }
                }
                
            }
        }
    }
}

#Preview {
    QcmView(userNickname: .constant(""))
}
