//
//  ViewController.swift
//  FactoryMethodSwift
//
//  Created by User on 12/12/18.
//  Copyright © 2018 Woop. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var allExercises = [BasicExercises]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func createExercise(typeOf: AllExercises) {
        
        let newExercise = ExClobal.defaultFactory.createExercise(type: typeOf)
        allExercises.append(newExercise)
    }
    
    
    func runExercise() {
        
        for exer in allExercises {
            exer.start()
            exer.stop()
        }
    }


}

