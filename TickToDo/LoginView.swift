//
//  LoginView.swift
//  TickToDo
//
//  Created by MacBook Pro on 24/11/23.
//
import SwiftUI
import Supabase
struct LoginView: View {
    @State var Username: String = ""
    
  var body: some View {
    ZStack() {
      ZStack() {
        Rectangle()
          .foregroundColor(.clear)
          .frame(width: 405, height: 409)
          .background(
            Image("Logo")
                .resizable()
            )
          .offset(x: 0, y: 0)
      }
      .frame(width: 405, height: 409)
      .offset(x: 3, y: -227.50)
      Text("Sign In")
        .font(Font.custom("Roboto", size: 32).weight(.bold))
        .lineSpacing(8)
        .foregroundColor(.white)
        .offset(x: 0.50, y: -54)
      Text("Don’t have an account? \n")
        .font(Font.custom("Roboto", size: 16))
        .lineSpacing(22)
        .foregroundColor(.white)
        .offset(x: 0, y: 236)
      Text("Register Here!")
        .font(Font.custom("Roboto", size: 16).weight(.heavy))
        .lineSpacing(22)
        .underline()
        .foregroundColor(.white)
        .offset(x: 0.50, y: 247)
      ZStack() {
        Rectangle()
          .foregroundColor(.clear)
          .frame(width: 355, height: 53)
          .background(Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0.13))
          .cornerRadius(8)
          .offset(x: 0, y: 0)
          .shadow(
            color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4, y: 4
          )
          TextField("Username", text: $Username)
          .font(Font.custom("Roboto", size: 16))
          .lineSpacing(8)
          .foregroundColor(Color(red: 0.59, green: 0.59, blue: 0.59))
          .offset(x: -81, y: 1.50)
      }
      .frame(width: 355, height: 53)
      .offset(x: 0, y: 26.50)
      ZStack() {
        Rectangle()
          .foregroundColor(.clear)
          .frame(width: 355, height: 53)
          .background(Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0.13))
          .cornerRadius(8)
          .offset(x: 0, y: 0)
          .shadow(
            color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4, y: 4
          )
        Text("Password")
          .font(Font.custom("Roboto", size: 16))
          .lineSpacing(8)
          .foregroundColor(Color(red: 0.59, green: 0.59, blue: 0.59))
          .offset(x: -82, y: 0.50)
        HStack(spacing: 0) {
          ZStack() { }
          .frame(width: 28, height: 28)
        }
        .padding(EdgeInsets(top: 0, leading: 5, bottom: 2, trailing: 0))
        .frame(width: 30, height: 30)
        .offset(x: -152.50, y: -0.50)
      }
      .frame(width: 355, height: 53)
      .offset(x: 0, y: 93.50)
      ZStack() {
        Rectangle()
          .foregroundColor(.clear)
          .frame(width: 128, height: 44)
          .background(
            LinearGradient(gradient: Gradient(colors: [Color(red: 0, green: 0.48, blue: 1), Color(red: 0.63, green: 0.35, blue: 1), Color(red: 0.87, green: 0.51, blue: 0.69)]), startPoint: .trailing, endPoint: .leading)
          )
          .cornerRadius(50)
          .offset(x: 0, y: 0)
        Text("Sign In")
          .font(Font.custom("Roboto", size: 16).weight(.semibold))
          .lineSpacing(8)
          .foregroundColor(.white)
          .offset(x: 0, y: 0)
      }
      .frame(width: 128, height: 44)
      .offset(x: 0.50, y: 167)
      ZStack() {
        ZStack() {

        }
        .frame(width: 390, height: 30)
        .offset(x: 0, y: -7)
        HStack(spacing: 4) {
          ZStack() {

          }
          .frame(width: 20, height: 14)
          VStack(spacing: -0.85) {

          }
          .padding(EdgeInsets(top: 2, leading: 1, bottom: 2, trailing: 0.75))
          .frame(width: 16, height: 14)
          ZStack() {
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 19, height: 8)
              .background(Color(red: 1, green: 1, blue: 1))
              .cornerRadius(1)
              .offset(x: -1, y: 0)
          }
          .frame(width: 25, height: 14)
        }
        .offset(x: 146.50, y: 1)
        ZStack() {

        }
        .frame(width: 6, height: 6)
        .offset(x: 121, y: -11)
        HStack(spacing: 0) {
          HStack(spacing: 0) {

          }
          .padding(EdgeInsets(top: 2, leading: 2, bottom: 1.91, trailing: 2.57))
          .frame(width: 33, height: 15)
        }
        .padding(EdgeInsets(top: 3, leading: 11, bottom: 3, trailing: 10))
        .frame(width: 54, height: 21)
        .cornerRadius(20)
        .offset(x: -147, y: 0.50)
      }
      .frame(width: 390, height: 44)
      .offset(x: -1.50, y: -404)
    }
    .frame(width: 393, height: 852)
    .background(
      LinearGradient(gradient: Gradient(colors: [.black, Color(red: 0.33, green: 0.16, blue: 0.36)]), startPoint: .top, endPoint: .bottom)
    )
    .cornerRadius(20);
  }
}

#Preview {
    LoginView()
}
