//
//  APIManager.swift
//  Panda Rides
//
//  Created by Kausik Jati on 18/03/18.
//  Copyright © 2018 Kausik Jati. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire



class APIManager{
    
    static let sharedInstance   =   APIManager()
    
    private init(){
        
    }
    
    private func generateUrlRequst(forurl servidename : String ) -> String
    {
        let url = DomainURL + servidename
        
        return url
     
    }

    
    public func getBikelisting(for urlString :String ,  parameters : [String : String] ,onCompletion:@escaping (JSON? ,Error?)-> Void)
    {
        let resust = self.generateUrlRequst(forurl: urlString)
        do
        {
            
            
            Alamofire.request(resust, method: .post, parameters: parameters , headers: nil).validate().responseJSON {
                response in
                switch response.result {
                case .success:
                   
                    guard let data = response.data else { return }
                    let json  =  JSON(data)
                    DispatchQueue.main.async {
                        
                        onCompletion(json , nil)
                    }

                    break
                case .failure(let error):
                    
                    DispatchQueue.main.async {
                        
                        onCompletion(nil ,error)
                        print(error.localizedDescription)
                    }
                }
            }
        }
        
        
   
        
    }
    
    
    
}
