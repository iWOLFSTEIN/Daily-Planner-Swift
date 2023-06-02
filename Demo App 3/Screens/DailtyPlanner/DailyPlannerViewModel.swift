//
//  DailyPlannerViewModel.swift
//  Demo App 3
//
//  Created by BrainX Technologies on 01/06/2023.
//

import Combine
import Foundation

class DailyPlannerViewModel {
    var quoteRepository: QuoteRepository!
    var taskRepository: TaskRepository!
    
    @Published var quoteAuthor: String?
    @Published var quoteText: String?
    
    @Published var tasksCountDictionaryList: [[String: String]] = []
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        let apiManager = LocalAPIManager()
        quoteRepository = QuoteRepository(apiManager: apiManager)
        taskRepository = TaskRepository(apiManager: apiManager)
        getQuote()
        getTasks()
    }
    
    func getQuote() {
        quoteRepository.getRandomQuoteFromAPI()
            .sink {
                completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { [weak self] quote in
                self?.quoteAuthor = quote.author
                self?.quoteText = quote.text
            }
            .store(in: &cancellables)
    }
    
    func getTasks() {
        let taskList: [AnyPublisher<Task, Error>] = taskRepository.getAllTasks()
        
        Publishers.MergeMany(taskList)
            .collect()
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { [weak self] tasks in
                self?.tasksCountDictionaryList = tasks.map { task in
                    var taskDictionary: [String: String] = [:]
                    taskDictionary["taskCount"] = String(task.taskCount)
                    taskDictionary["totalTaskCount"] = String(task.totalTaskCount)
                    return taskDictionary
                }
            }
            .store(in: &cancellables)
    }
}
