//
//  Router+Custom.swift
//

import UIKit

//Use to custom router define

/// sourcery: router="showImage"
class RouterPhotoViewController: UIViewController, CustomRoutable {
    /// sourcery: parameter
    var images: [UIImage]?
    /// sourcery: parameter
    var index: Int?
}

/// sourcery: router="safari"
class RouterExternalViewController: UIViewController, CustomRoutable {
    /// sourcery: parameter
    var url: String?
}
