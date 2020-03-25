//
//  WeatherViewController.swift
//  Sianjir
//
//  Created by Maulana on 17/03/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit
import UserNotifications

class WeatherViewController: UIViewController, UNUserNotificationCenterDelegate {
    
    @IBOutlet weak var dateHeader: UILabel!
    @IBOutlet weak var headerMorning: UIImageView!
    @IBOutlet weak var headerNight: UIImageView!
    @IBOutlet weak var buttonNotif: UIButton!
    @IBOutlet weak var labelStatusWeather: UILabel!
    @IBOutlet weak var imageStatus: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateHeader.text = DateFormatter.localizedString(from: (NSDate() as Date), dateStyle: .medium, timeStyle: .short)
        
        permission()
        rainIntensity()
        //localNotif()
        headerBG()
        
    }
    
    @IBAction func buttonPressed(){
        buttonNotif.isSelected = !buttonNotif.isSelected
        
        if buttonNotif.isSelected {
            showAlertOn()
        } else {
            showAlertOff()
        }
    }
    
    func headerBG() {
        let date = Date()
        let calendar = Calendar.current

        let hour = calendar.component(.hour, from: date)
        //let hour = 6
        
        if hour >= 18 || hour <= 5 {
            headerNight.alpha = 1.0
            headerMorning.alpha = 0.0
            print("Sukses")
        } else {
            headerNight.alpha = 0.0
            headerMorning.alpha = 1.0
            print("gagal")
            }
    }
    
    func showAlertOff(){
        let alertController = UIAlertController(title: "Pembertitahuan", message:
            "Pemberitahuan telah dimatikan. ", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showAlertOn(){
        let alertController = UIAlertController(title: "Pembertitahuan", message:
            "Pemberitahuan telah aktif. ", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func rainIntensity(){
        let date = Date()
        let calendar = Calendar.current

        let hour = calendar.component(.hour, from: date)
        
        let imagesStats1 = UIImage(systemName: "cloud.bolt.rain.fill")
        let imagesStats2 = UIImage(systemName: "cloud.rain.fill")
        
        if hour >= 14 && hour <= 20 {
            labelStatusWeather.text = "Hujan Lebat"
            imageStatus.image = imagesStats1
            showNotifications()
            
        } else {
            labelStatusWeather.text = "Hujan Ringan"
            imageStatus.image = imagesStats2
        }
    }
    
    func permission(){
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert]) {
        (granted, error) in
            
        }
    }
    
    func showNotifications () {
        let content = UNMutableNotificationContent()
        content.title = "Waspada Banjir"
        content.body = "Akan terjadi hujan lebat, mohon untuk waspada kemungkinan terjadi banjir !!"
        content.sound = UNNotificationSound.default
        
        let triggerNotif = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "notificationWeather", content: content, trigger: triggerNotif)

    UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    /*func localNotif(){
        if labelStatusWeather.isEqual("Hujan Lebat") {
                    } else {
            print("Tidak ada warning")
        }
    }*/
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
    }
    
    
}

