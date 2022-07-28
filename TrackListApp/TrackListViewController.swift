//
//  TrackListViewController.swift
//  TrackListApp
//
//  Created by ALEKSEY SUSLOV on 27.07.2022.
//

import UIKit

class TrackListViewController: UITableViewController {
    
    var trackList = Track.getTrackList()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        trackList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "trackName", for: indexPath)
        
        let track = trackList[indexPath.row]
        var content = cell.defaultContentConfiguration()
        
        content.text = track.song
        content.secondaryText = track.artist
        content.image = UIImage(named: track.title)
        
        cell.contentConfiguration = content
        
        return cell
    }
    
    /*
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    */

    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let trackDetailsVC = segue.destination as? TrackDetailsViewController else { return }
        
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let track = trackList[indexPath.row]
        
        trackDetailsVC.track = track
    }
}
