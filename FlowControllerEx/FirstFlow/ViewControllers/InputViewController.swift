//
//  InputViewController.swift
//  FlowControllerEx
//
//  Created by Muhammad Ridho on 28/02/19.
//  Copyright © 2019 Ridho Pratama. All rights reserved.
//

import UIKit

class InputViewController: UIViewController, FirstFlowControllerManaged {
    @IBOutlet weak var inputTextField: UITextField!
    
    weak var flowController: FirstFlowControllerProtocol?
    init(flowController: FirstFlowControllerProtocol?) {
        self.flowController = flowController
        
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func proceedButtonDidTap(_ sender: UIButton) {
        flowController?.showResultScreen(data: inputTextField.text ?? "", onResultProcessed: { str -> Void in 
            print("Received by: \(String.init(describing: type(of: self))) with data: \(str)")
        })
    }
}
