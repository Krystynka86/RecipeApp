//
//  Recipe.swift
//  RecipeApp
//
//  Created by Cristina on 2021-12-14.
//

import Foundation

class Recipe: Identifiable,Decodable {
    
    var id:UUID? 
    
    //nazwy musza pasowac do tych z json
    var name:String
    var featured:Bool
    var image:String
    var description:String
    var prepTime:String
    var cookTime:String
    var totalTime:String
    var servings:Int
    var ingredients:[String]
    var directions:[String]
    
    
}
