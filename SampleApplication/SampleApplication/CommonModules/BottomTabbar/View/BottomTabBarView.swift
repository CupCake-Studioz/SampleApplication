//
//  BottomTabBarView.swift
//  SampleApplication
//
//  Created by Shubham Shukla on 20/05/21.
//

import Foundation
import UIKit

protocol BottomTabBarViewDelegate:AnyObject {
    func didSelectTabBarItem(_ tabBarItem: BottomTabBarModel)
}

class BottomTabBarView: UIView{
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var uvBottomListContainer: UIView!
    @IBOutlet weak var cvBottomList: UICollectionView!
    @IBOutlet weak var cvHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var cvTopConstraint: NSLayoutConstraint!
    
    var bottomListItems = [BottomTabBarModel]()
    var maxItemsPerRow = 4
    weak var delegate: BottomTabBarViewDelegate?
    
    private let bottomListCVCell = "BottomTabBarCVCell"
    
    private var actionCellState: Actions = .None
    private lazy var moreActionCellBottomListModel = BottomTabBarModel(title: "MORE", image: UIImage(named: "expand-more"), action: .More)
    private lazy var lessActionCellBottomListModel = BottomTabBarModel(title: "LESS", image: UIImage(named: "expand-less"), action: .Less)
    
    private var displayItemsList = [BottomTabBarModel]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("BottomTabBarView", owner: self, options: nil)
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        
        cvBottomList.dataSource = self
        cvBottomList.delegate = self
        cvBottomList.register(UINib(nibName: bottomListCVCell, bundle: nil), forCellWithReuseIdentifier: bottomListCVCell)
        cvBottomList.backgroundColor = UIColor.Neutral_N100
        uvBottomListContainer.backgroundColor = UIColor.Neutral_N100
    }
    
    func setupData(){
        
        if actionCellState == .None && (bottomListItems.count > maxItemsPerRow){
            actionCellState = .More
        }
        
        if actionCellState == .Less{
            changeTopConstraint(12.0)
            uvBottomListContainer.roundCorners([.topLeft, .topRight], radius: 20.0)
            displayItemsList = bottomListItems
            
            if displayItemsList.count >= maxItemsPerRow - 1{
                displayItemsList.insert(lessActionCellBottomListModel, at: (maxItemsPerRow - 1))
            }
            
            sortDataToDisplay()
            
        }else if actionCellState == .More{
            changeTopConstraint(0.0)
            uvBottomListContainer.roundCorners([.topLeft, .topRight], radius: 0.0)
            displayItemsList = Array(bottomListItems.prefix(maxItemsPerRow - 1))
            displayItemsList.append(moreActionCellBottomListModel)
            
        }else{
            changeTopConstraint(0.0)
            displayItemsList = bottomListItems
        }
        
        reloadCollectionView()
    }
    
    private func sortDataToDisplay(){
        
        var blankCellCount = (displayItemsList.count % maxItemsPerRow)
        if blankCellCount != 0{
            blankCellCount = maxItemsPerRow - blankCellCount
        }
        
        for _ in 0..<blankCellCount{
            displayItemsList.append(BottomTabBarModel(title: nil, image: nil, action: .None))
        }
        
        displayItemsList = displayItemsList.reversed()
        
        var tempArray = [BottomTabBarModel]()
        var offsetIndex = 0
        
        while ((offsetIndex + maxItemsPerRow) <= displayItemsList.count){
            let subArray = Array(displayItemsList[offsetIndex..<(offsetIndex + maxItemsPerRow)])
            tempArray += subArray.reversed()
            offsetIndex += maxItemsPerRow
        }
        
        displayItemsList = tempArray
    }
    
    private func changeTopConstraint(_ value:CGFloat){
        DispatchQueue.main.async {
            self.cvTopConstraint.constant = value
        }
    }
    
    private func reloadCollectionView(){
        DispatchQueue.main.async {
            
            let height = self.cvBottomList.collectionViewLayout.collectionViewContentSize.height
            self.cvHeightConstraint.constant = height
            
            self.cvBottomList.reloadData()
        }
    }
    
    private func reloadData(){
        DispatchQueue.main.async {
            self.cvBottomList.reloadData()
        }
    }
    
    private func toggleActionCellStateIfNeeded(_ indexPath:IndexPath){
        if actionCellState == .More && indexPath.row == maxItemsPerRow - 1{
            actionCellState = .Less
        }else if actionCellState == .Less{
            actionCellState = .More
        }
    }
}

extension BottomTabBarView: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return displayItemsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: bottomListCVCell, for: indexPath as IndexPath) as? BottomTabBarCVCell else { return UICollectionViewCell() }
        
        if indexPath.row >= displayItemsList.count{
            return UICollectionViewCell()
        }
        cell.setData(displayItemsList[indexPath.row])
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        let collectionViewWidth = cvBottomList.bounds.width
        var itemWidth : CGFloat = 0.0
        
        if bottomListItems.count < maxItemsPerRow{
            itemWidth = (collectionViewWidth / CGFloat(bottomListItems.count))
        }else{
            itemWidth = (collectionViewWidth / CGFloat(maxItemsPerRow))
        }
        
        return CGSize(width: itemWidth, height: 64.0)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0.0, bottom: 0.0, right: 0.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        if displayItemsList[indexPath.row].action == .None{
            return
        }
        
        self.reloadData()
        toggleActionCellStateIfNeeded(indexPath)
        self.delegate?.didSelectTabBarItem(displayItemsList[indexPath.row])
        setupData()
    }
    
}

extension BottomTabBarView: UIGestureRecognizerDelegate{
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view?.isDescendant(of: uvBottomListContainer) == true {
           return false
        }
        return true
    }
    
}


