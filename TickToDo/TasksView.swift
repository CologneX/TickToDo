//
//  TasksView.swift
//  TickToDo
//
//  Created by MacBook Pro on 24/11/23.
//
import SwiftUI
extension View {
    func border(width: CGFloat, edges: [Edge], color: Color) -> some View {
        overlay(EdgeBorder(width: width, edges: edges).foregroundColor(color))
    }
}
struct EdgeBorder: Shape {
    var width: CGFloat
    var edges: [Edge]
    
    func path(in rect: CGRect) -> Path {
        edges.map { edge -> Path in
            switch edge {
            case .top: return Path(.init(x: rect.minX, y: rect.minY, width: rect.width, height: width))
            case .bottom: return Path(.init(x: rect.minX, y: rect.maxY - width, width: rect.width, height: width))
            case .leading: return Path(.init(x: rect.minX, y: rect.minY, width: width, height: rect.height))
            case .trailing: return Path(.init(x: rect.maxX - width, y: rect.minY, width: width, height: rect.height))
            }
        }.reduce(into: Path()) { $0.addPath($1) }
    }
}

// make a TaskPriority struct that has these types of High, Medium and Low
enum TaskPriority {
    case High
    case Medium
    case Low
}


struct Task: Identifiable {
    let id = UUID()
    var title: String
    var date: Date
    var priority: TaskPriority
    var note: String
    var reminder: Bool
    var group: String
    @State var status: Bool
}
var Tasks: [Task] = [
    // make 5 random tasks
    Task(title: "Task 1", date: Date(), priority: .High, note: "", reminder: false, group: "Study", status: true),
    Task(title: "Task 2", date: Date(), priority: .Medium, note: "", reminder: false, group: "Study", status: false),
    Task(title: "Task 3", date: Date(), priority: .Low, note: "", reminder: false, group: "Study", status: true),
    Task(title: "Task 4", date: Date(), priority: .High, note: "", reminder: false, group: "Study", status: false),
    Task(title: "Task 5", date: Date(), priority: .Medium, note: "", reminder: false, group: "Study", status: true),
    
]
struct TasksView: View {
    @State private var date = Date()
    // make new initial value of Tasks with the type of Task
    
    
    var body: some View {
        VStack {
            DatePicker(
                "Start Date",
                selection: $date,
                displayedComponents: [.date]
            )
            .datePickerStyle(.graphical)
            .padding(8)
            
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color(hex: 0xDE83B0), Color(hex: 0x270D49)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .cornerRadius(10)
            )
            
            ScrollView{
                ForEach(Tasks) { task in
                    TaskCard(data: task)
                }
            }
            Spacer()
        }
        .padding()
    }
}

struct TaskCard: View {
    @State var data: Task
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(data.title)
                    .font(.subheadline)
                HStack{
                    Image(systemName: "calendar")
                    Text("\(getDate(date: data.date))")
                        .font(.caption)
                }
            }
         
            Spacer()
            Button(action: {
                $data.status.wrappedValue.toggle()
            }) {
                if $data.status.wrappedValue {
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.green)
                } else {
                    Image(systemName: "circle")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.gray)
                        .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(hex: 0x8F8F8F, alpha: 0.5))
                .border(width: 10, edges: [.leading], color:  data.priority == .High ? Color(hex: 0xBA83DE) :
                            data.priority == .Medium ? Color(hex: 0xD7F0FF) : Color(hex: 0xFAD9FF))
                .cornerRadius(10)
                .frame(maxWidth: .infinity)
            
        )
    }
}


extension Color {
    init(hex: Int, alpha: Double = 1.0) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 8) & 0xff) / 255,
            blue: Double(hex & 0xff) / 255,
            opacity: alpha
        )
    }
}



#Preview {
    TasksView()
}
