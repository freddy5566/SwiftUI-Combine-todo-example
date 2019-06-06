//
//  Task.swift
//  Todo-Combine-SwiftUI
//
//  Created by jamfly on 2019/6/6.
//  Copyright © 2019 jamfly. All rights reserved.
//

import Foundation
import SwiftUI

struct Task: Identifiable, Hashable, Decodable {

  // MARK: - Properties

  var id: String
  var name: String
  var description: String
  var priority: String
  var done: Bool

}

