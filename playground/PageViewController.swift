//
//  PageViewController.swift
//  playground
//
//  Created by 김민기 on 2020/05/27.
//  Copyright © 2020 Mingky. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    var views:[String] = ["page01","page02","page03","page04"]
    var index:Int = 0
    var maxIndex:Int = 3
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        print("down")
        if index <= 0{
            return nil
        }else{
            
        
        index -= 1
        return getViewControllerAtIndex(index: index)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        print("up")
        if index >= maxIndex{
            return nil
        }else{
        index += 1
        return getViewControllerAtIndex(index: index)
}
        
    }
    func getViewControllerAtIndex(index:Int) -> UIViewController{
        print(index)
        return self.storyboard!.instantiateViewController(identifier: views[index])
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        self.setViewControllers([getViewControllerAtIndex(index: 0)] , direction: UIPageViewController.NavigationDirection.forward, animated: false, completion: nil)

    }
    func presentationCount(for pageViewController: UIPageViewController) -> Int {

        return self.views.count
        //return self.views.count
    }
    
    // 인디케이터 초기 선택 값
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}
