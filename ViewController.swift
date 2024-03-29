//
//  ViewController.swift
//  Please last 3rd-Homework
//
//  Created by 최진문 on 2024/03/26.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad( ) {
        super.viewDidLoad()
        
        tableView.dataSource = self
    }
    
    var todoSources: [TodoVO] = [
        TodoVO(todo: "안녕하세요!", iscompleted: false ), TodoVO(todo: "할 일을 추가하시려면 우측 상단의", iscompleted: false), TodoVO(todo: "추가하기 버튼을 눌러주세요!", iscompleted: false)
    ]
    
    
    @IBAction func addList(_ sender: Any) {
        let title = "할 일 추가"
        let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        let add = UIAlertAction(title: "추가", style: .default) {(_) in
            if let title = alert.textFields?[0].text {
                let toDo = TodoVO(todo: title ,iscompleted: false)
                self.todoSources.append(toDo)
                self.tableView.reloadData() // 테이블 뷰를 새로고침함 -> 안하면 추가 안됨
                
            }
        }
        alert.addAction(cancel)
        alert.addAction(add)
        alert.addTextField(configurationHandler: { (tf) in
            tf.placeholder = "할 일을 입력해주세요"
        })
        
        self.present(alert, animated: false)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            
            if editingStyle == .delete {
                
                self.todoSources.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                
            } else if editingStyle == .insert {
                
            }
        }
    
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todoSources.count // todoSources의 element 수 만큼 row 생성
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: todoTableViewCell.identifier, for: indexPath) as? todoTableViewCell else { return UITableViewCell() }

        // 테이블 뷰의 셀을 구성하는 역할
        cell.setData(self.todoSources[indexPath.row])
        cell.isCompletedSwitch?.tag = indexPath.row  // 각 셀의 UISwitch를 tag로 구분
        return cell
    }
    
    @IBAction func actionSwitch(_ sender: UISwitch) {
        
        self.todoSources[sender.tag].iscompleted = sender.isOn
        
        if sender.isOn {
            self.todoSources[sender.tag].iscompleted = true // 스위치가 on 되면 소스 데이터의 iscompleted도 true 값이 되도록 설정함
            self.tableView.reloadData() // 취소선을 적용할 때 이 코드가 꼭 필요함
        } else {
            self.todoSources[sender.tag].iscompleted = false // 스위치가 off 되면 소스 데이터의 iscompleted도 false 값이 되도록 설정함
            self.tableView.reloadData()
        }
    }
    
}

    
    
    
    
    
    
    
    
    

    
    

// 테스트
