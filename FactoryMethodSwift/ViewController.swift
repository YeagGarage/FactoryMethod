//
//  ViewController.swift
//  FactoryMethodSwift
//
//  Created by User on 12/12/18.
//  Copyright © 2018 Woop. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    @IBOutlet weak var exerciseTypeLabel: UILabel!
    @IBOutlet weak var exerciseTypePicker: UIPickerView!
    @IBOutlet weak var imageView: UIImageView!
    
    
    var allExercises = [BasicExercises]()
    var imageArray = [UIImage(named: "run"), UIImage(named: "cyc"), UIImage(named: "str"), UIImage(named: "1")]
    var pickerData: [String] = [String]()
    var test = String()
    var nameTextField = UITextField()
    var typeTextField = UITextField()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exerciseTypePicker.delegate = self
        exerciseTypePicker.dataSource = self
        pickerData = ["", "Running", "Cycling", "StrengthExercises"]
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        tf()
        createLabel()
        createPicker()
        creatwImageView()
        imageView.image = imageArray[3]
    }
    
    
    func createExercise(typeOf: AllExercises) {
        
        let newExercise = ExClobal.defaultFactory.createExercise(type: typeOf)
        allExercises.append(newExercise)
    }
    
    
    func letsGo(typeOf: AllExercises) {
        switch typeOf {
        case .Running:
            imageView.image = imageArray[0]
            createExercise(typeOf: typeOf)

            
        case .Cycling:
            imageView.image = imageArray[1]
            createExercise(typeOf: typeOf)
            
        case .StrengthExercises:
            imageView.image = imageArray[2]
            createExercise(typeOf: typeOf)
        }
    }
    
    
    func createLabel() {
        exerciseTypeLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
        exerciseTypeLabel.numberOfLines = 0
        exerciseTypeLabel.adjustsFontSizeToFitWidth = true
        exerciseTypeLabel.sizeToFit()
        exerciseTypeLabel.shadowOffset = CGSize(width: 2, height: 2)
        view.addSubview(exerciseTypeLabel)
    }
    
    
    func creatwImageView() {
        imageView.contentMode = .scaleAspectFill
        view.addSubview(imageView)
    }
    
    
    func tf() {
        nameTextField.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        typeTextField.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        view.addSubview(nameTextField)
        view.addSubview(typeTextField)
    }
    
    
    func createPicker() {
        exerciseTypePicker.sizeToFit()
        view.addSubview(exerciseTypePicker)
    }
    
    
    @IBAction func startAction(_ sender: UIButton) {
        alert(title: test, message: "Start", preferredStyle: .alert)
    }
    
    
    @IBAction func stopButton(_ sender: UIButton) {
        alert(title: test, message: "Stop", preferredStyle: .alert)
    }
    
    
    @IBAction func addNewAction(_ sender: UIButton) {
        addNew(title: "Add New Exercise", message: "Lets Go", preferredStyle: .alert)

    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }

    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerData[row].description == "Running"{
            print("Running")
            letsGo(typeOf: .Running)
        } else if pickerData[row].description == "Cycling" {
            print("Cycling")
            letsGo(typeOf: .Cycling)
        } else if pickerData[row].description == "StrengthExercises" {
            print("StrengthExercises")
            letsGo(typeOf: .StrengthExercises)
        } else {
            imageView.image = imageArray[3]
        }
        test = pickerData[row].description
        pickerView.reloadAllComponents()
    }
    
    
    func alert(title: String, message: String, preferredStyle: UIAlertController.Style) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func addNew(title: String, message: String, preferredStyle: UIAlertController.Style) {
    //func addNew(title: String, message: String, titleEx: String, typeEx: String, preferredStyle: UIAlertController.Style) {

        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        alert.isModalInPopover = true
    
        alert.addTextField { (textField) in
            textField.placeholder = "Name of exercise"
            self.nameTextField = textField
        }
        alert.addTextField { (textField) in
            textField.placeholder = "Type of exercise"
            self.typeTextField = textField
        }
        alert.addAction(UIAlertAction(title: "Add", style: .default) { (_) in
            if (self.nameTextField.text?.characters.count)! > 0 {
                self.pickerData.append(self.nameTextField.text ?? "")
                self.exerciseTypePicker.reloadAllComponents()
            } else if (self.typeTextField.text?.characters.count)! > 0 {
                self.pickerData.append(self.typeTextField.text ?? "")
                self.exerciseTypePicker.reloadAllComponents()
            } else {
                print("No")
            }
            
        })
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

