//
//  AppetizerCell.swift
//  SwiftUI - Appetizers
//
//  Created by Simon Dahan on 19/12/2022.
//

import SwiftUI

struct AppetizerCell: View {
    
    let appetizer: Appetizer
    
    var body: some View {
        HStack(spacing: 20.0) {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(8.0)
                        
            VStack(alignment: .leading, spacing: 5.0) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("$\(String(appetizer.price))")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

struct AppetizerCell_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerCell(appetizer: MockData.sampleAppetizer)
            .frame(height: 60.0)
            
    }
}
