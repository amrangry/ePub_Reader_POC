//
//  LibraryListViewController.swift
//  EpubBookReader
//
//  Created by Amr Elghadban on 24/10/2022.
//

import FolioReaderKit

class LibraryListViewController: UIViewController {
    
    @IBOutlet weak var bookTitle: UILabel?
    
    var bookName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        title = bookName
        bookTitle?.isHidden = true
    }
    
    @IBAction func folioReaderKitPressed(_ sender: Any) {
        guard let name = bookName else { return }
        guard let bookPath = Bundle.main.path(forResource: name, ofType: "epub") else {
            return
        }
        
        //let url = URL(fileURLWithPath: bookPath, isDirectory: false)
        let config = FolioReaderConfig()
        let folioReader = FolioReader()
        folioReader.presentReader(parentViewController: self, withEpubPath: bookPath, andConfig: config)
    }
    
}

