//
//  BasicExercises.swift
//  FactoryMethodSwift
//
//  Created by User on 12/12/18.
//  Copyright © 2018 Woop. All rights reserved.
//

import Foundation


protocol BasicExercises {
    var name: String { get }
    var type: String { get }
    
    func start()
    func stop()
}
