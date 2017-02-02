//
//  NetworkAssistant.swift
//  PiHome
//
//  Created by Piotr Pawluś on 30/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

typealias NetworkAssistantSuccessHandler = ((URLSessionDataTask, Any?) -> Void)
typealias NetworkAssistantFailureHandler = ((URLSessionDataTask?, Swift.Error) -> Void)
typealias ProgressHandler = ((Progress) -> Void)

typealias ErrorHandler = (Error?) -> Void
typealias DeviceHandler = (Device?, Error?) -> Void
typealias ServerHandler = (String?, Error?) -> Void
typealias UserHandler = (User?, Error?) -> Void

let NetworkAssistantUrl = "NetworkAssistanUrl"
let NetworkAssistantSufixUrl = ":9090/api/v1"

class NetworkAssistant: AFHTTPSessionManager {

    static var networkAssistant: NetworkAssistant? {

        if let address = UserDefaults.standard.string(forKey: NetworkAssistantUrl) {
            return NetworkAssistant(baseURL: URL(string: address))
        } 
        
        return nil
    }
    
    var requestType = NetworkRequestType.register
    
    static var shared: NetworkAssistant {
        return ProcessInfo.isTesting ? MockNetworkAssistant() : networkAssistant! // TO DO
    }
    
    //MARK: - Class Methods
    
    class func shared(forAddress address: String) -> NetworkAssistant {
        
        guard !ProcessInfo.isTesting else {
            return MockNetworkAssistant()
        }
        
        return NetworkAssistant(baseURL: URL(string: "http://" + address + NetworkAssistantSufixUrl))
    }
    
    //MARK: - Initailization
    
    convenience init(baseURL url: URL?) {
        self.init(baseURL: url as URL?, sessionConfiguration: nil)
        
        requestSerializer = NetworkAssistantRequestSerializer()
        responseSerializer.acceptableContentTypes?.insert("application/json")
    }
    
    //MARK: - Deinitialization
    
    //MARK: - Actions
    
    //MARK: - Public
    
    //MARK: - Internal
    
    //MARK: - Private
    
    //MARK: - Overridden
    
    override func delete(_ URLString: String, parameters: Any?, success: NetworkAssistantSuccessHandler?, failure: NetworkAssistantFailureHandler? = nil) -> URLSessionDataTask? {
        
        return super.delete(URLString, parameters: parameters, success: { sessionDataTask, response in
            
            print("DELETE \(sessionDataTask.originalRequest?.url)")
            print("DELETE \(response)")
            
            success?(sessionDataTask, response)
            
        }, failure: { sessionDataTask, error in
            
            print("DELETE \(sessionDataTask?.originalRequest?.url)")
            print("DELETE \(sessionDataTask?.response)")
            
            failure?(sessionDataTask, error)
        })
    }
    
    override func get(_ URLString: String, parameters: Any?, progress downloadProgress: ProgressHandler?, success: NetworkAssistantSuccessHandler?, failure: NetworkAssistantFailureHandler? = nil) -> URLSessionDataTask? {
        
        return super.get(URLString, parameters: parameters, progress: downloadProgress, success: { sessionDataTask, response in
            
            print("GET \(sessionDataTask.originalRequest?.url)")
            print("GET \(response)")
            
            success?(sessionDataTask, response)
            
        }, failure: { sessionDataTask, error in
            
            print("GET \(sessionDataTask?.originalRequest?.url)")
            print("GET \(sessionDataTask?.response)")
            
            failure?(sessionDataTask, error)
        })
    }
    
    override func post(_ URLString: String, parameters: Any?, progress uploadProgress: ProgressHandler?, success: NetworkAssistantSuccessHandler?, failure: NetworkAssistantFailureHandler? = nil) -> URLSessionDataTask? {
        
        return super.post(URLString, parameters: parameters, progress: uploadProgress, success: { sessionDataTask, response in
            
            print("POST \(sessionDataTask.originalRequest?.url)")
            print("POST \(response)")
            
            success?(sessionDataTask, response)
            
        }, failure: { sessionDataTask, error in
            
            print("POST \(sessionDataTask?.originalRequest?.url)")
            print("POST \(sessionDataTask?.response)")
            
            failure?(sessionDataTask, error)
        })
    }
}
