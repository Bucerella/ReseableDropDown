//
//  TableViewController.swift
//  DropDown
//
//  Created by Buse ERKUŞ on 16.03.2019.
//  Copyright © 2019 Buse ERKUŞ. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    fileprivate let CELL_ID = "CELL_ID"
    fileprivate var sections: [SectionData] = [
        SectionData(
            open: true,
            data: [
                CellData(title: "Angry Cat", featureImage: UIImage(named: "cat")!),
                CellData(title: "Horrible Snake", featureImage: UIImage(named: "snake")!)
            ]
        ),
        SectionData(
            open: true,
            data: [
                CellData(title: "Rain Forest", featureImage: UIImage(named: "forest")!),
                CellData(title: "Coconuts Free", featureImage: UIImage(named: "coconut")!),
                CellData(title: "Amazing Adventure", featureImage: UIImage(named: "adventure")!),
                CellData(title: "Autumn", featureImage: UIImage(named: "autumn")!)
                ]
        ),
        SectionData(
            open: true,
            data:[
                CellData(title: "Avesome Adventure", featureImage: UIImage(named: "adventure")!),
                CellData(title: "Coconut Tree", featureImage: UIImage(named: "coconut")!),
                CellData(title: "Run Forest Run!", featureImage: UIImage(named: "forest")!)
            ])
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 228/255, green: 230/255, blue: 234/255, alpha: 1)
        navigationItem.title = "DropDown Example"
        setupTableView()
    }
    fileprivate func setupTableView(){
        tableView.register(CardCell.self, forCellReuseIdentifier: CELL_ID) //Tableview CELLID
        tableView.allowsSelection = false //TableView fields cannot be selected
        tableView.separatorStyle = .none
    }
    
    //CELL DATA
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CELL_ID, for: indexPath) as! CardCell
        let section = sections[indexPath.section]
        let cellData = section.data[indexPath.row]
        cell.cellData = cellData
        return cell
    }
    
    //Section & Rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !sections[section].open{
            return 0
        }
        return sections[section].data.count
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    //Header
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let button = UIButton()
        button.setTitle("To Turn Off Press Section", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.tag = section
        button.addTarget(self, action: #selector(self.openSection), for: .touchUpInside)
        return button
    }
    //One section height
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
    @objc fileprivate func openSection(button: UIButton){
        
        let section = button.tag
        var indexPaths = [IndexPath]()
        
        for row in sections[section].data.indices{
            let indexPathToDelete = IndexPath(row: row, section: section)
            indexPaths.append(indexPathToDelete)
        }
        let isOpen = sections[section].open
        
        //SECTİON is Open or Close Controller
        sections[section].open = !isOpen
        button.setTitle(isOpen ? "To Turn Open Press" : "To Turn Off Press", for: .normal)
        
        if isOpen{
            tableView.deleteRows(at: indexPaths, with: .fade)
        }else{
            tableView.insertRows(at: indexPaths, with: .fade)
        }
    }
}

