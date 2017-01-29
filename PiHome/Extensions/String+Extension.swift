//
//  String+Extension.swift
//  PiHome
//
//  Created by Piotr Pawluś on 30/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

extension String {
    
    var isValidEmail: Bool {
        return try! isMatching(regularExpression: NSRegularExpression(pattern: "^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,}$"))
    }
    
    var base68: String {
        return data(using: String.Encoding.utf8)!.base64EncodedString()
    }
    
    //MARK: - Class Methods
    
    //MARK: - Initailization
    
    //MARK: - Deinitialization
    
    //MARK: - Actions
    
    //MARK: - Public
    
    //MARK: - Internal
    
    func isMatching(regularExpression: NSRegularExpression) -> Bool {
        
        let range = NSMakeRange(0, characters.count)
        let matches = regularExpression.matches(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: range)
        
        return matches.count > 0
    }
    //MARK: - Private
    
    //MARK: - Overridden
}
