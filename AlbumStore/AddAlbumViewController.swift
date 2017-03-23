//
//  AddAlbumViewController.swift
//  AlbumStore
//
//  Created by User on 3/22/17.
//  Copyright © 2017 brooks.dubois. All rights reserved.
//

import UIKit

protocol addAlbumProtocol {
    
    func addAlbum(title: String, artist: String)
}

class AddAlbumViewController: UIViewController {

    @IBOutlet weak var artistTextField: UITextField!
    @IBOutlet weak var albumTextField: UITextField!
    
    var delegate: addAlbumProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func albumButtonPressed(_ sender: Any) {
        
        guard let title = artistTextField.text, let album = albumTextField.text else{
            return
        }
        
        delegate?.addAlbum(title: title, artist: album)
        
        //pops the view off of the stack once an album is added
        _ = self.navigationController?.popViewController(animated: true)
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
