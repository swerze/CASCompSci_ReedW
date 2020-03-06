//
//  ViewController.swift
//  photo taker
//
//  Created by Reed Wilson on 2/20/20.
//  Copyright © 2020 Reed Wilson. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UINavigationControllerDelegate,  UIImagePickerControllerDelegate {
    
    var takerController: UIImagePickerController!
    var photos: [UIImage] = []
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video, completionHandler: {(_) in return})
        default:
            return
        }
    }
    
    
    @IBAction func clickPhoto(_ sender: Any) {
        takePhoto()
    }
    
    func takePhoto() {
        takerController = UIImagePickerController()
        takerController.delegate = self
        takerController.sourceType = .camera
        present(takerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        takerController.dismiss(animated: true, completion: nil)
        imageView1.image = info[.originalImage] as? UIImage
    let image = info[.originalImage] as? UIImage
        photos.append(image!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let gallery = segue.destination as? galleryViewController, let sender = sender as? UIButton {
            if sender == button {
                gallery.images = photos
            }
        }
    }
    
}

