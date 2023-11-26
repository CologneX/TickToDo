//
//  ContentView.swift
//  TickToDo
//
//  Created by MacBook Pro on 24/11/23.
//

import SwiftUI
struct ContentView: View {
    @State private var selectedView: Int = 2
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                Color.init(hex: 0x515152)
                    .opacity(0.3)
                    .edgesIgnoringSafeArea(.all)
                Image("Bottom-Left")
                    .resizable()
                    .frame(width: 200, height: 300) // Adjust frame size
                    .shadow(color: Color(hex: 0x92D2FF), radius: 200)
                    .offset(x: -200, y: 30) // Adjust offset values
                    .blur(radius: 15)
                
                Image("Bottom-Right")
                    .resizable()
                    .frame(width: 300, height: 300) // Adjust frame size
                    .shadow(color: .white, radius: 200)
                    .offset(x: 0, y: 50) // Adjust offset values
                    .blur(radius: 15)
                
                Image("Upper-Right")
                    .resizable()
                    .frame(width: 400, height: 600) // Adjust frame size
                    .shadow(color: Color(hex: 0xB064E9), radius: 200)
                    .offset(x: 0, y: -350) // Adjust offset values
                    .blur(radius: 15)
                
                Image("Upper-Left")
                    .resizable()
                    .frame(width: 400, height: 600) // Adjust frame size
                    .shadow(color: Color(hex: 0xADFFF0), radius: 200)
                    .offset(x: -50, y: -200) // Adjust offset values
                    .blur(radius: 15)
                
                VStack {
                    if (selectedView != 2) {
                        TopNavView(currentTab: $selectedView)
                        
                    }
                    
                    switch selectedView {
                    case 0:
                        MainView()
                    case 1:
                        TasksView()
                    case 2:
                        ProfileView()
                    default:
                        EmptyView()
                    }
                    Spacer()
                    
                    Picker(selection: $selectedView, label: Text("")) {
                        Image(systemName: "house.circle.fill").tag(0)
                        Image(systemName: "list.bullet.circle.fill").tag(1)
                        Image(systemName: "person.circle.fill").tag(2)
                    }
                    .padding()
                    .pickerStyle(SegmentedPickerStyle())
                    .background(Color.black)
                    
                }
                
                NavigationLink {
                    NewTaskView()
                } label: {
                    FloatingButton(icon: "plus")
                }
                .offset(x: -35, y: -70)
            }
        }
    }
}




#Preview {
    ContentView()
}


