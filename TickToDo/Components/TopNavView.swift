//
//  TopNavView.swift
//  TickToDo
//
//  Created by MacBook Pro on 24/11/23.
//

import SwiftUI
struct TopNavView: View {
    @Binding var currentTab: Int

    var body: some View {
        HStack {
            if currentTab == 0 {
                Text("You have got 4 tasks today to complete")
                    .font(.title2)
                    .fontWeight(.semibold)
            } else {
                Image("Logo")
                    .resizable()
                    .frame(width: 45, height: 45)
            }
            Spacer()
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
        }
        .padding()
    }
}
#Preview {
    TopNavView(currentTab: .constant(0))
}
