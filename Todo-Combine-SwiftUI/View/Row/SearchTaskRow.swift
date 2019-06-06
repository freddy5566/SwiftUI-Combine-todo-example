//
//  SearchTaskRow.swift
//  Todo-Combine-SwiftUI
//
//  Created by jamfly on 2019/6/6.
//  Copyright © 2019 jamfly. All rights reserved.
//

import SwiftUI

struct SearchTaskRow: View {
  @EnvironmentObject var viewModel: SearchTaskViewModel
  @State var task: Task

  var body: some View {
    VStack(alignment: .leading) {

      Text(task.priority)
        .font(.callout)
        .frame(width: 150, height: 30)
        .background(Color.red)
        .cornerRadius(10)

      HStack {
        Text(task.name)
          .font(.largeTitle)

        Spacer()

        VStack(alignment: .leading) {
          Button(action: {}) {
            Text("Done")
            }
            .font(.body)
            .frame(width: 100)
            .background(Color.pink)
            .cornerRadius(10)

          Spacer()

          Button(action: {}) {
            Text("Edit")
          }
          .font(.body)
          .frame(width: 100)
          .background(Color.pink)
          .cornerRadius(10)
        }
        .padding(.vertical)

      }
      .frame(height: 60)

      HStack {
        Text(task.description)

        Spacer()

        Text("created: " + task.date)
      }

    }
  }

}

