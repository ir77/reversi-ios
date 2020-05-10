//
//  Presenter.swift
//  Reversi
//
//  Created by ucuc on 2020/05/10.
//  Copyright © 2020 Yuta Koshizawa. All rights reserved.
//

import Foundation

protocol PresenterInputPort {}

protocol PresenterOutputPort {}

struct Presenter: PresenterInputPort {
    let outputPort: PresenterOutputPort
}
