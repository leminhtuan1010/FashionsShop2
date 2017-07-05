//
//  ViewScroll.swift
//  FashionShop2
//
//  Created by Minh Tuan on 7/5/17.
//  Copyright © 2017 Minh Tuan. All rights reserved.
//

import UIKit

class ViewScroll: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    var photo = UIImageView()

    var pageImage: [String] = []
    var first = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        pageImage = ["shop1-0.jpg", "shop1-1.jpg", "shop1-2.jpg", "shop1-3.jgp"]
        pageController.currentPage = 0
        pageController.numberOfPages = pageImage.count
    }
    override func viewDidLayoutSubviews() {
        if (!first){
            first = true
            let pagesScrollViewSize = scrollView.frame.size
            scrollView.contentSize = CGSize(width: pagesScrollViewSize.width * CGFloat(pageImage.count),height: 0)
            for i in 0 ..< pageImage.count{
                let imgView = UIImageView(image: UIImage(named: pageImage[i]+".jpg"))
                imgView.frame = CGRect(x: CGFloat(i) * scrollView.frame.size.width, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height)
                imgView.contentMode = .scaleAspectFit
                scrollView.minimumZoomScale = 0.5
                scrollView.maximumZoomScale = 2
                self.scrollView.addSubview(imgView)
            }
        }
        
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView?{
        return photo
    }
    @IBAction func pull(_ sender: AnyObject) {
        let x = CGFloat(pageController.currentPage) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPoint(x: x, y: 0), animated: true)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageController.currentPage = Int(pageIndex)
    }
    
    
}
