//
//  ViewController.swift
//  pushNotification
//
//  Created by Sidhartha Das on 18/09/19.
//  Copyright © 2019 codeWithSam. All rights reserved.
//

import UIKit
import  UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        //1.Ask for permission
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound] )
        {(granted, error) in     }

       //2.create the notification trigger
        let content = UNMutableNotificationContent()
        content.title = "This notification title"
        content.body = "Look at me"
        content.sound = UNNotificationSound.default
        
        
        //3. create the notification trigger
        let date = Date().addingTimeInterval(10)
        
        let dateComponent = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        
        //4. create the notification request
        let uuidString = UUID().uuidString
       
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        //5. Register the request
        center.add(request)  {(error) in
            // check the error parameter and handle my error
        }
}

}
