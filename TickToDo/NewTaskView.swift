//
//  NewTaskView.swift
//  TickToDo
//
//  Created by MacBook Pro on 24/11/23.
//

import SwiftUI
import Foundation
func getDate(date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/yyyy"
    let result = dateFormatter.string(from: date)
    return result
}

struct NewTaskView: View {
    @State var NewTask = Task(title: "Makan Tai", date: Date(), priority: .High, note: "Disini", reminder: false, group: "Study", status: false)
    @State private var isDatePickerVisible = false
    @State var selectedTaskGroup: String = "Study"
    var body: some View {
        NavigationStack(root: {
            // make a checkbox that has High, Medium and Low options
            VStack {
                
                Picker("Group", selection: $selectedTaskGroup) {
                    ForEach(["Study", "Play"], id: \.self) {
                        Text($0)
                    }
                    
                }
                
                .pickerStyle(.navigationLink)
                .padding()
                .background(Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0.13))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .inset(by: 0.25)
                        .stroke(.white, lineWidth: 0.25)
                )
                .shadow(
                    color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4, y: 4
                )
                
                
                VStack{
                    Text("Task Name")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    TextField("Task 1", text: $NewTask.title)
                        .padding()
                        .background(Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0.13))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .inset(by: 0.25)
                                .stroke(.white, lineWidth: 0.25)
                        )
                        .shadow(
                            color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4, y: 4
                        )
                    
                    
                    HStack{
                        Image(systemName: "calendar")
                            .foregroundColor(.purple)
                        Text("Date")
                        Spacer()
                        
                        DatePicker("", selection: $NewTask.date, displayedComponents: [.date])
                            .datePickerStyle(.compact)
                            .labelsHidden()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0.13))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .inset(by: 0.25)
                            .stroke(.white, lineWidth: 0.25)
                    )
                    .shadow(
                        color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4, y: 4
                    )
                    VStack{
                        HStack{
                            Image(systemName: "clock")
                                .foregroundColor(.purple)
                            Text("Reminder")
                            Spacer()
                            Toggle("", isOn: $NewTask.reminder)}
                        if (NewTask.reminder) {
                            HStack{
                                Text("Time")
                                Spacer()
                                
                                DatePicker("", selection: $NewTask.date, displayedComponents: [.hourAndMinute])
                                    .datePickerStyle(.compact)
                                    .labelsHidden()
                            }
                        }
                        
                    }
                    
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0.13))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .inset(by: 0.25)
                            .stroke(.white, lineWidth: 0.25)
                    )
                    .shadow(
                        color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4, y: 4
                    )
                    
                    
                    Text("Note")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    TextEditor(text: $NewTask.note)
                        .padding(9)
                        .scrollContentBackground(.hidden)
                        .background(Color(red: 0.85, green: 0.85, blue: 0.85).opacity(0.13))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .inset(by: 0.25)
                                .stroke(.white, lineWidth: 0.25)
                        )
                        .shadow(
                            color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4, y: 4
                        )
                        .frame(height: 110)
                    
                    
                    
                    Text("Priority")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Picker("Priority", selection: $NewTask.priority) {
                        Text("High")
                            .tag(TaskPriority.High)
                        Text("Medium")
                            .tag(TaskPriority.Medium)
                        Text("Low")
                            .tag(TaskPriority.Low)
                    }
                    .pickerStyle(.segmented)
                    .colorMultiply(
                        $NewTask.wrappedValue.priority == .High ? Color(hex: 0xBA83DE) :
                            $NewTask.wrappedValue.priority == .Medium ? Color(hex: 0xD7F0FF) : Color(hex: 0xFAD9FF)
                    )
                    
                    
                    
                    Spacer()
                    Button(action: {
                        // save the task
                    }, label: {
                        HStack() {
                            Text("SUBMIT")
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                        }
                        .padding(
                            EdgeInsets(top: 12.50, leading: 16, bottom: 12.50, trailing: 16)
                        )
                        .frame(maxWidth: .infinity)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color(red: 0.03, green: 0.47, blue: 1), Color(red: 0.66, green: 0.37, blue: 0.96), Color(red: 0.86, green: 0.51, blue: 0.70)]), startPoint: .trailing, endPoint: .leading)
                        )
                        .cornerRadius(8)
                    })
                    
                }
            }
            .padding()
        })
        .navigationTitle("Create New Task")
        
    }
    
}

#Preview {
    NewTaskView()
}
