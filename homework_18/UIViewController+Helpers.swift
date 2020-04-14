//
//  UIViewController+Helpers.swift
//  homework_18
//
//  Created by Александра Лесничая on 3/17/20.
//  Copyright © 2020 Alexandra Lesnichaya. All rights reserved.
//

import UIKit

extension UIViewController {

    static func createFromStoryboard(withName name: String) -> Self? {
        let storyboard = UIStoryboard(name: name, bundle: Bundle.main)
        let identifierOfSelfClass = String(describing: self)
        let viewController = storyboard.instantiateViewController(identifier: identifierOfSelfClass) as? Self
        return viewController
    }

    static func createFromMainStoryboard() -> Self? {
        return createFromStoryboard(withName: "Main")
    }
}
