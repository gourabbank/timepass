import SwiftUI

struct ContentView: View {
    @ObservedObject private var taskManager = TaskManager()
    @State private var newTaskTitle = ""

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("New Task", text: $newTaskTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    Button(action: {
                        guard !newTaskTitle.isEmpty else { return }
                        taskManager.addTask(title: newTaskTitle)
                        newTaskTitle = ""
                    }) {
                        Image(systemName: "plus")
                            .padding()
                    }

                }
//comments
                List {
                    ForEach(taskManager.tasks) { task in
                        HStack {
                            Text(task.title)
                            Spacer()
                            Button(action: {
                                taskManager.toggleTaskCompletion(task: task)
                            }) {
                                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(task.isCompleted ? .green : .gray)
                            }
                        }
                    }
                    .onDelete(perform: taskManager.deleteTask)
                }
            }
            .navigationTitle("To-Do List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
