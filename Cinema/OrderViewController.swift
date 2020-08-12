//
//  OrderViewController.swift
//  Cinema
//
//  Created by 陳家豪 on 2020/8/12.
//

import UIKit

class OrderViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieEnglishName: UILabel!
    @IBOutlet weak var level: UILabel!
    @IBOutlet weak var dutration: UILabel!
    @IBOutlet weak var movieSegmentedControl: UISegmentedControl!
    @IBOutlet weak var cinemaName: UILabel!
    
    var movies = [Movie]()
    var selection:IndexPath?
    var cinemas = [String]()
    var cinemaSelection:Int?
    var pickerField:UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        showMovieInfo()
        loadCinemas()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
    }
    @IBAction func chooseCinema(_ sender: UIButton) {
        initPickerView()
    }
    func showMovieInfo(){
        guard let index = selection?.item else{return}
        let movie = movies[index]
        movieName.text = movie.movieName
        movieEnglishName.text = movie.movieEnglishName
        level.text = movie.movieLevel.rawValue
        switch movie.movieLevel{
        case .gRated:
            level.backgroundColor = .systemGreen
        case .pgRated:
            level.backgroundColor = .systemBlue
        case .rRated:
            level.backgroundColor = .systemYellow
        case .nc17:
            level.backgroundColor = .systemRed
        }
        dutration.text = "\(movie.movieDuration)分鐘"
        DispatchQueue.main.async {
            self.collectionView.scrollToItem(at: self.selection!, at: .centeredHorizontally, animated: false)
        }
    }
    func initPickerView(){
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = .systemBlue
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "確認", style: .plain, target: self, action: #selector(confirmSelection))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "取消", style: .plain, target: self, action: #selector(cancelSelection))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        pickerField = UITextField(frame: CGRect.zero)
        view.addSubview(pickerField)
        pickerField.inputView = pickerView
        pickerField.inputAccessoryView = toolBar
        pickerField.becomeFirstResponder()
    }
    func loadCinemas(){
        cinemas.append("請選擇影城")
        cinemas.append("台北信義威秀影城")
        cinemas.append("MUVIE CINEMAS 台北松仁威秀影城")
        cinemas.append("台北京站威秀影城")
        cinemas.append("台北日新威秀影城")
        cinemas.append("板橋大遠百威秀影城")
        cinemas.append("桃園統領威秀影城")
        cinemas.append("新竹大遠百威秀影城")
        cinemas.append("新竹巨城威秀影城")
    }
    @objc func confirmSelection(){
        guard let selection = cinemaSelection else{return}
        DispatchQueue.main.async {
            self.cinemaName.text = self.cinemas[selection]
            self.pickerField.resignFirstResponder()
        }
    }
    @objc func cancelSelection(){
        self.pickerField.resignFirstResponder()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension OrderViewController:UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! OrderCollectionViewCell
        cell.movieImage.image = movies[indexPath.item].movieImage
        cell.movieImage.layer.cornerRadius = 10
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selection = indexPath
        DispatchQueue.main.async {
            self.showMovieInfo()
            self.cinemaSelection = nil
            self.cinemaName.text = "請選擇影城"
        }
    }
}
extension OrderViewController:UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cinemas.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cinemas[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.cinemaSelection = row
    }
}
