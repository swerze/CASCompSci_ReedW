//
//  ViewController.swift
//  CameraWithFilters
//
//  Created by Kadin Mesriani on 3/3/20.
//  Copyright © 2020 Kadin Mesriani. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.dismiss(animated: true, completion: nil)
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
      //  imageView.image = image
        
        let inputImage = image
        let context = CIContext(options: nil)
        
        if let filter = CIFilter(name: "CISepiaTone"){
            let beginImage = CIImage(image: inputImage)
            filter.setDefaults()
            filter.setValue(beginImage, forKey: kCIInputImageKey)
           
            if let output = filter.outputImage{
            if let cgimg = context.createCGImage(output, from: output.extent){
                let processedImage = UIImage(cgImage: cgimg)
                imageView.image = processedImage
            }
            
        }
        
    }
    
    }
    
    @IBAction func button(_ sender: Any) {
    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
           
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    
}

