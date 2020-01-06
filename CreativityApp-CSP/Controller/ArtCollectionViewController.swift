//
//  ArtCollectionViewController.swift
//  CreativityApp-CSP
//
//  Created by Ben Faerber on 10/21/19.
//  Copyright © 2019 CTEC. All rights reserved.
//

import UIKit

public class ArtCollectionViewController : UICollectionViewController
{
    // MARK: Data Members
    var images : [[String]]!
    let resuseIdentifier = "artIdentifier"
    private let sectionInsets = UIEdgeInsets(top: 10.0, left: 2.0, bottom: 10.0, right: 2.0)
    
    // MARK: - Life Cycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        loadImages()
    }
    
    private func loadImages() -> Void
    {
        let i1 : [String] = ["BenFaerberJavaHaiku", "Java Haiku"]
        let i2 : [String] = ["BenFaerberMainframeHaiku", "Mainframe Haiku"]
        let i3 : [String] = ["BenFaerberSwiftHaiku", "Swift Haiku"]
        let i4 : [String] = ["bobpool", "Bobpool"]
        let i5 : [String] = ["fastcar", "Fast Car"]
        let i6 : [String] = ["octocat", "Octokitty"]
        let i7 : [String] = ["sleeping", "Self Driving Cars"]
        images = [i1, i2, i3, i4, i5, i6, i7]
    }
    
    // MARK: - Navigation / Layout
    public override func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    
    public override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section : Int) -> Int {
        if (images != nil)
        {
            return images.count
            // TODO: - fix the return amount
        }
        return 0
    }
    
    // MARK: - CollectionView methods
    public override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let artCell = collectionView.dequeueReusableCell(withReuseIdentifier: resuseIdentifier, for: indexPath) as! ArtCell
        
        artCell.backgroundColor = .purple
        artCell.artImage.image = UIImage.init(named: images[0][indexPath.row])
        artCell.artLabel.text = images[1][indexPath.row]
        
        return artCell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let availableWidth = view.frame.width - sectionInsets.top
        let widthPerItem = availableWidth / 4
        let size = UIImage.init(named: images[indexPath.row][0])?.size
        
        let scale = size!.width / widthPerItem
        let newWidth = scale * size!.width
        let newHeight = scale * size!.height
        
        return CGSize(width: newWidth, height: newHeight)
    }
    
    // MARK: - Handle Touch
    @objc
    private func dismissFullscreenImage(_ sender: UITapGestureRecognizer)
    {
        sender.view?.removeFromSuperview()
    }
    
    public override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let imageView = UIImageView(image: UIImage.init(named: images[indexPath.row][0]))
        imageView.frame = self.view.frame
        imageView.backgroundColor = .green
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
        imageView.addGestureRecognizer(tap)
        
        self.view.addSubview(imageView)
    }
    
    // Mark: - Handle spacing between compents
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return sectionInsets
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return sectionInsets.left
    }
}
