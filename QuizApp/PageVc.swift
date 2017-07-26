//
//  PageVc.swift
//  QuizApp
//
//  Created by Nitish Dash on 25/07/17.
//  Copyright © 2017 Nitish Dash. All rights reserved.
//

import UIKit

class PageVc: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
//     var VCArr: [UIViewController] {
//        return [self.VCInstance(name: "firstvc"),
//                self.VCInstance(name: "secondvc"),
//                self.VCInstance(name: "thirdvc")]
//    }
//    
//    private func VCInstance(name: String) -> UIViewController {
//        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
//    }
// 
    
    
     var viewControllerList:[UIViewController] = {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let vc1 = sb.instantiateViewController(withIdentifier: "firstvc")
        let vc2 = sb.instantiateViewController(withIdentifier: "secondvc")
        let vc3 = sb.instantiateViewController(withIdentifier: "thirdvc")
        
        return [vc1, vc2, vc3]
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        
        if let firstViewController = viewControllerList.first {
            self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        
        
        NSLog("EXECUTED")
    }
    
    
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = viewControllerList.index(of: viewController) else {
            return nil
        }

        let prevIndex = viewControllerIndex - 1
        
        guard prevIndex >= 0 else {
            return viewControllerList.last
        }
        
        guard viewControllerList.count > prevIndex else {
            return nil
        }
        
        return viewControllerList[prevIndex]
        
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {

        
        guard let viewControllerIndex = viewControllerList.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex >= 0 else {
            return viewControllerList.last
        }
        
        guard viewControllerList.count > nextIndex else {
            return nil
        }
        
        return viewControllerList[nextIndex]
        
    }
    
    
     public func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return viewControllerList.count
    }
    
     public func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        
        guard let firstViewController = viewControllers?.first, let firstViewControllerIndex = viewControllerList.index(of: firstViewController) else {
            return 0
        }
        
        return firstViewControllerIndex
    }

    
    
}

