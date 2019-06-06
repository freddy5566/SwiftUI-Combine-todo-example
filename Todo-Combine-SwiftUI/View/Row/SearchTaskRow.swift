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
    HStack {
      Text("Task.....")
        .font(Font.system(size: 18).bold())
      Spacer()
      }
      .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
      .frame(height: 60)
  }

}

