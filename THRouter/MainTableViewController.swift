//
//  MainTableViewController.swift
//  THRouter
//
//  Created by Juan Felix on 2020/8/31.
//  Copyright © 2020 Juan Felix. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }
        let codableModel = CodableModel()
        codableModel.name = "ONCEA"
        codableModel.tel = "18081000001"
        
        let handyjsonModel = HandyJSONModel()
        handyjsonModel.name = "ONCEB"
        handyjsonModel.tel = "18081000002"
        
        let mapperModel = ObjectMapperModel(JSON: ["name": "ONCEC", "tel": "18081000003"])
        
        switch indexPath.row {
        case 0:
            THNavigator.navigator.push(.singleParam(navTitle: "Single param test"))
        case 1:
            THNavigator.navigator.push(.useInitMethod(color: UIColor.cyan, navTitle: "Use init method"))
        case 2:
            THNavigator.navigator.present(.modelParams(codableModel: codableModel, handyjsonModel: handyjsonModel, mapperModel: mapperModel))
        case 3:
            let pageURLString = "oneclass://oneclass.com/single_param?nav_title=From url string".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            THNavigator.navigator.handleOpenURL(pageURLString)
        case 4:
            THNavigator.navigator.open(RouterParameter.safari(url: "https://www.google.com"))
        case 5:
            THNavigator.navigator.present(.showImage(images: [UIImage(named: "test")!], index: nil))
        default:
            break
        }
    }
}

