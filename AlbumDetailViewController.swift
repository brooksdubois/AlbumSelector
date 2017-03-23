//
//  AlbumDetailViewController.swift
//  AlbumStore
//
//  Created by User on 3/23/17.
//  Copyright © 2017 brooks.dubois. All rights reserved.
//
/**
 */

import UIKit

class AlbumDetailViewController: UIViewController {

    var album: Album?
    
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var albumLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        artistLabel.text = album?.artist
        albumLabel.text = album?.title
        yearLabel.text = album?.year
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
