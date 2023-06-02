//
//  TasksAPIs.swift
//  Demo App 3
//
//  Created by BrainX Technologies on 01/06/2023.
//

import Combine
import Foundation

class TaskAPI {
    static let shared = TaskAPI()
    
    private let categories = [
        "health",
        "gratitude",
        "getItDone",
        "maybeLater",
        "bestPartOfMyDay",
        "myNotes"
    ]
    
    func getHealthTaskCount() -> AnyPublisher<Task, Error> {
        return getTaskCount(for: "health")
    }
    
    func getGratitudeTaskCount() -> AnyPublisher<Task, Error> {
        return getTaskCount(for: "gratitude")
    }
    
    func getGetItDoneTaskCount() -> AnyPublisher<Task, Error> {
        return getTaskCount(for: "getItDone")
    }
    
    func getMaybeLaterTaskCount() -> AnyPublisher<Task, Error> {
        return getTaskCount(for: "maybeLater")
    }
    
    func getBestPartOfMyDayTaskCount() -> AnyPublisher<Task, Error> {
        return getTaskCount(for: "bestPartOfMyDay")
    }
    
    func getMyNotesTaskCount() -> AnyPublisher<Task, Error> {
        return getTaskCount(for: "myNotes")
    }
    
    private func getTaskCount(for category: String) -> AnyPublisher<Task, Error> {
        return Just(category)
            .map { category -> Task in
                let totalTaskCount = Int.random(in: 5...20)
                let taskCount = Int.random(in: 0...totalTaskCount)
                return Task(category: category, taskCount: taskCount, totalTaskCount: totalTaskCount)
            }
            .setFailureType(to: Error.self)
            .delay(for: .seconds(2), scheduler: DispatchQueue.global())
            .eraseToAnyPublisher()
    }
}


