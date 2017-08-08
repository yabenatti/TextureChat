//
//  ChatMessageDelegate.swift
//  TextureChat
//
//  Created by Yasmin Benatti on 08/08/17.
//  Copyright © 2017 Yasmin Benatti. All rights reserved.
//

import Foundation

@objc protocol ChatDelegate{
    
    //Bubble delegate
    func openImageGallery(message : Message)
    func openuserProfile(message : Message)
}
