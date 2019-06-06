//
//  NewTaskView.swift
//  Todo-Combine-SwiftUI
//
//  Created by jamfly on 2019/6/6.
//  Copyright © 2019 jamfly. All rights reserved.
//

import SwiftUI

enum Priority: String {
  case heigh
  case medium
  case low
}

struct NewTaskView: View {

  @EnvironmentObject var viewModel: SearchTaskViewModel
  @State var nameText: String = ""
  @State var descriptionText: String = ""
  @State var priority = Priority.low


  var body: some View {

    VStack {
      TextField(
        $nameText,
        placeholder: Text("Input task name"),
        onCommit: {}
      )
      .font(.system(size: 16))
      .padding(8)
      .textFieldStyle(.roundedBorder)
      .background(Color.gray)

      TextField(
        $descriptionText,
        placeholder: Text("Please description the task"),
        onCommit: {}
      )
      .font(.system(size: 16))
      .padding(8)
      .textFieldStyle(.roundedBorder)
      .background(Color.gray)


      Button(action: { self.addTask() }) {
        Text("new")
          .font(.title)
          .foregroundColor(.white)
      }

    }

  }

  // MARK: - Private Method

  private func getCurrentTime() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy MM dd"
    return formatter.string(from: Date())
  }

  private func addTask() {
    let task = Task(
      id: "",
      name: nameText,
      description: descriptionText,
      priority: "low",
      done: false,
      date: getCurrentTime()
    )
    self.viewModel.addTask(with: task)
  }
  
}
