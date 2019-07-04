//
//  UserSettings.swift
//  Tood
//
//  Created by Torge Adelin on 01/07/2019.
//  Copyright © 2019 Torge Adelin. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import Firebase

final class UserSettings: BindableObject {
    
    let didChange = PassthroughSubject<UserSettings, Never>()
    
    var todos: [TodoItem] = [] {
        didSet {
            didChange.send(self)
        }
    }
        
    var displayEdit: Bool = false {
        didSet {
            didChange.send(self)
        }
    }
    
    lazy private var baseQuery: Query = {
        return Firestore.firestore().collection("todos")
    }()
    
    lazy private var dataSource = LocalCollection<TodoItem>(query: baseQuery, updateHandler: self.updateHandler)
    
    init() {
        dataSource.listen()
        print("LOLL \(dataSource.count)")
    }
    
    func updateHandler(change: [DocumentChange]) -> () {
        todos = dataSource.items
    }
    
    
}
