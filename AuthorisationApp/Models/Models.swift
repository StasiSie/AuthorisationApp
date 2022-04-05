//
//  Models.swift
//  AuthorisationApp
//
//  Created by Игорь Богданов on 05.04.2022.
//

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(login: "qwerty", password: "12345", person: Person.getPerson())
    }
}

struct Person {
    let name: String
    let surname: String
    let education: String
    let age: Int
    let hobbie1: String
    let hobbie2: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    static func getPerson() -> Person {
        Person(name: "Igor",
               surname: "Bogdanov",
               education: "Санкт-Петербургский Политехнический университет",
               age: 22,
               hobbie1: "играть в футбол",
               hobbie2: "собирать модели"
        )
        
    }
}
