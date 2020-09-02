//
//  ViewController.swift
//  FinalProject
//
//  Created by Colby Holmstead on 11/1/19.
//  Copyright © 2019 Colby Holmstead. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var settings: Settings?
    @IBOutlet var settingsButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // read from file
        // pass it to settings or game what ever needs it
    }
    
    @IBAction func settingsButtonTapped(_ sender: Any) {
        
    }
    @IBAction func playButtonTapped(_ sender: Any) {
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            print("segue called")
        }
    }
    @IBAction func unwindToLanding(unwindSegue: UIStoryboardSegue){
    }
    // Do any additional setup after loading the view.
}




