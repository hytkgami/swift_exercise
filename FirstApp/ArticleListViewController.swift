import UIKit
import Alamofire
import SwiftyJSON

class ArticleListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	let table = UITableView() // プロパティにテーブルを追加
	
	
	var articles : [[String: String?]] = [] // 記事を入れるプロパティを定義
	
	func getArticles() {
		Alamofire.request(.GET, "https://qiita.com/api/v2/items")
			.responseJSON { response in
				guard let object = response.result.value else {
					return
				}
				
				let json = JSON(object)
				
				json.forEach{ (_, data) in
					let article: [String: String?] = [
						"title": data["title"].string,
						"userId": data["user"]["id"].string,
					] // 1つの記事を表す辞書型をつくる
					self.articles.append(article)
				}
				self.table.reloadData() // TableViewを更新
		}
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		title = "新着記事" // Navigation Barのタイトルを設定
		table.frame = view.frame // tableの大きさをviewの大きさに合わせる
		view.addSubview(table) // viewにtableを乗せる
		table.dataSource = self
		getArticles()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return articles.count
	}
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: "cell") // Subtitleのあるセルを生成
		let article = articles[indexPath.row] // 行数番目の記事を取得
		cell.textLabel?.text = article["title"]! // 記事のタイトルをtextLabelにセット
		cell.detailTextLabel?.text = article["userId"]! // 投稿者のUserIdをdetailTextLabelにセット
		return cell
	}
	
	// 押された時の処理
	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
	}
}
