//
//  ViewController.swift
//  TextureChat
//
//  Created by Yasmin Benatti on 07/08/17.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class ViewController: ASViewController<ASDisplayNode> {

    var strings: [String]!

    var tableNode: ASTableNode {
        return node as! ASTableNode
    }

    init() {
        super.init(node: ASTableNode())
        tableNode.delegate = self
        tableNode.dataSource = self
        
        strings = ["one", "two", "three", "four", "five"]
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

}

// MARK: - ASTableDelegate

extension ViewController: ASTableDelegate {
    func tableNode(_ tableNode: ASTableNode, willBeginBatchFetchWith context: ASBatchContext) {
        nextPageWithCompletion { (results) in
            self.insertNewRows(results)
            context.completeBatchFetching(true)
        }
    }
    
    func shouldBatchFetch(for tableNode: ASTableNode) -> Bool {
        return true
    }
}

// MARK: - ASTableDataSource

extension ViewController: ASTableDataSource {
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return strings.count
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        
        return {
            let node = ChatMessageCell()
            if indexPath.row == 1 {
                node.descriptionTextNode.attributedText = NSAttributedString(string:"small text")
            }
            return node
        }
    }
    
    @objc(tableNode:constrainedSizeForRowAtIndexPath:)
    func tableNode(_ tableNode: ASTableNode, constrainedSizeForRowAt indexPath: IndexPath) -> ASSizeRange {
        let min = CGSize(width: UIScreen.main.bounds.size.width, height: 16)
        let max = CGSize(width: UIScreen.main.bounds.size.width, height: CGFloat.greatestFiniteMagnitude)
        return ASSizeRange(min: min, max: max)
    }
}

// MARK: - Helpers

extension ViewController {
    func nextPageWithCompletion(_ block: @escaping (_ results: [String]) -> ()) {
        let moreAnimals = Array(self.strings[0 ..< 5])
        
        DispatchQueue.main.async {
            block(moreAnimals)
        }
    }
    
    func insertNewRows(_ newStrings: [String]) {
        let section = 0
        var indexPaths = [IndexPath]()
        
        let newTotalNumberOfPhotos = strings.count + newStrings.count
        
        for row in strings.count ..< newTotalNumberOfPhotos {
            let path = IndexPath(row: row, section: section)
            indexPaths.append(path)
        }
        
        strings.append(contentsOf: newStrings)
        if let tableNode = node as? ASTableNode {
            tableNode.insertRows(at: indexPaths, with: .none)
        }
    }
}

