//
//  SearchTaskBar.swift
//  Todo-Combine-SwiftUI
//
//  Created by jamfly on 2019/6/6.
//  Copyright © 2019 jamfly. All rights reserved.
//

import SwiftUI

struct SearchTaskBar: View {
  @Binding var text: String
  @State var action: () -> Void

  var body: some View {
    ZStack {
      HStack {
        TextField(
          $text,
          placeholder: Text("Search task")
            .color(.white)
          )
          .padding([.leading, .trailing], 8)
          .frame(height: 32)
          .background(Color.white.opacity(0.4))
          .cornerRadius(8)

        Button(
          action: action,
          label: { Text("Search") }
          )
          .foregroundColor(.white)
        }
        .padding([.leading, .trailing], 16)
      }
      .frame(height: 64)
      .background(Color.black)
  }


}

