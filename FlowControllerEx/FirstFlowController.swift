//
//  FirstFlowController.swift
//  FlowControllerEx
//
//  Created by Muhammad Ridho on 28/02/19.
//  Copyright © 2019 Ridho Pratama. All rights reserved.
//

import UIKit

protocol FirstFlowControllerProtocol: class {
    func showResultScreen(data: String, onResultProcessed: ((String) -> Void)?)
}

protocol FirstFlowControllerManaged: class {
    var flowController: FirstFlowControllerProtocol? { get }
}

class FirstFlowController: UIViewController, FirstFlowControllerProtocol {
    override func viewDidLoad() {
        super.viewDidLoad()
        showInitialScreen()
    }
    
    private func showInitialScreen() {
        let inputViewController = InputViewController(flowController: self)
        
        view.addSubview(inputViewController.view)
        inputViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addChild(inputViewController)
        inputViewController.didMove(toParent: self)
    }
    
    func showResultScreen(data: String, onResultProcessed: ((String) -> Void)?) {
        let result = ResultViewController(
            flowController: self,
            data: data,
            onResultProcessed: onResultProcessed
        )
        self.navigationController?.pushViewController(result, animated: true)
    }
}
