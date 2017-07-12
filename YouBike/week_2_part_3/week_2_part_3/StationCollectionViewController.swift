//
//  StationCollectionViewController.swift
//  week_2_part_3
//
//  Created by 許雅筑 on 2016/9/15.
//  Copyright © 2016年 許雅筑. All rights reserved.
//

import UIKit
import CoreData


class StationCollectionViewController: UICollectionViewController {
    struct stationObject {
        var idName:String = ""
        var stationName:String = ""
        var sareaName:String = ""
        var sbiName:String = ""
        var latName:String = ""
        var lngName:String = ""

    }
    
    var stationsArray :[stationObject] = []
    
    @IBOutlet weak var collectionview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "collectionViewCell", bundle: nil)
        collectionview.registerNib(nib, forCellWithReuseIdentifier: "collectionCell")
        // Register cell classes
        fetch()
        //目前無法同步於view controller,一次會顯出60筆data(有時是20筆)
        

            
        }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    let appdel : AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    func fetch() {

        let moc = DataController().managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Station")
        //會有隨機，每次結果不同，所以加上判斷sno
        fetchRequest.sortDescriptors = [NSSortDescriptor(key:"id",ascending: true)]
        do {
            let results = try moc.executeFetchRequest(fetchRequest) as! [Station]

            for result in results {
                print("Product Name: \(result.sbi), Price: \(result.sna)")
                
                var stationReal = stationObject()
                stationReal.idName = result.id!
                stationReal.stationName = result.sna!
                stationReal.sareaName = result.sarea!
                stationReal.sbiName = result.sbi!
                stationReal.latName = result.lat!
                stationReal.lngName = result.lng!

                print(stationReal.idName)
                
                self.stationsArray.append(stationReal)
                
            }
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.collectionview.reloadData()
                
            })
            
        } catch{
            fatalError()
        }
        
    }

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return stationsArray.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cellIdentifier = "collectionCell"

        let cell:collectionViewCell = self.collectionview.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as! collectionViewCell
        cell.stationNameLabel.text = "\(stationsArray[indexPath.row].sareaName) / \(stationsArray[indexPath.row].stationName)"
        
        cell.bikeAmountLabel.text = stationsArray[indexPath.row].sbiName
        
//        
//        countAmount = indexPath.row
    
        return cell
    }



}
