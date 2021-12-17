//
//  RecipeHighlights.swift
//  RecipeApp
//
//  Created by Cristina on 2021-12-17.
//

import SwiftUI

struct RecipeHighlights: View {
    
    var allHighlights = ""
    init (highlights: [String]) {
        
        //Loop through the highlights and build the string
        for index in 0..<highlights.count {
             
            //if this the last item, don't add a coma
            if index == highlights.count - 1 {
                 allHighlights += highlights[index]
            }
            else {
                allHighlights += highlights[index] + ", "
            }
        }
    }
    
    var body: some View {
        
        Text(allHighlights)
            .font(Font.custom("Avenir", size: 15))
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["test", "test"])
    }
}
