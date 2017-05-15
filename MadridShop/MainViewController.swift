//
//  MainViewController.swift
//  MadridShop
//
//  Created by Eugenio Barquín on 11/5/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController {
    var context: NSManagedObjectContext?
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //Context Injection to Top View Controller in NavigationController
        let destinationVC = segue.destination as! UINavigationController
        let nextViewController = destinationVC.viewControllers[0] as! ListOfShopsController
        
        nextViewController.context = self.context

    }
}

