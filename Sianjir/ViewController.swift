//
//  ViewController.swift
//  Sianjir
//
//  Created by Maulana on 10/03/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var imageSlider: UIScrollView!
    @IBOutlet weak var indicatorSlider: UIPageControl!

    
    var scrollWidth: CGFloat! = 0.0
    var scrollHeight: CGFloat! = 0.0
    
    var titles = ["Tetap tenang, jangan panik belebihan ketika banjir, Keep stay safe !!", "Dapatkan informasi cuaca terkini dan panduan tentang info banjir di sekitar anda"]
    var images = ["Safe", "Info"]
    
    override func viewDidLayoutSubviews() {
        scrollWidth = imageSlider.frame.size.width
        scrollHeight = imageSlider.frame.size.height
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
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
            let mainColor = hexStringToUIColor(hex: "#FD5959")
            caption.textColor = mainColor
                    
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



