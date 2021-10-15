//
//  BoxOfficeTabelViewController.swift
//  SeSAC_Week03
//
//  Created by ChanhoHwang on 2021/10/13.
//

import UIKit

class BoxOfficeTabelViewController: UITableViewController {
    
    let movieInformation = MovieInformation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieInformation.movie.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 타입 캐스팅
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BoxOfficeTableView", for: indexPath) as? BoxOfficeTableViewCell else { return UITableViewCell() }
        
        let row = movieInformation.movie[indexPath.row]
        
        cell.poseterImageView.backgroundColor = .red
        cell.poseterImageView.image = UIImage(named: row.title)
        cell.titleLabel.text = row.title
        cell.releaseDateLabel.text = row.releaseDate
        cell.overViewLabel.text = row.overview
        cell.overViewLabel.numberOfLines = 0
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 7
    }
    
    // sell clicked action
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Movie", bundle: nil)
        
        guard let vc = sb.instantiateViewController(withIdentifier: "BoxOfficeDetailViewController") as? BoxOfficeDetailViewController else {
            print("ERROR")
            return
        }
        
        // let vc = sb.instantiateViewController(withIdentifier: "BoxOfficeDetailViewController") as! BoxOfficeDetailViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
