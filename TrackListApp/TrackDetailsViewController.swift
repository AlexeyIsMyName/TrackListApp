//
//  TrackDetailsViewController.swift
//  TrackListApp
//
//  Created by ALEKSEY SUSLOV on 28.07.2022.
//

import UIKit

class TrackDetailsViewController: UIViewController {

    @IBOutlet var imageCover: UIImageView!
    @IBOutlet var trackTitleLabel: UILabel!
    
    var track: Track!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageCover.image = UIImage(named: track.title)
        trackTitleLabel.text = track.title
    }
}
