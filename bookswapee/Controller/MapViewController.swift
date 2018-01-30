//
//  MapViewController.swift
//  bookswapee
//
//  Created by Apple on 11/10/1396 AP.
//  Copyright © 1396 AP Amin Torabi. All rights reserved.
//

import UIKit
import MapKit
class MapViewController: UIViewController,UISearchBarDelegate {

    @IBAction func search(_ sender: Any) {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        present(searchController, animated: true, completion: nil)
        
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //ignoring user
        UIApplication.shared.beginIgnoringInteractionEvents()
        //Activity indicator
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        self.view.addSubview(activityIndicator)
        //Hide searchbar
        searchBar.resignFirstResponder()
        dismiss(animated: true, completion: nil )
        //creat the search request
        let searchRequest = MKLocalSearchRequest()
        searchRequest.naturalLanguageQuery = searchBar.text
        
        let activeSearch = MKLocalSearch(request: searchRequest)
        activeSearch.start { (response, error) in
            
            activityIndicator.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
            if error != nil {
                let alert = UIAlertController(title: "NOTICE", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style:UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }else{
                //remove annotations
                let annotations = self.mapView.annotations
                self.mapView.removeAnnotations(annotations)
                //getting data
                let latitude = response?.boundingRegion.center.latitude
                let longitude = response?.boundingRegion.center.longitude
                //create annotation
                let searchAnnotation = TehranAnnotation(title: searchBar.text!, subtitle: "", coordinate: CLLocationCoordinate2DMake(latitude!, longitude!))
                self.mapView.addAnnotation(searchAnnotation)
                //zooming on an annotaion
                let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude!, longitude!)
                let span = MKCoordinateSpanMake(0.1, 0.1)
                let region = MKCoordinateRegionMake(coordinate, span)
                self.mapView.setRegion(region, animated: true)
                
            
            }
        }
    }
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let distanceSpan: CLLocationDegrees = 2000
        let tehranLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(35.6892, 51.3890)
        mapView.setRegion(MKCoordinateRegionMakeWithDistance(tehranLocation, distanceSpan, distanceSpan), animated: true)
        let tehranLocationpin = TehranAnnotation(title: "tehran", subtitle: "subtehran", coordinate: tehranLocation)
        mapView.addAnnotation(tehranLocationpin)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
