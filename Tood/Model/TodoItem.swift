//
//  File.swift
//  Tood
//
//  Created by Torge Adelin on 01/07/2019.
//  Copyright © 2019 Torge Adelin. All rights reserved.
//
import Foundation
import SwiftUI
import Firebase

struct TodoItem: Identifiable, Hashable, Codable {
    var documentID: String
    var id: String
    var done: Bool = false
    var title: String
    var text: String
    var category: String
    
}

extension TodoItem: DocumentSerializable {
    init?(documentID: String, dictionary: [String: Any]) {
        guard let done = dictionary["done"] as? Bool,
            let title = dictionary["title"] as? String,
            let text = dictionary["text"] as? String,
            let category = dictionary["category"] as? String
        else { return nil }
 
        self.init(
            documentID: documentID
            done: done,
            title: title,
            text: text,
            category: category
        )
    }
    
    init?(document: QueryDocumentSnapshot) {
        self.init(documentID: document.documentID, dictionary: document.data())
    }
}

//Don't forget to remove
let data = [
    TodoItem(done: false, title: "Buy Veggies", text: "Text", category: "Sports"),
     TodoItem(done: false, title: "Go to shopping with Rusti", text: "Text", category: "Sports"),
     TodoItem(done: false, title: "Love Clement", text: "Text", category: "Sports")
]
