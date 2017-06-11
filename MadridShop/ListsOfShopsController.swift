//
//  ListsOfShopsController.swift
//  MadridShop
//
//  Created by Eugenio Barquín on 14/5/17.
//  Copyright © 2017 Eugenio Barquín. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation
import MapKit


public class ListOfShopsController: UIViewController, NSFetchedResultsControllerDelegate, UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate {
    
    var locationManager: CLLocationManager?

    var context: NSManagedObjectContext? = nil
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mapView: MKMapView!
    
    public override func viewDidLoad() {
        locationManager = CLLocationManager()
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.delegate = self
        locationManager?.startUpdatingLocation()
        mapSetCenter()
    }

    
    //MARK: - TableView
    public func numberOfSections(in tableView: UITableView) -> Int {
        return self.fetchResultsController.sections?.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionInfo = self.fetchResultsController.sections?[section]
        return sectionInfo!.numberOfObjects
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_IDENTIFIER, for: indexPath)
        let shop = fetchResultsController.object(at: indexPath)
        self.configureCell(cell as! ShopCell, withShop: shop)
        
        return cell
        
    }
    
    func configureCell(_ cell: ShopCell, withShop shop: ShopCoreData) {
        cell.shopName!.text = shop.name
        cell.shopAddress!.text = shop.address
        if let imageCell = UIImage(data: shop.image as! Data) {
            cell.shopImage.image = imageCell

        }
        
    }

    
    //MARK: -  Fetch result controller
    var fetchResultsController: NSFetchedResultsController<ShopCoreData> {
        if _fetchResultsController != nil{
            return _fetchResultsController!
        }
        
        let fetchRequest: NSFetchRequest<ShopCoreData> = ShopCoreData.fetchRequest()
        fetchRequest.fetchBatchSize = 20
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        _fetchResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.context!, sectionNameKeyPath: nil, cacheName: "ShopList")
        _fetchResultsController?.delegate = self
        
        do {
            try _fetchResultsController?.performFetch()
        }catch {
            let  nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        return _fetchResultsController!
        
    }
    
    var _fetchResultsController: NSFetchedResultsController<ShopCoreData>? = nil
    
    
    //MARK: - Segue
    
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //Context injection
        let vc = segue.destination as! ShopDetailViewController
        vc.context = self.context
        
        //Shop Injection
        let indexPath = tableView.indexPathsForSelectedRows?.first
        let shop = fetchResultsController.object(at: indexPath!)
        vc.shop = shop
    }
    
    //MARK: - Utils
    func mapSetCenter() {
        let madridLocation = CLLocation(latitude: 40.416775, longitude: -3.703790)
        //Create region
        let madridRegion = MKCoordinateRegion(center: madridLocation.coordinate, span: MKCoordinateSpanMake(0.2, 0.2))
        self.mapView.setRegion(madridRegion, animated: true)
        //self.mapView.setCenter(madridLocation.coordinate, animated: true)
        
    }
}
