//
//  ProfileView.swift
//  TickToDo
//
//  Created by MacBook Pro on 24/11/23.
//

import SwiftUI
struct ProfileInformation {
    var name: String
    var email: String
    var gender: String
    var nickname: String
    var avatar: String
}
struct ProfileView: View {
    @State private var ProfileInfo: ProfileInformation = ProfileInformation(name: "Furina", email: "furina@gmail.com", gender: "CWK", nickname: "Furi-Furi", avatar: "https://picsum.photos/100/100")
    var body: some View {
       
        ZStack{
            Image("Profile-Middle")
                .resizable()
                .frame(width: 400, height: 300) // Adjust frame size
                .offset(x: 0, y: 0) // Adjust offset values
                .ignoresSafeArea()
            VStack(spacing: 30){
                AsyncImage(url: URL(string: ProfileInfo.avatar)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                }
                VStack{
                    Text(ProfileInfo.nickname)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.title2)
                    Text(ProfileInfo.email)
                        .font(.subheadline)
                }
                
            
          
                              .cornerRadius(10)
                List {
                    NavigationLink(){
                        
                    }
                    
                label:
                    {
                        
                        Label("Work Folder", systemImage: "newspaper")
                            .font(.subheadline)
                    }
                    NavigationLink(){
                    }
                label:
                    {
                        Label("Work Folder", systemImage: "bell")
                            .font(.subheadline)
                    }
                }
                .listStyle(.automatic)
                .listRowBackground(Color.black.opacity(0.1))
                .cornerRadius(20)
//                VStack(spacing: 15){
//                    HStack{
//                        NavigationLink(){
//                            
//                        }
//                        
//                    label:
//                        {
//                            
//                            Label("Work Folder", systemImage: "newspaper")
//                                .font(.subheadline)
//                        }
//                        Spacer()
//                    }
//                    HStack{
//                        
//                        NavigationLink(){
//                        }
//                    label:
//                        {
//                            Label("Work Folder", systemImage: "bell")
//                                .font(.subheadline)
//                        }
//                        Spacer()
//                    }
                    
                   
//                }
//                .padding()
//                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
//                .background(Color.black.opacity(0.5))
//                .cornerRadius(10)
                
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    ProfileView()
}
