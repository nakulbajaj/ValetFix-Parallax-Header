//
//  InviteTableViewController.swift
//  ValetFix Parallax Header
//
//  Created by Nakul Bajaj on 5/7/17.
//  Copyright © 2017 nakulbajaj. All rights reserved.
//

import UIKit
import APParallaxHeader

class InviteTableViewController: UITableViewController, APParallaxViewDelegate {

    //Globally stored
    var generatedDiscountCode: String! = "SAMPLE1234" //Retrieve the generated discount code
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Navigation items setup with buttons & title
        navigationItem.title = "Invite friends"
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName : UIFont(name: "AppleSDGothicNeo-Light", size: 20)!]
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.action, target: self, action: #selector(self.openShareSheet))
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.cancel, target: self, action: #selector(self.goBackHome))
        navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSFontAttributeName : UIFont(name: "AppleSDGothicNeo-Medium", size: 20)!], for: .normal)
        
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
        
        //Adding the parallax view
        self.tableView.addParallax(with: parallaxView, andHeight: UIScreen.main.bounds.height/6)
        self.tableView.parallaxView.delegate = self //Set delegate
        
    }
    
    
    func openShareSheet(){
        let shareString = "Check out ValetFix and get a discount on your first repair by using code ".appending(generatedDiscountCode)
        let activityViewController = UIActivityViewController(activityItems: [shareString], applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)
    }

    func goBackHome(){
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    //A few extra parallax methods if necessary
    func parallaxView(_ view: APParallaxView!, willChangeFrame frame: CGRect) {
        //Will change frame
    }
    func parallaxView(_ view: APParallaxView!, didChangeFrame frame: CGRect) {
        //Did change frame
    }

}
