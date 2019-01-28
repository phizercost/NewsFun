//
//  ArticleTableViewController.swift
//  
//
//  Created by Phizer Cost on 1/22/19.
//

import UIKit
import Kingfisher

class ArticleTableViewController: UITableViewController {

    var articles = [Article]()
    override func viewDidLoad() {
        super.viewDidLoad()
        getArticles()
        
        tableView.separatorStyle = .none
       
    }
    
    func getArticles(){
        NewsHelper().getArticles { (articles) in
            
            self.articles = articles
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return articles.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as? ArticleCell {
            
            let article = articles[indexPath.row]
            cell.titleLabel.text = article.title
            cell.categoryLabel.text = article.category.rawValue
            cell.categoryLabel.backgroundColor = article.categoryColor
            
            let url = URL(string: article.urlToImage)
            cell.articleImageView.kf.setImage(with: url, placeholder: UIImage(named: "news"))
            //cell.articleImageView.kf.setImage(with: url, placeholder: UIImage(named: "news"), options: nil, progressBlock: nil, completionHandler: nil)
            

        return cell
        }
        return UITableViewCell()
    }
    
    @IBAction func reloadTaped(_ sender: Any) {
        getArticles()
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articles[indexPath.row]
        performSegue(withIdentifier: "goToURL", sender: article)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToURL" {
            if let article = sender as? Article {
                if let webVC = segue.destination as? ArticleWebUIViewController {
                    webVC.article = article
                }
            }
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
    }

   

}


class ArticleCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var articleImageView: UIImageView!
    
    
    @IBOutlet weak var categoryLabel: UILabel!
}
