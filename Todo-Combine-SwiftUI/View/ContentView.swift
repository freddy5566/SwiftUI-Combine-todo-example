//
//  ContentView.swift
//  Todo-Combine-SwiftUI
//
//  Created by jamfly on 2019/6/6.
//  Copyright © 2019 jamfly. All rights reserved.
//

import SwiftUI

struct ContentView : View {
  @EnvironmentObject var viewModel: SearchTaskViewModel
  @State var text = ""
  
  var body: some View {
    NavigationView {

      VStack {
        SearchTaskBar(text: $text) {
          self.viewModel.searchTask(by: self.$text.value)
        }

        List(viewModel.tasks) { task in
          SearchTaskRow(task: task)
        }

        NavigationButton(destination: NewTaskView()) {
          Text("new task")
            .font(.title)
            .foregroundColor(.white)
        }

        }
        .navigationBarTitle(Text("Tasks"))

      }
      .colorScheme(.dark)

  }
  
  
  
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
#endif
