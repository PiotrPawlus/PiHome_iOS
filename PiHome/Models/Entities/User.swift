//
//  User.swift
//  PiHome
//
//  Created by Piotr Pawluś on 30/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

@objc(User)
class User: NSManagedObject {
    
    @NSManaged var authenticationToken: String
    @NSManaged var email: String
    @NSManaged var firstName: String
    @NSManaged var identifier: Int64
    @NSManaged var lastName: String
    @NSManaged var role: String
    
    var fullName: String {
        return firstName + " " + lastName
    }
    
    var isAuthorized: Bool {
        return role != "unauthorized"
    }
    
    //MARK: - Class Methods
    
    class func createOrUpdate(with dictionary: [AnyHashable: Any], in context: NSManagedObjectContext) -> User {
        
        let identifier = dictionary["id"] as! Int
        var user = find(withIdentifier: identifier, in: context)
        
        if user == nil {
            user = User.mr_createEntity(in: context)
        }
        
        user!.identifier = Int64(identifier)

        if let authenticationToken = dictionary["authentication_token"] as? String {
            user!.authenticationToken = authenticationToken
        }
        
        if let email = dictionary["email"] as? String {
            user!.email = email
        }
        
        if let firstName = dictionary["first_name"] as? String {
            user!.firstName = firstName
        }
        
        if let lastName = dictionary["last_name"] as? String {
            user!.lastName = lastName
        }
        
        if let role = dictionary["role"] as? String {
            user!.role = role
        }
        
        return user!
    }
    
    class func delete(_ user: User, in context: NSManagedObjectContext) {
        _ = user.mr_deleteEntity(in: context)
    }
    
    class func find(withIdentifier identifier: Int, in context: NSManagedObjectContext = NSManagedObjectContext.mr_default()) -> User? {
        return User.mr_findFirst(byAttribute: "identifier", withValue: identifier, in: context)
    }
    
    //MARK: - Initailization
    
    //MARK: - Deinitialization
    
    //MARK: - Actions
    
    //MARK: - Public
    
    //MARK: - Internal
    
    //MARK: - Private
    
    //MARK: - Overridden
}
