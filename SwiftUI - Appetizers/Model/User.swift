//
//  User.swift
//  SwiftUI - Appetizers
//
//  Created by Simon Dahan on 20/12/2022.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthDate = Date()
    var extraNapkins = false
    var frequentRefills = false
}
