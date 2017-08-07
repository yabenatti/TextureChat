//
//  ChatMessageCell.swift
//  TextureChat
//
//  Created by Yasmin Benatti on 07/08/17.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class ChatMessageCell: ASCellNode {
    
        let descriptionTextNode: ASTextNode
        
    
        override init() {
            
            descriptionTextNode = ASTextNode()
            
            
            super.init()
            
            backgroundColor = UIColor.lightGray
            clipsToBounds = true
            
            //Animal Description
            descriptionTextNode.attributedText = NSAttributedString(string: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum")
            descriptionTextNode.truncationAttributedText = NSAttributedString(string: "…")
            descriptionTextNode.backgroundColor = UIColor.clear
            descriptionTextNode.placeholderEnabled = true
            descriptionTextNode.placeholderFadeDuration = 0.15
            descriptionTextNode.placeholderColor = UIColor(white: 0.777, alpha: 1.0)
            
            addSubnode(descriptionTextNode)
        }
        
        override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
            
            let descriptionTextInsetSpec = ASInsetLayoutSpec(insets: UIEdgeInsetsMake(16.0, 28.0, 12.0, 28.0), child: descriptionTextNode)
            
            let verticalStackSpec = ASStackLayoutSpec(direction: .vertical, spacing: 0, justifyContent: .start, alignItems: .start, children: [descriptionTextInsetSpec])
            
            
            return verticalStackSpec
        }
}




