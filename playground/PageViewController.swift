//
//  PageViewController.swift
//  playground
//
//  Created by 김민기 on 2020/05/27.
//  Copyright © 2020 Mingky. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    var index : Int = 0
    var identifiers:[String] = ["page01", "page02", "page03"]
    lazy var pages : [UIViewController] =
     [
        GetPageByIndex(index: 0),
        GetPageByIndex(index: 1),
        GetPageByIndex(index: 2)
    ]
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return identifiers.count
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let curPageIndex = pages.firstIndex(of: viewController) else {return nil}
        let prePageIndex = curPageIndex - 1
        
        guard prePageIndex >= 0 else { return nil }
        guard pages.count > prePageIndex else { return nil }
        return GetPageByIndex(index: prePageIndex)
        
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pages.firstIndex(of: viewController) else { return nil }
        
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex < pages.count else { return nil }
        
        guard pages.count > nextIndex else { return nil }
        
        return pages[nextIndex]
    }
    func GetPageByIndex(index:Int)-> UIViewController{
        return self.storyboard!.instantiateViewController(identifier: identifiers[index])

    }
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.dataSource = self
        
        self.setViewControllers([pages[0]] , direction: UIPageViewController.NavigationDirection.forward, animated: false, completion: nil)

        let appearance = UIPageControl.appearance(whenContainedInInstancesOf: [UIPageViewController.self])
        appearance.pageIndicatorTintColor = UIColor.white
        appearance.currentPageIndicatorTintColor = UIColor.red
    }
    override func viewDidLayoutSubviews() {
        //corrects scrollview frame to allow for full-screen view controller pages
        for subView in self.view.subviews {
            if subView is UIScrollView {
                subView.frame = self.view.bounds
            }
        }
        super.viewDidLayoutSubviews()
    }
}
