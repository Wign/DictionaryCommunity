//
//  Request.swift
//  DictionaryCommunity
//
//  Created by Kenneth Andersen on 05/03/2021.
//

import Foundation

class Request: NSObject {
    
    //MARK: Properties
    let literal: String
    let count: Int
    let isFavored: Bool
    
    //MARK: Initialization
        init?(literal: String, count: Int, isFavored: Bool) {
            guard !literal.isEmpty else {
                return nil
            }
            
            guard count >= 0 else {
                return nil
            }
            
            guard !isFavored || (isFavored && count > 0) else {
                return nil
            }
            
            self.literal = literal
            self.count = count
            self.isFavored = isFavored
        }
}
