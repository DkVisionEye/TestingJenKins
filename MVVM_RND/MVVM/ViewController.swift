//
//  ViewController.swift
//  MVVM_RND
//
//  Created by Rahul Vishwakarma on 08/09/23.
//

import UIKit



class tableCartCell: UITableViewCell {
    
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDesc: UILabel!
    
    
   
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}




class ViewController: UIViewController {
    
    var str: [String] = []
    @IBOutlet weak var tableViewCart: UITableView!
    var dataSource: TablesDataSource<tableCartCell,Product>!
    
    //View Model
    var viewModel: ViewModel!
    
    var cartData: DummyCartModel!

    //
    override func viewDidLoad() {
        super.viewDidLoad()

        
//        Normal Flow
//        tableViewCart.dataSource = self
        
        callToViewModelForUIUpdate()
        
    }
    
    
    //ViewModels Setups
    func callToViewModelForUIUpdate(){
        
        viewModel = ViewModel()
        self.viewModel.viewModelDataBinding = {
            self.updateDataSource()
        }
    }
    
    
    //Update UI curresponding Service
    func updateDataSource() {
        
        
        //ExtraOrdinary FLow
        dataSource = TablesDataSource(cellIdentifier: "tableCartCell", items: viewModel.dummyCartData.carts[0].products, configureCell: { cell, product in

            cell.labelTitle.text = product.title
            cell.labelDesc.text = "Price: \(product.price)  Disc Price: \(product.discountedPrice)"

        })

        DispatchQueue.main.async { [self] in
            self.tableViewCart.dataSource = self.dataSource
            self.tableViewCart.reloadData()
        }
        
//        Normal Flow
//        DispatchQueue.main.async { [self] in
//           cartData = viewModel.dummyCartData
//            tableViewCart.reloadData()
//        }
        
    }
    
}


//  Normal Flow

extension ViewController: UITableViewDataSource {


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cartData != nil ? cartData.carts[0].products.count : 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {


        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCartCell") as! tableCartCell
        let data =  cartData.carts[0].products[indexPath.row]

        cell.labelTitle.text = data.title
        cell.labelDesc.text = "Price: \(data.price)  Disc Price: \(data.discountedPrice)"
        return cell
    }
    
    
    
    func calcNu(n1: Int, n2: Int) -> Double {
        
        return Double(n1+n2)
        
    }
    

}


