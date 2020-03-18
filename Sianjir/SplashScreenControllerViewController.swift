//
//  SplashScreenControllerViewController.swift
//  Sianjir
//
//  Created by Maulana on 17/03/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class SplashScreenControllerViewController: UIViewController {

    @IBOutlet weak var indicatorLoading: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let delay = 3
        self.indicatorLoading.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay)) {
            self.indicatorLoading.stopAnimating()
            self.indicatorLoading.isHidden = true
        }
        
        perform(#selector(showOnboarding), with: nil, afterDelay: 3)
        print("Sukses")

        // Do any additional setup after loading the view.
    }
    
    @objc func showOnboarding() {
        performSegue(withIdentifier: "SplashSegue", sender: self)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
