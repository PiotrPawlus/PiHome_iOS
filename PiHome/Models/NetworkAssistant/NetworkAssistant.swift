//
//  NetworkAssistant.swift
//  PiHome
//
//  Created by Piotr Pawluś on 30/12/2016.
//  Copyright © 2016 Piotr Pawluś. All rights reserved.
//

typealias ErrorHandler = (Error?) -> Void
typealias NetworkAssistantSuccessHandler = ((URLSessionDataTask, Any?) -> Void)
typealias NetworkAssistantFailureHandler = ((URLSessionDataTask?, Swift.Error) -> Void)
typealias ProgressHandler = ((Progress) -> Void)

typealias UserHandler = (User?, Error?) -> Void

private let NetworkAssistantBaseURL =  "192.168.1.6/api/v1"

class NetworkAssistant: AFHTTPSessionManager {
    
    private static let networkAssistant = NetworkAssistant(baseURL: URL(string: NetworkAssistantBaseURL))
    
    var requestType = NetworkRequestType.login
    
    static var shared: NetworkAssistant {
        return ProcessInfo.isTesting ? MockNetworkAssistant() : networkAssistant
    }
    
    //MARK: - Class Methods
    
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
