//
//  ViewController.swift
//  Sianjir
//
//  Created by Maulana on 10/03/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageSlider: UIScrollView!
    @IBOutlet weak var indicatorSlider: UIPageControl!
    
    var scrollWidth: CGFloat! = 0.0
    var scrollHeight: CGFloat! = 0.0
    
    var titles = [K.tetapTenang, K.dapatkanInformasi]
    var images = [K.image.safe, K.image.info]
    
    override func viewDidLayoutSubviews() {
        scrollWidth = imageSlider.frame.size.width
        scrollHeight = imageSlider.frame.size.height
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutIfNeeded()
        
        self.imageSlider.delegate = self
        imageSlider.isPagingEnabled = true
        imageSlider.showsHorizontalScrollIndicator = false
        imageSlider.showsVerticalScrollIndicator = false
        
        var frame = CGRect(x:0, y:0, width: 0, height: 0)
        
        for index in 0..<titles.count {
            frame.origin.x = scrollWidth * CGFloat(index)
            frame.size = CGSize(width: scrollWidth, height: scrollHeight)
            
            let slider = UIView(frame: frame)
            
            let imageView = UIImageView.init(image: UIImage.init(named: images[index]))
            
            imageView.frame = CGRect(x:0,y:0,width:315,height:216)
            imageView.contentMode = .scaleAspectFit
            imageView.center = CGPoint(x:scrollWidth/2,y: scrollHeight/2 - 50)
            
            let caption = UILabel.init(frame: CGRect(x:32,y:imageView.frame.maxY+52,width:scrollWidth-64,height:50))
            caption.numberOfLines = 2
            caption.textAlignment = .center
            caption.font = UIFont.boldSystemFont(ofSize: 16.0)
            caption.textColor = UIColor(named: K.color.mainColor)
            
            caption.text = titles[index]
            
            slider.addSubview(imageView)
            slider.addSubview(caption)
            imageSlider.addSubview(slider)
        }
        
        imageSlider.contentSize = CGSize(width: scrollWidth * CGFloat(titles.count), height: scrollHeight)
        
        self.imageSlider.contentSize.height = 1.0
        
        indicatorSlider.numberOfPages = titles.count
        indicatorSlider.currentPage = 0
    }
    
    @IBAction func changePage(_ sender: Any) {
        imageSlider!.scrollRectToVisible(CGRect(x: scrollWidth * CGFloat ((indicatorSlider?.currentPage)!), y: 0, width: scrollWidth, height: scrollHeight), animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ imageSLider: UIScrollView) {
        setIndiactorForCurrentPage()
    }
    
    func setIndiactorForCurrentPage()  {
        let page = (imageSlider?.contentOffset.x)!/scrollWidth
        indicatorSlider?.currentPage = Int(page)
    }
}

extension ViewController: UIScrollViewDelegate {
    
}

