//
//  AppetizerDetailView.swift
//  SwiftUI - Appetizers
//
//  Created by Simon Dahan on 19/12/2022.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @EnvironmentObject var order: Order
    
    @Binding var isSHowingDetail: Bool
    let appetizer: Appetizer
    
    var body: some View {
        VStack() {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            Text(appetizer.name)
                .font(.title)
                .fontWeight(.semibold)
            
            Text(appetizer.description)
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            HStack(spacing: 40.0) {
                NutritionalDetailView(property: .calories, value: appetizer.calories, unit: "kcal")
                NutritionalDetailView(property: .carbs, value: appetizer.carbs, unit: "g")
                NutritionalDetailView(property: .protein, value: appetizer.protein, unit: "g")
            }
            
            Spacer()
            Button {
                order.add(appetizer)
                isSHowingDetail = false
            } label: {
                APButton(title: "$\(appetizer.price.formatted()) - Add To Order")
            }
            .padding(.bottom, 30)
            
        }
        .ignoresSafeArea(edges: .top)
        .frame(width: 300, height: 525)
        .background(.background)
        .cornerRadius(12.0)
        .shadow(radius: 40)
        .overlay(Button {
            isSHowingDetail = false
            print("Dismiss")
        } label: {
            XDismissButton()
        }, alignment: .topTrailing)
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(isSHowingDetail: .constant(true), appetizer: MockData.sampleAppetizer)
    }
}

struct NutritionalDetailView: View {
    
    let property: NutritionalProperties
    let value: Int
    let unit: String
    
    var body: some View {
        VStack(spacing: 5.0) {
            Text(property.rawValue)
                .font(.caption)
                .fontWeight(.bold)
            Text(String(value) + " " + unit)
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

enum NutritionalProperties: String {
    case calories = "Calories"
    case carbs = "Carbs"
    case protein = "Protein"
}
