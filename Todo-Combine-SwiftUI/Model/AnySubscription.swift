//
//  AnySubscription.swift
//  Todo-Combine-SwiftUI
//
//  Created by jamfly on 2019/6/6.
//  Copyright © 2019 jamfly. All rights reserved.
//

import Combine

final class AnySubscription: Subscription {
  private let cancellable: Cancellable

  init(_ cancel: @escaping () -> Void) {
    cancellable = AnyCancellable(cancel)
  }

  func request(_ demand: Subscribers.Demand) {}

  func cancel() {
    cancellable.cancel()
  }
}
