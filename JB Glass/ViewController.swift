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
    @IBOutlet weak var CollectionViewA: UICollectionView!
    
    @IBOutlet weak var CollectionViewB: UICollectionView!
    
    let collectionViewAIdentifier = "ImageCollectionViewCell"
    let collectionViewBIdentifier = "ImageCollectionViewCellB"
    
    var imageArray = [UIImage(named: "logo.png"),UIImage(named: "1.png"),UIImage(named: "2.png"),UIImage(named: "logo.png"),UIImage(named: "1.png"),UIImage(named: "logo.png")]
    var title_list = ["Title1","Title2","Title3","Title4","Title5","Title6"]
    var subtitle_list = ["Subtitle1","Subtitle2","Subtitle2","Subtitle2","Subtitle2","Subtitle2"]
    var imageArray1 = [UIImage(named: "logo.png"),UIImage(named: "1.png"),UIImage(named: "2.png"),UIImage(named: "logo.png"),UIImage(named: "1.png"),UIImage(named: "logo.png")]
    var title_list1 = ["Title1","Title2","Title3","Title4","Title5","Title6"]
    var subtitle_list1 = ["Subtitle1","Subtitle2","Subtitle3","Subtitle4","Subtitle5","Subtitle6"]
    
    fileprivate var sliderVc1: LIHSliderViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        barButton.image = UIImage(named: "logo.png")?.withRenderingMode(.alwaysOriginal)
        sideMenus()
        
        CollectionViewA.delegate = self
        CollectionViewB.delegate = self
        
        CollectionViewA.dataSource = self
        CollectionViewB.dataSource = self
        
        self.view.addSubview(CollectionViewA)
        self.view.addSubview(CollectionViewB)
        
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
        if collectionView == self.CollectionViewA {
            return imageArray.count
        }
        return imageArray1.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.CollectionViewA {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        cell.imgImage.image = imageArray[indexPath.row]
        cell.title_str.text = title_list[indexPath.row]
        cell.subtitle_str.text = subtitle_list[indexPath.row]
        return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCellB", for: indexPath) as! ImageCollectionViewCellB
        cell.imgImage1.image = imageArray[indexPath.row]
        cell.title_str1.text = title_list1[indexPath.row]
        cell.subtitle_str1.text = subtitle_list1[indexPath.row]
        return cell
    }

}

