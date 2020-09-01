//
//  BaseViewController.swift
//  THRouter
//
//  Created by Juan Felix on 2020/9/1.
//  Copyright © 2020 Juan Felix. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, Routable {
    
    var trackRouterType: RouterType? {
        guard let routerController = self as? RouterControllerType else {
            return nil
        }
        return routerController.routerType
    }
    
    var pageName: String {
        if let trackRouterType = trackRouterType {
            return trackRouterType.name
        }
        return String.init(describing: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("❤️ \(pageName) will show")

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white

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
