//
//  ViewController.swift
//  JB Glass
//
//  Created by admin on 15/02/18.
//  Copyright © 2018 JB Glass. All rights reserved.
//

import UIKit
import AFNetworking
import ImageSlideshow
import Alamofire
import AlamofireImage
import SDWebImage
import Kingfisher
import LIHImageSlider

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var barButton: UIBarButtonItem!
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet weak var slider1Container: UIView!
    
    var imageArray = [UIImage(named: "logo.png"),UIImage(named: "1.png"),UIImage(named: "2.png"),UIImage(named: "logo.png"),UIImage(named: "1.png"),UIImage(named: "logo.png")]
    
    fileprivate var sliderVc1: LIHSliderViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
       barButton.image = UIImage(named: "logo.png")?.withRenderingMode(.alwaysOriginal)
        sideMenus()
  
        let images: [UIImage] = [UIImage(named: "2.png")!,UIImage(named: "2.png")!,UIImage(named: "2.png")!,UIImage(named: "2.png")!,UIImage(named: "2.png")!,UIImage(named: "2.png")!]
        
        
        
        let slider1: LIHSlider = LIHSlider(images: images)
        slider1.customImageView?.frame=CGRect(x: 0, y: 0, width: 50, height: 50)
        self.sliderVc1  = LIHSliderViewController(slider: slider1)
        sliderVc1.delegate = self as? LIHSliderDelegate
    
        self.addChildViewController(self.sliderVc1)
        
        self.view.addSubview(self.sliderVc1.view)
        self.sliderVc1.didMove(toParentViewController: self)
        
        
    }
    
    override func viewDidLayoutSubviews() {
        
        self.sliderVc1!.view.frame = self.slider1Container.frame
    }
    
    
    func itemPressedAtIndex(index: Int) {
        
        print("index \(index) is pressed")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func sideMenus(){
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            revealViewController().rightViewRevealWidth = 160
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        cell.imgImage.image = imageArray[indexPath.row]
        return cell
    }

}

