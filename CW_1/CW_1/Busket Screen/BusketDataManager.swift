import Foundation
import UIKit

class BusketDataManager: NSObject, UITableViewDelegate, BusketTableViewCellDelegate{
    
    enum Section {
        case main
    }
    
//    var busketModel: BusketModel
    var dataSource: UITableViewDiffableDataSource<Section, Car>!

    

    init( tableView: UITableView) { //busketModel: BusketModel,
//        self.busketModel = busketModel
        super.init()
        configureDataSource(tableView)
        updateData()
    }

    
    private func configureDataSource(_ tableView: UITableView) {
        dataSource = UITableViewDiffableDataSource<Section, Car>(tableView: tableView) {
            (tableView: UITableView, indexPath: IndexPath, car: Car) -> UITableViewCell? in

            let cell = tableView.dequeueReusableCell(withIdentifier: BusketTableViewCell.reuseIdentifier, for: indexPath) as! BusketTableViewCell
            cell.configure(with: car)
            
            cell.delegate = self
            
            return cell
        }
    }
    
    
    func updateData(_ animate: Bool = true) {
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Car>()
        snapshot.appendSections([.main])
        snapshot.appendItems(BusketModel.busket, toSection: .main)
        
        dataSource?.apply(snapshot, animatingDifferences: animate)
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func didDeleteCar(car: Car) {
        var currentSnapshot = dataSource.snapshot()
        
        currentSnapshot.deleteItems([car])
        if let index = BusketModel.busket.firstIndex(where: { $0 == car }) {
            BusketModel.busket.remove(at: index)
        }
        dataSource.apply(currentSnapshot, animatingDifferences: true)
    }
}

