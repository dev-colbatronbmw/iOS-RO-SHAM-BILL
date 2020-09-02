//
//  SettingsTableViewController.swift
//  FinalProject
//
//  Created by Colby Holmstead on 11/26/19.
//  Copyright © 2019 Colby Holmstead. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController,  UIPickerViewDelegate, UIPickerViewDataSource{
    @IBOutlet var errorView: UITableViewCell!
    @IBOutlet var saveButton: UIBarButtonItem!
    @IBOutlet var startNumPicker: UIPickerView!
    @IBOutlet var startNumLable: UILabel!
    @IBOutlet var endNumPicker: UIPickerView!
    @IBOutlet var endNumLabel: UILabel!
    var startNum: Int?
    var endNum: Int?
    var settings: Settings?
    var startNumberArray = Array(1...1000)
    let startNumPickerCellIndexPath = IndexPath(row: 1, section: 0)
    let endNumPickerCellIndexPath = IndexPath(row: 1, section: 1)
    
    var isStartNumPickerShown: Bool = false {
        didSet {
            startNumPicker.isHidden = !isStartNumPickerShown
        }
    }
    
    var isEndNumPickerShown: Bool = false {
        didSet {
            endNumPicker.isHidden = !isEndNumPickerShown
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if let savedSettings = Settings.loadFromFile() {
            settings = savedSettings
        } else {
            settings = Settings.loadSampleSettings()
        }
        startNumLable.text = String(settings!.startingNumber)
        endNumLabel.text = String(settings!.endingNumber)
        startNumPicker.dataSource = self
        startNumPicker.delegate = self
        endNumPicker.dataSource = self
        endNumPicker.delegate = self
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch (indexPath.section, indexPath.row) {
        case (startNumPickerCellIndexPath.section, startNumPickerCellIndexPath.row):
            return isStartNumPickerShown ? 216.0 : 0.0
        case (endNumPickerCellIndexPath.section, endNumPickerCellIndexPath.row):
            return isEndNumPickerShown ? 216.0 : 0.0
        default:
            return 45.0
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch (indexPath.section, indexPath.row) {
        case (startNumPickerCellIndexPath.section, startNumPickerCellIndexPath.row - 1):
            if isStartNumPickerShown {
                isStartNumPickerShown = false
            } else if isEndNumPickerShown {
                isEndNumPickerShown = false
                isStartNumPickerShown = true
            } else {
                isStartNumPickerShown = true
            }
            
            tableView.beginUpdates()
            tableView.endUpdates()
            
        case (endNumPickerCellIndexPath.section, endNumPickerCellIndexPath.row - 1):
            if isEndNumPickerShown {
                isEndNumPickerShown = false
            } else if isStartNumPickerShown {
                isStartNumPickerShown = false
                isEndNumPickerShown = true
            } else {
                isEndNumPickerShown = true
            }
            
            tableView.beginUpdates()
            tableView.endUpdates()
            
        default:
            break
        }
    }
    func numberOfComponents(in startNumPicker: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ startNumPicker: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if startNumPicker.tag == 1{
            return startNumberArray.count
        }else if endNumPicker.tag == 2{
            return startNumberArray.count
        }else{
            return 1
        }
        
        
    }
    func pickerView(_ startNumPicker: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if startNumPicker.tag == 1{
            startNumLable.text = String(startNumberArray[row])
            startNum = startNumberArray[row]
        }else if endNumPicker.tag == 2{
            endNumLabel.text = String(startNumberArray[row])
            endNum = startNumberArray[row]
        }
    }
    func pickerView(_ startNumPicker: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if startNumPicker.tag == 1{
            return String(startNumberArray[row])
        }else if endNumPicker.tag == 2{
            return String(startNumberArray[row])
        }else{
            return "Failed"
        }
    }
    @IBAction func settingsSaveButtonTapped(_ sender: Any) {
        settings = Settings(startingNumber: Int(startNumLable.text!)!, endingNumber: Int(endNumLabel.text!)!)
        print(settings!)
        if Int(startNumLable.text!)! < Int(endNumLabel.text!)!{
        Settings.saveToFile(settings: settings!)
        }else{
            errorView.isHidden = false
        }
        dismiss(animated: true, completion: nil)
    }
        
      
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
        
        
}
