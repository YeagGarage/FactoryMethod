//
//  ExerciseClobal.swift
//  FactoryMethodSwift
//
//  Created by User on 12/12/18.
//  Copyright © 2018 Woop. All rights reserved.
//

import Foundation

enum AllExercises {
    case Running, Cycling, StrengthExercises
}

class ExClobal {
    
    
    static let defaultFactory = ExClobal()
    
    
    func createExercise(type: AllExercises) -> BasicExercises {
     
        switch type {
        case .Running: return Running()
        case .Cycling: return Cycling()
        case .StrengthExercises: return StrengthExercises()
        }
    }
    
}
