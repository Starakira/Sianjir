//
//  InfoViewController.swift
//  Sianjir
//
//  Created by Maulana on 11/03/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit
import MapKit
import BonsaiController

class InfoViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
           super.viewDidLoad()
            
       }
    
    
    @IBAction func UIModal(_ sender: Any) {
        let smallVC = storyboard!.instantiateViewController(identifier: "SmallVC")
        smallVC.transitioningDelegate = self
        smallVC.modalPresentationStyle = .custom
        present(smallVC, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.destination is InfoViewController {
            segue.destination.transitioningDelegate = self
            segue.destination.modalPresentationStyle = .custom
        }
    }
    
    @IBAction func switchViews(sender: UISegmentedControl){
        switch sender.selectedSegmentIndex {
        case 1:
            mapView.mapType = .hybrid
        default:
            mapView.mapType = .standard
        }
           
    }
}

extension InfoViewController: BonsaiControllerDelegate {
    
    // return the frame of your Bonsai View Controller
    func frameOfPresentedView(in containerViewFrame: CGRect) -> CGRect {
        
        return CGRect(origin: CGPoint(x: 0, y: containerViewFrame.height / 2), size: CGSize(width: containerViewFrame.width, height: containerViewFrame.height / 2))
    }
    
    // return a Bonsai Controller with SlideIn or Bubble transition animator
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
    
        // Slide animation from .left, .right, .top, .bottom
        return BonsaiController(fromDirection: .bottom, blurEffectStyle: .light, presentedViewController: presented, delegate: self)
        
        // or Bubble animation initiated from a view
        //return BonsaiController(fromView: yourOriginView, blurEffectStyle: .dark,  presentedViewController: presented, delegate: self)
    }
}
