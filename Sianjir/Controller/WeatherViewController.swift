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
    @IBOutlet weak var headerImage: UIImageView!
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
            headerImage.image = UIImage(named: K.image.headerNight)
        } else {
            headerImage.image = UIImage(named: K.image.headerNoon)
        }
    }
    
    func showAlertOff(){
        let alertController = UIAlertController(title: K.pemberitahuan, message:
            K.pemberitahuanNonaktif, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showAlertOn(){
        let alertController = UIAlertController(title: K.pemberitahuan, message:
            K.pemberitahuanAktif, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func rainIntensity(){
        let date = Date()
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: date)
        
        let imagesStats1 = UIImage(systemName: K.image.hujanPetir)
        let imagesStats2 = UIImage(systemName: K.image.hujan)
        
        if hour >= 14 && hour <= 20 {
            labelStatusWeather.text = K.hujanLebat
            imageStatus.image = imagesStats1
            showNotifications()
            
        } else {
            labelStatusWeather.text = K.hujanRingan
            imageStatus.image = imagesStats2
        }
    }
    
    func permission(){
        UNUserNotificationCenter.current().delegate = self
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
            (granted, error) in
            
        }
    }
    
    func showNotifications () {
        let content = UNMutableNotificationContent()
        content.title = K.waspadaBanjir
        content.body = K.waspadaBanjirWarning
        content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: "emergency.wav"))
        
        let triggerNotif = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: K.identifier.notificationIdentifier, content: content, trigger: triggerNotif)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
    }
}
