//
//  VeiwModel.swift
//  MVVM_RND
//
//  Created by Rahul Vishwakarma on 08/09/23.
//

import Foundation


class ViewModel: NSObject {
    
    var service: Services!
    
    var viewModelDataBinding: (() -> ()) = {}
    
    private(set) var dummyCartData: DummyCartModel! {
        
        didSet {
            self.viewModelDataBinding()
        }
    }
    
    
    override init() {
        super.init()
        
        service = Services()
        callDummyCartService()
    }
    
    
    func callDummyCartService() {
        
        service.getData { status, cartData, Message in
            
            if status {
                
                self.dummyCartData = cartData
                
            }
        }
    }
}
