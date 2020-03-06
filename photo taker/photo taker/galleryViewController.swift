//
//  galleryViewController.swift
//  photo taker
//
//  Created by Reed Wilson on 3/6/20.
//  Copyright © 2020 Reed Wilson. All rights reserved.
//

import UIKit

class galleryViewController: UIViewController {

    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var stack: UIStackView!
    var images: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        galleryTime()

        // Do any additional setup after loading the view.
    }
    
    func galleryTime(){
        let pics = images.map({(image) -> UIImageView in let otherImageView = UIImageView()
            otherImageView.image = image
            otherImageView.frame = CGRect(x: 0, y:0, width: 400, height: 600)
            return otherImageView
        })
        let count = images.count
        stack.frame = CGRect(x: 0, y:0, width: 400, height: count*600)
        scroll.contentSize = CGSize(width: 400, height: count*600)
        for (_, image) in pics.enumerated(){
            stack.addArrangedSubview(image)
            let constraint = NSLayoutConstraint(item: image, attribute: .height, relatedBy: .equal, toItem: pics[0], attribute: .height, multiplier: 1, constant: 1)
            if image != pics[0] {
                stack.addConstraint(constraint)
            }
            
            //Thank you Kadin, the galleryTime function is basically kadins
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
