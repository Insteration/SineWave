//
//  ColorViewController.swift
//  SineWave
//
//  Created by Artem Karmaz on 3/19/19.
//  Copyright © 2019 Johansson Group. All rights reserved.
//

import UIKit

class ColorViewController: UIPageViewController {
    
    let pageControl = UIPageControl.appearance()
    
    private (set) lazy var controllers: [UIViewController] = {
        return [
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Green"),
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Orange"),
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Red")
        ]
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        

        
//        if let index = pageViewController.viewControllers.indexOf(viewController) {
//            print("found at index: \(index)")
//        } else {
//            print("not found (seems unlikely)")
//        }
        
    }
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for view in self.view.subviews {
            if view is UIScrollView {
                view.frame = UIScreen.main.bounds
            } else if view is UIPageControl {
                view.backgroundColor = .clear
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let first = controllers.first {
            setViewControllers([first], direction: .forward, animated: true, completion: nil)
        }
        dataSource = self
    }
}

extension ColorViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = controllers.index(of: viewController) else { return nil }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else { return nil }
        guard controllers.count > previousIndex else { return nil }
        return controllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = controllers.index(of: viewController) else { return nil }
        let nextIndex = viewControllerIndex + 1
        guard controllers.count != nextIndex else { return nil }
        guard controllers.count > nextIndex else { return nil }
        return controllers[nextIndex]
    }
}

extension ColorViewController {
    
    // MARK:- PageView Helpers
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return controllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first,
            let firstViewControllerIndex = controllers.index(of: firstViewController) else { return 0 }
        return firstViewControllerIndex
    }
}
