//
//  Presenter.swift
//  Reversi
//
//  Created by ucuc on 2020/05/10.
//  Copyright © 2020 Yuta Koshizawa. All rights reserved.
//

import Foundation

protocol PresenterInputPort {
    func saveGame(status: String) throws
    func loadGame() throws -> Disk?
}

protocol PresenterOutputPort {}

struct Presenter {
    let outputPort: PresenterOutputPort
    
    var path: String {
        (NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true).first! as NSString).appendingPathComponent("Game")
    }
}

extension Presenter: PresenterInputPort {
    func saveGame(status: String) throws {
        do {
            try status.write(toFile: path, atomically: true, encoding: .utf8)
        } catch let error {
            throw FileIOError.read(path: path, cause: error)
        }
    }
    
    func loadGame() throws -> Disk? {
        return nil
    }
    
    enum FileIOError: Error {
        case write(path: String, cause: Error?)
        case read(path: String, cause: Error?)
    }
}
