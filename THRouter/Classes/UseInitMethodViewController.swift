//
//  UseInitMethodViewController.swift
//  THRouter
//
//  Created by Juan Felix on 2020/9/1.
//  Copyright © 2020 Juan Felix. All rights reserved.
//

import UIKit

/// sourcery: router="useInitMethod", name = "Call InitMethod Test Page"
class UseInitMethodViewController: BaseViewController, InitRoutable {

    /// sourcery: parameter
    var color: UIColor?
    /// sourcery: parameter
    var navTitle: String?
    
    var thisIsNotRouterParam: String?
    
    init(color: UIColor?, navTitle: String?) {
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = color
        self.title = navTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
