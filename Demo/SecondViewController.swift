//
//  SecondViewController.swift
//  Demo
//
//  Created by Wang on 2019/4/8.
//  Copyright © 2019 Wang. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SecondViewController : UIViewController {
    
    //just方法
    let observable = Observable<Int>.just(5)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
