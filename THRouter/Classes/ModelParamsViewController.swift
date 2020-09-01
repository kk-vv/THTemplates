//
//  ModelParamsViewController.swift
//  THRouter
//
//  Created by Juan Felix on 2020/9/1.
//  Copyright © 2020 Juan Felix. All rights reserved.
//

import UIKit
/// sourcery: router="modelParams", name = "Model Param Test Page"
class ModelParamsViewController: BaseViewController {
    
    /// sourcery:begin: parameter
    var codableModel: CodableModel?
    var handyjsonModel: HandyJSONModel?
    var mapperModel: ObjectMapperModel?
    /// sourcery:end
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "UserInfo"
        
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 20, width: self.view.bounds.width, height: 200)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textAlignment = .center
        view.addSubview(label)
        var info = (codableModel?.description ?? "") + "\n"
        info += (handyjsonModel?.description ?? "") + "\n"
        info += (mapperModel?.description ?? "")
        label.text = info
        
    }

}
