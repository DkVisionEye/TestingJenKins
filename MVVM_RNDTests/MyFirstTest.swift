//
//  MyFirstTest.swift
//  MVVM_RNDTests
//
//  Created by Rahul Vishwakarma on 22/09/23.
//

import XCTest
@testable import MVVM_RND


final class MyFirstTest: XCTestCase {

    override func setUpWithError() throws {
        
        //
        continueAfterFailure = false
    }    
    
    func testingFunc() {
        
        
        //Arrange
        let n1 = 38
        let n2 = 12
        
//        Act
        let instance = ViewController()
        let num = instance.calcNu(n1: n1, n2: n2)
        
        //Assert
        XCTAssert(num == 50.0)
        
    }
    
    
   
    

}
