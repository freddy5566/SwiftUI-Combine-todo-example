//
//  SearchTaskViewModel.swift
//  Todo-Combine-SwiftUI
//
//  Created by jamfly on 2019/6/6.
//  Copyright © 2019 jamfly. All rights reserved.
//

import SwiftUI
import Combine

final class SearchTaskViewModel: BindableObject {

  // MARK: - Properties

  var didChange = PassthroughSubject<SearchTaskViewModel, Never>()

  private(set) var tasks = [
    Task(
      id: "mockID",
      name: "mockName",
      description: "mockDescription",
      priority: "heigh",
      done: false,
      date: "1997 1 31"
    )] {
    didSet {
      didChange.send(self)
    }
  }

  private var cancellable: Cancellable? {
    didSet { oldValue?.cancel() }
  }

  // MARK: - Public Method

  func searchTask(by name: String) {
    let posfix = name == "" ? "" : "/name/\(name)"
    guard let url = URL(string: Constants.baseURL + posfix) else { return }

    var request = URLRequest(url: url)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")

    name == "" ? fetchSearchAllTask(by: request) : fetchSearchTask(by: request)
  }

  func addTask(with task: Task) {
    guard let url = URL(string: Constants.baseURL) else { return }

    var request = getURLRequest(by: url)
    request.httpMethod = "POST"
    guard let data = try? JSONEncoder().encode(task) else { return }
    request.httpBody = data

    postTask(by: request)
  }

  // MARK: - Private Method

  private func getURLRequest(by url: URL) -> URLRequest {
    var request = URLRequest(url: url)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    return request
  }

}

// MARK: - APIs

extension SearchTaskViewModel {

  private func fetchSearchTask(by request: URLRequest) {
    let assign = Subscribers.Assign(object: self, keyPath: \.tasks)
    cancellable = assign

    URLSession.shared.send(request: request)
      .map {  $0.data }
      .decode(type: Task.self, decoder: JSONDecoder())
      .map { [$0].filter { !$0.done }}
      .replaceError(with: [])
      .receive(subscriber: assign)
  }

  private func fetchSearchAllTask(by request: URLRequest) {
    let assign = Subscribers.Assign(object: self, keyPath: \.tasks)
    cancellable = assign

    URLSession.shared.send(request: request)
      .map { $0.data }
      .decode(type: [Task].self, decoder: JSONDecoder())
      .map { $0.filter { !$0.done }}
      .replaceError(with: [])
      .receive(subscriber: assign)
  }

  private func postTask(by request: URLRequest) {
    let assign = Subscribers.Assign(object: self, keyPath: \.tasks)
    cancellable = assign

    URLSession.shared.send(request: request)
      .map { $0.data }
      .decode(type: Task.self, decoder: JSONDecoder())
      .map { [$0].filter { !$0.done } }
      .map { self.tasks + $0 }
      .replaceError(with: [])
      .receive(subscriber: assign)
  }

}
