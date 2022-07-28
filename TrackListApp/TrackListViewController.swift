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
        
        navigationItem.leftBarButtonItem = editButtonItem
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
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let currentTrack = trackList.remove(at: sourceIndexPath.row)
        trackList.insert(currentTrack, at: destinationIndexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let track = trackList[indexPath.row]
        performSegue(withIdentifier: "showDetails", sender: track)
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let trackDetailsVC = segue.destination as? TrackDetailsViewController else { return }
        
//        guard let indexPath = tableView.indexPathForSelectedRow else { return }
//        let track = trackList[indexPath.row]
        
        trackDetailsVC.track = sender as? Track
    }
}
