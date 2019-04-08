//
//  ViewController.swift
//  Demo
//
//  Created by Wang on 2019/3/17.
//  Copyright © 2019 Wang. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


struct Music {
    let name: String
    let singer : String
    init(name : String ,singer : String) {
        self.name = name
        self.singer = singer
    }
    
}
extension Music : CustomStringConvertible{
    var description: String {
        return "name: \(name) stringer : \(singer)"
    }
    
}
struct MusicListViewModel {
    let data = Observable.just(
        [
            Music(name: "无条件", singer: "陈奕迅"),
            Music(name: "你曾是少年", singer: "S.H.E"),
            Music(name: "从前的我", singer: "陈洁仪"),
            Music(name: "在木星", singer: "朴树"),
        ]
    )
    
}
class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    //数据源
    let musicListViewMOdel = MusicListViewModel()
    //负责对象销毁
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
         //把数据绑到tableview 上面
        musicListViewMOdel.data
            .bind(to: tableView.rx.items(cellIdentifier: "musicCell")) { _, music,cell in
                cell.textLabel?.text = music.name
                cell.detailTextLabel?.text = music.singer
                
               // cell.detailTextLabel?.text = music.singer
                
        }.disposed(by: disposeBag)
        //点击响应
        tableView.rx.modelSelected(Music.self).subscribe(onNext: {  music in
            print("你选中的歌曲信息\(music)")
        }).disposed(by: disposeBag)
        
    }


}

