//
//  Person.swift
//  AddressBook
//
//  Created by adam smith on 1/24/22.
//

import Foundation

class Person: Codable {
    let id: UUID
    var name: String
    var address: String
    
    init(id: UUID = UUID(), name: String, address: String) {
        self.id = id
        self.name = name
        self.address = address
    }
}

extension Person: Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.address == rhs.address
    }
}
