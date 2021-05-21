//
//  DashboardViewController.swift
//  SampleApplication
//
//  Created by Shubham Shukla Singh on 20/05/21.
//

import UIKit

class DashboardViewController: UIViewController {
    
    @IBOutlet weak var uvBottomTabBar: UIView!
    
    private var bottomTabBar : BottomTabBarView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.topItem?.title = "Dashboard"
        setUpBottomTabBarView()
    }
    
    private func setUpBottomTabBarView(){
        
        
        DispatchQueue.main.async {
            self.bottomTabBar?.removeFromSuperview()
            
            let accDetailBottomListViewFrame = CGRect(x: self.uvBottomTabBar.bounds.origin.x, y: self.uvBottomTabBar.bounds.origin.y + 1, width: self.uvBottomTabBar.bounds.width, height: self.uvBottomTabBar.bounds.height - 1)
            self.bottomTabBar = BottomTabBarView(frame: accDetailBottomListViewFrame)
            
            self.bottomTabBar?.bottomListItems = self.getBottomTabBarItem()
            self.bottomTabBar?.delegate = self
            self.bottomTabBar?.maxItemsPerRow = 4
            self.bottomTabBar?.setupData()
            
            
            if let _oppDetailBottomListView = self.bottomTabBar{
                self.uvBottomTabBar.addSubview(_oppDetailBottomListView)
            }
        }
    }
    
    
    func getBottomTabBarItem() -> [BottomTabBarModel] {
        var bottomListItems = [BottomTabBarModel]()
        
        bottomListItems.append(BottomTabBarModel(title: "Tab 1", image: UIImage.init(named: "lsq_direction"), action: .Controller))
        
        bottomListItems.append(BottomTabBarModel(title: "Tab 2", image: UIImage.init(named: "lsq_direction"), action: .Controller))
        
        bottomListItems.append(BottomTabBarModel(title: "Tab 3", image: UIImage.init(named: "lsq_direction"), action: .Controller))
        
        bottomListItems.append(BottomTabBarModel(title: "Tab 4", image: UIImage.init(named: "lsq_direction"), action: .Controller))
        
        bottomListItems.append(BottomTabBarModel(title: "Tab 5", image: UIImage.init(named: "lsq_direction"), action: .Controller))
        
        bottomListItems.append(BottomTabBarModel(title: "Tab 6", image: UIImage.init(named: "lsq_direction"), action: .Controller))
        
        bottomListItems.append(BottomTabBarModel(title: "Tab 7", image: UIImage.init(named: "lsq_direction"), action: .Controller))
        
        bottomListItems.append(BottomTabBarModel(title: "Tab 8", image: UIImage.init(named: "lsq_direction"), action: .Controller))
        
        bottomListItems.append(BottomTabBarModel(title: "Tab 9", image: UIImage.init(named: "lsq_direction"), action: .Controller))
        
        return bottomListItems
    }
    
    
}

extension DashboardViewController: BottomTabBarViewDelegate{
    func didSelectTabBarItem(_ tabBarItem: BottomTabBarModel) {
     
        bottomTabBar?.removeFromSuperview()
        
        if let _bottomTabBar = bottomTabBar{
            
            if tabBarItem.action == .More{
                _bottomTabBar.frame = self.view.bounds
                self.view.addSubview(_bottomTabBar)
            }else{
                let _bottomTabBarFrame = CGRect(x: self.uvBottomTabBar.bounds.origin.x, y: self.uvBottomTabBar.bounds.origin.y + 1, width: self.uvBottomTabBar.bounds.width, height: self.uvBottomTabBar.bounds.height - 1)
                _bottomTabBar.frame = _bottomTabBarFrame
                self.uvBottomTabBar.addSubview(_bottomTabBar)
            }
            
            if tabBarItem.action == .More || tabBarItem.action == .Less {
                return
            }
            
            let viewController = UIStoryboard.init(name: "TabBar", bundle: nil).instantiateViewController(identifier: "ViewController1") as? ViewController1
            viewController?.centerTitle = "Welcome to " + (tabBarItem.title ?? "")
            self.navigationController?.pushViewController(viewController ?? UIViewController(), animated: true)
        }
        
    }
}
