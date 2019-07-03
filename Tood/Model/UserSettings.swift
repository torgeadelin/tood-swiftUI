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
    private var documents: [DocumentSnapshot] = []
    
    fileprivate var query: Query? {
        didSet {
            if let listener = listener {
                listener.remove()
                observeQuery()
            }
        }
    }
    
    private var listener: ListenerRegistration?
    
    fileprivate func observeQuery() {
        guard let query = query else { return }
        stopObserving()
        
        // Display data from Firestore, part one
        listener = query.addSnapshotListener { [unowned self] (snapshot, error) in
            guard let snapshot = snapshot else {
                print("Error fetching snapshot results: \(error!)")
                return
            }
            let models = snapshot.documents.map { (document) -> TodoItem in
                if let model = TodoItem(dictionary: document.data()) {
                    return model
                } else {
                    // Don't use fatalError here in a real app.
                    fatalError("Unable to initialize type \(TodoItem.self) with dictionary \(document.data())")
                }
            }
            self.todos = models
            self.documents = snapshot.documents
            
            if self.documents.count > 0 {
                print("got some data")
            } else {
                print("empty data")
            }
            
        }
    }
    
    fileprivate func stopObserving() {
        listener?.remove()
    }
    
    fileprivate func baseQuery() -> Query {
        return Firestore.firestore().collection("todos").limit(to: 50)
    }
    
    init() {
        query = baseQuery()
        observeQuery()
    }
    
}
