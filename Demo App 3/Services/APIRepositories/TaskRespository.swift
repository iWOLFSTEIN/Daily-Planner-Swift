//
//  TaskRespository.swift
//  Demo App 3
//
//  Created by BrainX Technologies on 02/06/2023.
//

import Combine
import Foundation

class TaskRepository {
    var apiManager: APIManager!
    
    init(apiManager: APIManager!) {
        self.apiManager = apiManager
    }
    
    func getAllTasks() -> [AnyPublisher<Task, Error>] {
        var taskList: [AnyPublisher<Task, Error>] = []
        
        let publisherTaskList = [TaskAPI.shared.getHealthTaskCount(),
                                 TaskAPI.shared.getGratitudeTaskCount(),
                                 TaskAPI.shared.getGetItDoneTaskCount(),
                                 TaskAPI.shared.getMaybeLaterTaskCount(),
                                 TaskAPI.shared.getBestPartOfMyDayTaskCount(),
                                 TaskAPI.shared.getMyNotesTaskCount()
        ]
        
        for task in publisherTaskList {
            let taskPublisher = apiManager.performRequest(on: task)
            taskList.append(taskPublisher)
        }
       
        return taskList
    }
}


