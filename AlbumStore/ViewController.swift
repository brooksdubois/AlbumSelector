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
    var albums: [Album] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let album1 = Album(artist: "Eminem", title:"Marshall Mathers LP", year: "1995")
        let album2 = Album(artist: "Eminem", title:"Slim Shady LP" , year: "1996")
        let album3 = Album(artist: "The Brooks Band", title:"Great Album", year: "1998")
        let album4 = Album(artist: "Cher", title:"Your Oldness", year: "1985")
        
        albums.append(album1)
        albums.append(album2)
        albums.append(album3)
        albums.append(album4)

        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier:"AlbumDetailViewController")
            
        guard let albumVC = vc as? AlbumDetailViewController else {
            return
        }
        
        let selectedAlbum = albums[indexPath.row]
        albumVC.album = selectedAlbum
        navigationController?.pushViewController(albumVC, animated: true)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath)
        
        guard let albumCell = cell as? AlbumTableViewCell else{
           return cell
        }
        
        let currentAlbum = albums[indexPath.row]
        
        albumCell.TitleLabel.text = currentAlbum.title
        albumCell.ArtistLabel.text = currentAlbum.artist
        albumCell.yearLabel.text = currentAlbum.year
        
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    func addAlbum(title: String, artist: String){
        
        let newAlbum = Album( artist:artist, title: title, year:"2000")
        albums.append(newAlbum)
        tableView.reloadData()
    }
    //If you want to delete the segue and do it programmatically
    //add album view controller will need a 'storyboard id'
 /*
    @IBAction func gotToAddAlbum( _ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateInitialViewController(withIdentifier: "AddAlbumViewController")
        
        guard let albumVC = vc as? AddAlbumViewController else {
            return
        }
        
        albumVC.delegate = self
        navigationController?.pushViewController(albumVC, animated: true)
        
    }
 */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
    
        guard let vc = segue.destination as? AddAlbumViewController else {
            
            return
        }
        
        vc.delegate = self
        
    }
}

