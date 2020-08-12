//
//  HomeViewController.swift
//  Cinema
//
//  Created by 陳家豪 on 2020/8/8.
//

import UIKit

private let reuseIdentifier = "cell"
class HomeViewController: UIViewController {
    
    var movies = [Movie]()
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        self.collectionView.showsVerticalScrollIndicator = false
        // Do any additional setup after loading the view.
        loadMoviews()
    }
    
    
    func loadMoviews(){
        let movie1 = Movie(movieName: "雲之彼端，約定的地方", movieEnglishName: "THE PLACE PROMISED IN OUR EARLY DAYS", movieTag: .exclusive, movieImage: UIImage(named: "movie1"), movieDuration: 90, movieLevel: .gRated)
        let movie2 = Movie(movieName: "秒速5公分", movieEnglishName: "5 CENTIMETERS PER SECOND", movieTag: .exclusive, movieImage: UIImage(named: "movie2"), movieDuration: 63, movieLevel: .gRated)
        let movie3 = Movie(movieName: "超危險駕駛", movieEnglishName: "UNHINGED", movieTag: .exclusive, movieImage: UIImage(named: "movie3"), movieDuration: 90, movieLevel: .gRated)
        let movie4 = Movie(movieName: "屍速列車:感染半島", movieEnglishName: "PENINSULA", movieTag: .comprehensive, movieImage: UIImage(named: "movie4"), movieDuration: 116, movieLevel: .rRated)
        let movie5 = Movie(movieName: "晚班", movieEnglishName: "LATE SHIFT", movieTag: .interactive, movieImage: UIImage(named: "movie5"), movieDuration: 94, movieLevel: .pgRated)
        let movie6 = Movie(movieName: "你藝/疫下如何", movieEnglishName: "Rrrr...How about you.", movieTag: .reality, movieImage: UIImage(named: "movie6"), movieDuration: 60, movieLevel: .gRated)
        let movie7 = Movie(movieName: "全面啟動10週年紀念版", movieEnglishName: "INCEPTION", movieTag: .classic, movieImage: UIImage(named: "movie7"), movieDuration: 152, movieLevel: .pgRated)
        let movie8 = Movie(movieName: "6號鬼病床", movieEnglishName: "BED NUMBER 6", movieTag: .special, movieImage: UIImage(named: "movie8"), movieDuration: 112, movieLevel: .rRated)
        let movie9 = Movie(movieName: "角落小夥伴電影版:魔法繪本裡的新朋友", movieEnglishName: "SUMIKKOGURASHI GOOD TO BE IN THE CORNER", movieTag: .special, movieImage: UIImage(named: "movie9"), movieDuration: 66, movieLevel: .gRated)
        let movie10 = Movie(movieName: "天劫倒數", movieEnglishName: "GREENLAND", movieTag: .general, movieImage: UIImage(named: "movie10"), movieDuration: 120, movieLevel: .pgRated)
        let movie11 = Movie(movieName: "魔鬼對決", movieEnglishName: "DELIVER US FROM EVIL", movieTag: .general, movieImage: UIImage(named: "movie11"), movieDuration: 108, movieLevel: .gRated)
        let movie12 = Movie(movieName: "記憶拼圖", movieEnglishName: "MEMENTO", movieTag: .classic, movieImage: UIImage(named: "movie12"), movieDuration: 113, movieLevel: .gRated)
        movies.append(movie1)
        movies.append(movie2)
        movies.append(movie3)
        movies.append(movie4)
        movies.append(movie5)
        movies.append(movie6)
        movies.append(movie7)
        movies.append(movie8)
        movies.append(movie9)
        movies.append(movie10)
        movies.append(movie11)
        movies.append(movie12)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toOrder"{
            guard let controller = segue.destination as? OrderViewController else{return}
            if let indexPath = collectionView.indexPathsForSelectedItems?[0]{
                controller.selection = indexPath
                controller.movies = movies
            }
        }
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
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MovieCollectionViewCell
        let movie = movies[indexPath.item]
        cell.movieName.text = movie.movieName
        cell.movieEnglishName.text = movie.movieEnglishName
        if let image = movie.movieImage{
            cell.movieImage.image = image
        }
        cell.movieTag.text = movie.movieTag?.rawValue
        if cell.movieTag.text == ""{
            cell.movieTag.backgroundColor = .clear
        }
        return cell
    }
    
}
