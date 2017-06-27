//
//  ViewController.swift
//  Feelings
//
//  Created by iCoder333 on 6/14/17.
//  Copyright © 2017 iCoder333. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Create Sample Arrays
        let rows = ["Quality","Price","Value"]
        let columns = ["1 Star","2 Star","3 Star","4 Star","5 Star"]
        
        //Create FeelingsView
        //Note: You should provide two images for FeelingsView. 1. Filled and 2. Unfilled
        let viewFeeling = FeelingsView.init(frame: CGRect.init(x: 0.0, y: 0.0, width: 300.0, height: 200.0))
        viewFeeling.backgroundColor = UIColor.clear
        self.view.addSubview(viewFeeling)
        viewFeeling.center = self.view.center
        
        //Setting fill/unfill images for FeelingsView
        viewFeeling.fillImage = UIImage.init(named: "filled.png")!
        viewFeeling.unfillImage = UIImage.init(named: "unfilled.png")!
        
        //Setting up values for FeelingsView
        viewFeeling.columnTitles = columns
        viewFeeling.rowTitles = rows
        
        //Add animations when feelings button tapped.
        //Pulse, Flash, Shake and None.
        viewFeeling.feelingsButtonAnimationType = .Flash
        
        //Default Feelings Value (from 1 up-to total columns count)
        viewFeeling.defaultFeeligns = 5

        
        //Reload
        viewFeeling.reloadFeelingView()
        
        //Detect selection of Feelings value
        viewFeeling.onFilledCompletion = { (row,column) in
            //Note: row and column are the Int which a user tapped in the FeelingsView
            let rowValue = rows[row]
            let columnValue = columns[column]
            print("\(rowValue) -> \(columnValue)")
        }
    }
}
