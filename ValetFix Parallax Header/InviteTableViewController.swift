//
//  InviteTableViewController.swift
//  ValetFix Parallax Header
//
//  Created by Nakul Bajaj on 5/7/17.
//  Copyright © 2017 nakulbajaj. All rights reserved.
//

import UIKit
import APParallaxHeader
import EPContactsPicker

class InviteTableViewController: UIViewController, EPPickerDelegate, APParallaxViewDelegate {

    let pickerController = EPContactsPicker(delegate: nil, multiSelection: true, subtitleCellType: .phoneNumber)
    
    //Globally stored
    var generatedDiscountCode: String! = "SAMPLE1234" //Retrieve the generated discount code
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Create a parallax UIView (Frame, BGColor, AutoResizing)
        let parallaxView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/6))
        parallaxView.backgroundColor = UIColor(red:0.18, green:0.18, blue:0.18, alpha:1.0)
        
        //Initializing invite message label and setting attributes
        let inviteMessageLabel = UILabel() //Label for inviting - included in parallax header
        inviteMessageLabel.text = "Invite friends to ValetFix and get a discount on your first repair with your code:\n".appending(generatedDiscountCode)
        inviteMessageLabel.textAlignment = .center
        inviteMessageLabel.textColor = UIColor.white
        inviteMessageLabel.numberOfLines = 3
        inviteMessageLabel.adjustsFontSizeToFitWidth = true
        inviteMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        inviteMessageLabel.font = UIFont(name: "AppleSDGothicNeo-Light", size: 25)
        inviteMessageLabel.adjustsFontSizeToFitWidth = true
        parallaxView.addSubview(inviteMessageLabel)
        
        //Parallax Header Label Constraints
        let trailingConstraint = NSLayoutConstraint(item: inviteMessageLabel, attribute: .trailing, relatedBy: .equal, toItem: parallaxView, attribute: .trailingMargin, multiplier: 1, constant: 0)
        let leadingConstraint = NSLayoutConstraint(item: inviteMessageLabel, attribute: .leading, relatedBy: .equal, toItem: parallaxView, attribute: .leadingMargin, multiplier: 1, constant: 0)
        let centerXConstraint = NSLayoutConstraint(item: inviteMessageLabel, attribute: .centerX, relatedBy: .equal, toItem: parallaxView, attribute: .centerX, multiplier: 1, constant: 0)
        let centerYConstraint = NSLayoutConstraint(item: inviteMessageLabel, attribute: .centerY, relatedBy: .equal, toItem: parallaxView, attribute: .centerY, multiplier: 1, constant: (self.navigationController?.navigationBar.bounds.height)!)
        NSLayoutConstraint.activate([trailingConstraint, leadingConstraint, centerXConstraint, centerYConstraint]) //Activate
        
        //Adding the parallax view to the pickerController
        pickerController.tableView.addParallax(with: parallaxView, andHeight: UIScreen.main.bounds.height/6)
        pickerController.tableView.sectionIndexBackgroundColor = UIColor(white: 1, alpha: 0)
        pickerController.contactDelegate = self
        //Immediate push to the pickerController
        self.navigationController?.pushViewController(pickerController, animated: false)
        
    }
    
    func epContactPicker(_: EPContactsPicker, didSelectMultipleContacts contacts: [EPContact]) {
        var numbersPickedArray = [String]()
        for numbers in contacts {
            for numbers in numbers.phoneNumbers {
                numbersPickedArray.append(numbers.phoneNumber)
            }
        }
        print(numbersPickedArray)
    }
 
    
}
