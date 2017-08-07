//
//  ViewController.swift
//  TextureChat
//
//  Created by Yasmin Benatti on 07/08/17.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class ViewController: ASViewController<ASDisplayNode>, ASTableDataSource, ASTableDelegate {

    var tableNode: ASTableNode {
        return node as! ASTableNode
    }

    init() {
        super.init(node: ASTableNode())
        tableNode.delegate = self
        tableNode.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("storyboards are incompatible with truth and beauty")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: ASTableNode data source and delegate.
    
    func tableNode(_ tableNode: ASTableNode, nodeForRowAt indexPath: IndexPath) -> ASCellNode {
        let node = ASTextCellNode()
        node.text = String(format: "[%ld.%ld] says hello!", indexPath.section, indexPath.row)
        
        return node
    }
    
    func numberOfSections(in tableNode: ASTableNode) -> Int {
        return 1
    }
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return 2
    }


}

