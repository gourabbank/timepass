//
//  Task.swift
//  timepass
//
//  Created by Gourab Bank on 18/5/24.
//

import Foundation
struct Task: Identifiable, Codable
{
    var id = UUID()
    var title: String
    var isCompleted: Bool = false
}
