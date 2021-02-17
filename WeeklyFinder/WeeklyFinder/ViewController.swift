//
//  ViewController.swift
//  WeeklyFinder
//
//  Created by Дмитрий Лапшин on 03.02.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var monthTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    @IBOutlet weak var resultLable: UILabel!
    
    @IBAction func findDay(_ sender: Any) {
        
        guard let day = dateTF.text, let month = monthTF.text, let year = yearTF.text else {return}
        
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.locale = Locale(identifier: "ru_Ru")
        
        guard let date = calendar.date(from: dateComponents) else {return}
        
        let weekday = dateFormatter.string(from: date)
        let capitalizeWeekday = weekday.capitalized
        
        resultLable.text = capitalizeWeekday
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

