//
//  EmbedRoadListViewController.swift
//  Sianjir
//
//  Created by Auriga Aristo on 27/03/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class EmbedRoadListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var roads: [Road] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: K.identifier.roadCellName, bundle: nil), forCellReuseIdentifier: K.identifier.roadCell)
        loadData()
    }
    
    func loadData(){
        roads = Data.getRoadData()
        tableView.reloadData()
    }
}

extension EmbedRoadListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roads.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let road = roads[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.identifier.roadCell, for: indexPath) as! RoadCell
        cell.roadNameLabel.text = road.name
        
        return cell
    }
}

extension EmbedRoadListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(roads[indexPath.row].name)
        
        //pindah ke road info view controller dengan membawa variabel untuk ditampilkan
//        let vc = RoadInfoViewController(road: roads[indexPath.row])
//        present(vc, animated: true, completion: nil)
    }
}
