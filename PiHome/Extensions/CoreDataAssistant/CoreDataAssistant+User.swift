//
//  CoreDataAssistant+User.swift
//  PiHome
//
//  Created by Piotr Pawluś on 30/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

extension CoreDataAssistant {

    //MARK: - Class Methods
    
    class func parseAndSaveUser(with response: Any?, completion: @escaping UserHandler) {
        
        if let dictionary = response as? [AnyHashable: Any] {
            
            var identifier: Int64 = 1
            
            MagicalRecord.save({ context in
                
                identifier = User.createOrUpdate(with: dictionary, in: context).identifier
                
            }, completion: { _, error in
                
                completion(User.find(withIdentifier: Int(identifier)), Error(error: error))
            })
        }
    }
    
    //MARK: - Initailization
    
    //MARK: - Deinitialization
    
    //MARK: - Actions
    
    //MARK: - Public
    
    //MARK: - Internal
    
    //MARK: - Private
    
    //MARK: - Overridden
}
