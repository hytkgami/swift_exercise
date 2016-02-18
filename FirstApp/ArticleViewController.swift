import UIKit

class ArticleViewController: UIViewController {

	var article : [String: String?]!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		print(article)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
