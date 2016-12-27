//
//  ContainerViewController.swift
//  PiHome
//
//  Created by Piotr Pawluś on 23/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

protocol Container: class {
    weak var containerViewController: ContainerViewController? { get set }
}

class ContainerViewController: UIViewController, Container {
    
    @IBOutlet var container: UIView!
    
    weak var containerViewController: ContainerViewController?
    var oldViewController: UIViewController?
}
