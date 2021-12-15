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
}
