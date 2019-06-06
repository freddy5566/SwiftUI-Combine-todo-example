//
//  NewTaskView.swift
//  Todo-Combine-SwiftUI
//
//  Created by jamfly on 2019/6/6.
//  Copyright © 2019 jamfly. All rights reserved.
//

import SwiftUI

struct NewTaskView: View {
  @EnvironmentObject var viewModel: SearchTaskViewModel

  var body: some View {
    Button(action: { self.viewModel.addTask() }) {
      Text("new")
    }
  }


}
