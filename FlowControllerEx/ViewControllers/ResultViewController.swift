//
//  ResultViewController.swift
//  FlowControllerEx
//
//  Created by Muhammad Ridho on 28/02/19.
//  Copyright © 2019 Ridho Pratama. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController, FirstFlowControllerManaged {
    @IBOutlet weak var resultLabel: UILabel!
    
    weak var flowController: FirstFlowControllerProtocol?
    private let data: String
    private var onResultProcessed: ((String) -> Void)?
    init(flowController: FirstFlowControllerProtocol?, data: String, onResultProcessed: ((String) -> Void)?) {
        self.flowController = flowController
        self.data = data
        self.onResultProcessed = onResultProcessed
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    } 
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var result = ""
        if data.isEmpty {
            result = "Empty"
        } else {
            result = "Hello \(data)"
        }
        
        resultLabel.text = result
        onResultProcessed?(result)
    }
}
