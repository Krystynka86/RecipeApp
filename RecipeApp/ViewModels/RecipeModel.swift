//
//  RecipeModel.swift
//  RecipeApp
//
//  Created by Cristina on 2021-12-14.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        //Create an instance of data service and get the data
        //let service = DataService()
        //self.recipes = service.getLocalData()
        //2 linijki powyzej to to samo co jedna ponizej
        self.recipes = DataService.getLocalData()
        
        //Set the recipes property
    }
    
    static func getPortion(ingredient: Ingredient, recipeServings: Int, targetServings: Int) -> String {
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        
        if (ingredient.num != nil) {
        
        //Get a single serving size by multiplying denominator bythe recipe servings
            // denominator = denominator * recipeServings - to samo co ponizej
            denominator *= recipeServings
        
        //Get target portion by multiplying numerator by target servings
            numerator *= targetServings
        
        //Reduce fraction by greatest common divisor
            let divsior = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divsior
            denominator /= divsior
             
        //Get the whole portion in numerator > denominator
            if numerator >= denominator {
                
                //Calculated whole portions
                wholePortions = numerator / denominator
                
                //Calculate the remainder/rest
                numerator = numerator % denominator
                
                //Assign to portion string
                portion += String(wholePortions)
                 
            }
        
        //Express the reminder as a fraction
            if numerator > 0 {
                
                //Assign remainder as fraction to the portion string
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }
        
        }
        
        if var unit = ingredient.unit {
            
            //If we need to pluralize
            if wholePortions > 1 {
                
                //Calculate appropriate suffix
                if unit.suffix(2) == "ch" {
                    unit += "es"
                }
                else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                    
                   }
                else {
                    unit += "s"
                }
                    
            }
                
            
            
            portion += ingredient.num == nil && ingredient.denom == nil ? " " : ""
            
            return portion + unit 
            
            
        }
        
        return portion
    }
 }
