//
//  AppetizerListView.swift
//  SwiftUI - Appetizers
//
//  Created by Simon Dahan on 19/12/2022.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.appetizers) { appetizer in
                    AppetizerCell(appetizer: appetizer)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetailView = true
                        }
                }
                .listStyle(.plain)
                .disabled(viewModel.isShowingDetailView)
                .navigationTitle("🍟 Appetizers")
            }
            .onAppear { viewModel.getAppetizers() }
            .blur(radius: viewModel.isShowingDetailView ? 20.0 : .zero)
            
            if viewModel.isShowingDetailView {
                AppetizerDetailView(isSHowingDetail: $viewModel.isShowingDetailView, appetizer: viewModel.selectedAppetizer!)
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
