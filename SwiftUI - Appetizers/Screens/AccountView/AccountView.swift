//
//  AccountView.swift
//  SwiftUI - Appetizers
//
//  Created by Simon Dahan on 19/12/2022.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("First Name", text: $viewModel.user.firstName)
                    TextField("Last Name", text: $viewModel.user.lastName)
                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                    DatePicker("Birth Date", selection: $viewModel.user.birthDate, displayedComponents: .date)
                    Button {
                        viewModel.saveChanges()
                        print("Save")
                    } label: {
                        Text("Save Changes")
                    }

                } header: {
                    Text("Personnal Info")
                }
                
                
                Section {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)

                } header: {
                    Text("Requests")
                }
                .tint(.brandPrimary)
            }
            .navigationTitle("☺️ Account")
        }
        .onAppear {
            viewModel.retrieveUser()
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
