//
//  Person.swift
//  ContactList
//
//  Created by BEREZIN Stanislav on 09.09.2020.
//  Copyright © 2020 BEREZIN Stanislav. All rights reserved.
//

struct Person {
    let firstName: String
    let lastName: String
    let phone: String
    let email: String
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}

extension Person {
    static func getPersons() -> [Person] {
        let dataManager = DataManager()
        var persons: [Person] = []
        let firstNames = dataManager.firstNames.shuffled()
        let lastNames = dataManager.lastNames.shuffled()
        let phones = dataManager.phones.shuffled()
        let emails = dataManager.emails.shuffled()
        
        for (firstName, (lastName, (phone, email))) in zip(firstNames, zip(lastNames, zip(phones, emails))) {
            let person = Person(firstName: firstName, lastName: lastName, phone: phone, email: email)
            persons.append(person)
        }
        return persons
    }
}
