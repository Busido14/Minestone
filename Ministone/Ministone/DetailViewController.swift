//
//  DetailViewController.swift
//  Ministone
//
//  Created by Артем Чжен on 14/12/22.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        title = "This is flag of the  \(selectedImage!.replacingOccurrences(of: "@3x.png", with: "")) country"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let imageToLoad = selectedImage {
            
            imageView.image = UIImage(named: imageToLoad)
            imageView.layer.borderWidth = 1
            
        }
        //        func viewWillAppear(_ animated: Bool) {
        //            super.viewWillAppear(animated)
        //            navigationController?.hidesBarsOnTap = true
        //        }
        //
        //        func viewWillDisappear(_ animated: Bool) {
        //            super.viewWillDisappear(animated)
        //            navigationController?.hidesBarsOnTap = false
        //
        //
        
    }
    @objc func shareTapped() {
        guard let image = (imageView.image?.jpegData(compressionQuality: 0.8)) else {
            print("No image found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image] + ["\(selectedImage!.replacingOccurrences(of: "@3x.png", with: ""))"], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}
