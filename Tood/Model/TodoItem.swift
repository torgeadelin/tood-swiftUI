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
    var id: String = "1"
    var done: Bool = false
    var title: String = "Title"
    var text: String = "Text"
    var category: String = "Sports"
    
    var dictionary: [String: Any] {
        return [
            "id": id,
            "done": done,
            "title": title,
            "text": text,
            "category": category
        ]
    }
    
    mutating func toggle() -> Void {
        self.done.toggle()
    }

}

extension TodoItem: DocumentSerializable {
    init?(dictionary: [String: Any]) {
        guard let done = dictionary["done"] as? Bool,
            let title = dictionary["title"] as? String,
            let text = dictionary["text"] as? String,
            let category = dictionary["category"] as? String
        else { return nil }
        
        
        
        self.init(
            done: done,
            title: title,
            text: text,
            category: category
        )
    }
}

//Don't forget to remove
let data = [
    TodoItem(done: false, title: "Buy Veggies", text: "Text", category: "Sports"),
     TodoItem(done: false, title: "Go to shopping with Rusti", text: "Text", category: "Sports"),
     TodoItem(done: false, title: "Love Clement", text: "Text", category: "Sports")
]
