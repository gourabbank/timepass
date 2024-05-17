//
//  TaskManager.swift
//  timepass
//
//  Created by Gourab Bank on 18/5/24.
//

import Foundation
class TaskManager: ObservableObject
{
    @Published var tasks:[Task]=[]
    {
        didSet
        {
            saveTasks()
        }
    }
    
    init()
    {
        loadTasks()
    }
    
    func addTask(title: String) {
        let task = Task(title: title)
        tasks.append(task)
    }
    
    func toggleTaskCompletion(task:Task)
    {
        if let index=tasks.firstIndex(where: {$0.id==task.id})
        {
            tasks[index].isCompleted.toggle()
        }
    }
    
    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
    
    private func saveTasks()
    {
        if let encoded = try? JSONEncoder().encode(tasks)
        {
            UserDefaults.standard.set(encoded, forKey: "tasks")
        }
    }
    
    private func loadTasks()
    {
        if let saveTasks = UserDefaults.standard.data(forKey: "tasks"),
           let decodedTasks = try? JSONDecoder().decode([Task].self, from: saveTasks)
        {
            tasks=decodedTasks
        }
            
    }
}
