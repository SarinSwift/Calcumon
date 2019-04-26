//
//  CalcumonTests.swift
//  CalcumonTests
//
//  Created by Sarin Swift on 4/25/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import XCTest
@testable import Calcumon

class CalcumonTests: XCTestCase {
    
    var viewController: ViewController!
    
    override func setUp() {
        super.setUp()
        //1
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = storyboard.instantiateInitialViewController() as! ViewController
        let _ = vc.view
        
        //2
        UIApplication.shared.keyWindow!.rootViewController = viewController
        
        //3
        XCTAssertNotNil(vc.view)
    }

    func testSubmitTitle() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let singleCatVC = storyboard.instantiateViewController(withIdentifier: "singleCategoryView") as! SingleCategoryViewController
        let _ = singleCatVC.view
        XCTAssertEqual("Submit", singleCatVC.submitButton.titleLabel?.text)
    }
    
    func testviewControllerNotNil() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! ViewController
        UIApplication.shared.keyWindow!.rootViewController = viewController
        XCTAssertNotNil(viewController.view)
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
