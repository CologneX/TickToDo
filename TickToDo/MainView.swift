//
//  MainView.swift
//  TickToDo
//
//  Created by MacBook Pro on 24/11/23.
//

import SwiftUI

struct MainView: View {
    @State private var TaskSearch: String = ""
    var body: some View {
        
        VStack(
            // make space bigger
            spacing: 30
        ){
            HStack {
                ZStack(alignment: .leading) {
                    TextField("Search Task Here", text: $TaskSearch)
                        .padding(EdgeInsets(top: 8, leading: 34, bottom: 8, trailing: 8)) // Adjust the leading value
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(.leading, 8)
                }
            }
            VStack{
                Text("Progress")
                // make the text to the left.
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                VStack(spacing: 10){
                    Text("Daily Task")
                        .font(.title3)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("2/4 Task Completed")
                        .font(.callout)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    HStack(alignment: .bottom){
                        Text("You are almost done")
                            .font(.subheadline)
                            .fontWeight(.thin)
                        Spacer()
                        Text("66%")
                        
                        
                    }
                    
                    ProgressView(value: 0.66)
                        .progressViewStyle(LinearProgressViewStyle(tint: Color(hex: 0x854F6C)))
                        .background(Color(hex: 0xBA83DE, alpha: 0.41))
                        .frame(height: 18)
                        .scaleEffect(x: 1, y: 18, anchor: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    
                    
                    
                }
                // make a card with black background that tas 0.3 opacity.
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 150, alignment: .leading)
                .background(Color.black.opacity(0.25))
                .cornerRadius(20)
            }
            HStack{
                Text("Today's Tasks")
                    .font(.title2)
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("See All")
                        .font(.subheadline)
                        .fontWeight(.light)
                })
            }
            ScrollView{
                ForEach(Tasks) { task in
                    TaskCard(data: task)
                }
            }
            
        }
       // padding all except bottom
        .padding(.horizontal)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    MainView()
}
