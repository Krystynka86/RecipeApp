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
    var highlights:[String]
    var ingredients:[Ingredient]
    var directions:[String]
}

//ta klasa moze byc w osobnym swift dokumencie w models
class Ingredient: Identifiable, Codable {
    
    var id:UUID?
    var name:String
    var num:Int?
    var denom:Int?
    var unit:String?
}
