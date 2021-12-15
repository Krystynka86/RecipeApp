//
//  ContentView.swift
//  RecipeApp
//
//  Created by Cristina on 2021-12-14.
//

import SwiftUI

struct RecipeListView: View {
    
    //Reference the View Model
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        
        NavigationView {
            List(model.recipes) { r in
                
                NavigationLink(destination: RecipeDetailView(recipe: r), label: {
                    
                    // MARK: Row item
                    HStack(spacing: 20.0) {
                        Image(r.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50, alignment: .center)
                            .clipped()
                            .cornerRadius(5)
                        Text(r.name)
                    }
                })
                
            }
            .navigationTitle("All Recipies")
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    } 
}
