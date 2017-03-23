//
//  ViewController.swift
//  AlbumStore
//
//  Created by User on 3/22/17.
//  Copyright © 2017 brooks.dubois. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, addAlbumProtocol {

    @IBOutlet weak var tableView: UITableView!
    var albums: [(String,String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tuple1 = ("Eminem","Marshal Mathers LP")
        let tuple2 = ("Eminem","Slim Shady LP")
        let tuple3 = ("The Brooks Band", "Great Album")
        let tuple4 = ("Cher", "Oldness")
        
        albums.append(tuple1)
        albums.append(tuple2)
        albums.append(tuple3)
        albums.append(tuple4)

        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath)
        let album = albums[indexPath.row]
        
        cell.textLabel?.text = album.1
 
        cell.detailTextLabel?.text = album.0
        
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func addAlbum(title: String, artist: String){
        
        let album = (artist, title)
        albums.append(album)
        tableView.reloadData()
    }
    //If you want to segue
    //add album view controller will need a 'storyboard id'
//    @IBAction func gotToAddAlbum( _ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        
//        let vc = storyboard.instantiateInitialViewController(performSegue(withIdentifier: "AddAlbumViewController")
//        
//        guard let albumVC = vc as? AddAlbumViewController else {
//            return
//        }
//        
//        albumVC.delegate = self
//        navigationController?.pushViewController(albumVC, animated: true)
//        
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
    
        guard let vc = segue.destination as? AddAlbumViewController else {
            
            return
        }
        
        vc.delegate = self
        
    }
}

