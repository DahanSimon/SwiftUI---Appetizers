//
//  Alert.swift
//  SwiftUI - Appetizers
//
//  Created by Simon Dahan on 19/12/2022.
//

import SwiftUI

struct AlertItem: Identifiable {
    var id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    //MARK: - Network Alerts
    static let invalidURL   = AlertItem(title: Text("Server"),
                                      message: Text("There was an issue connecting to the server"),
                                      dismissButton: .default(Text("Ok")))
    
    static let invalidData  = AlertItem(title: Text("Server Error"),
                                       message: Text("The data received was invalid"),
                                       dismissButton: .default(Text("Ok")))
    
    static let invalidResponse  = AlertItem(title: Text("Server Error"),
                                       message: Text("The response received was invalid"),
                                       dismissButton: .default(Text("Ok")))
    
    static let unableToComplete  = AlertItem(title: Text("Server Error"),
                                       message: Text("Check internet connection"),
                                       dismissButton: .default(Text("Ok")))
    
    
    //MARK: - Account Alerts
    static let accountFormNotFullyFilled  = AlertItem(title: Text("Fields Empty"),
                                                      message: Text("Please make sur you filled all fields"),
                                                      dismissButton: .default(Text("Ok")))
    
    static let invalidEmail  = AlertItem(title: Text("Invalid Email"),
                                       message: Text("Please enter a valid email"),
                                       dismissButton: .default(Text("Ok")))
    
    static let userSaveSuccess  = AlertItem(title: Text("Profile Saved"),
                                       message: Text("Succesfully Saved"),
                                       dismissButton: .default(Text("Ok")))
    
    static let invalidUserData  = AlertItem(title: Text("Profile Error"),
                                       message: Text("An occured while saving or retreiving your profile"),
                                       dismissButton: .default(Text("Ok")))
}
