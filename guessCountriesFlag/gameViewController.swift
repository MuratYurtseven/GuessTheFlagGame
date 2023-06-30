//
//  gameViewController.swift
//  guessCountriesFlag
//
//  Created by Murat on 26.06.2023.
//

import UIKit

class gameViewController: UIViewController {
    
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var Image2: UIImageView!
    @IBOutlet weak var Image3: UIImageView!
    @IBOutlet weak var Image4: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var skor: UILabel!
    var countries1 = [Flag]()
    var countries2 = [Flag]()
    var countries3 = [Flag]()
    var countries4 = [Flag]()
    var allOfCountries = [Flag]()
    var Gskor : Int = 0
    var answer : String = ""
    var level : Int = 1
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        Image.isUserInteractionEnabled = true
        Image2.isUserInteractionEnabled = true
        Image3.isUserInteractionEnabled = true
        Image4.isUserInteractionEnabled = true
        
        let turkey = Flag(countryName: "Turkey", countryFlagImage: UIImage(named: "turkey")!)
        let england = Flag(countryName: "England", countryFlagImage: UIImage(named: "england")!)
        let germany = Flag(countryName: "Germany", countryFlagImage: UIImage(named: "germany")!)
        let France = Flag(countryName: "France", countryFlagImage: UIImage(named: "france")!)
        let spain = Flag(countryName: "Spain", countryFlagImage:UIImage(named: "spain")! )
        let russia = Flag(countryName: "Russia", countryFlagImage: UIImage(named: "russia")!)
        let italy = Flag(countryName: "Italy", countryFlagImage: UIImage(named: "italy")!)
        let poland = Flag(countryName: "Poland", countryFlagImage: UIImage(named: "poland")!)
        let sweeden = Flag(countryName: "Sweeden", countryFlagImage: UIImage(named: "sweeden")!)
        let greece = Flag(countryName: "Greece", countryFlagImage: UIImage(named: "greece")!)
        let georgia = Flag(countryName: "Georgia", countryFlagImage: UIImage(named: "georgia")!)
        let brazil = Flag(countryName: "Brazil", countryFlagImage: UIImage(named: "brazil")!)
        let india = Flag(countryName: "India", countryFlagImage: UIImage(named: "india")!)
        allOfCountries = [turkey,england,germany,France,spain,russia,italy,poland,sweeden,greece,georgia,brazil,india]
        answer = randomQuestion(gArray: allOfCountries)
        countryName.text = answer
        answer = answer.lowercased()
        let gestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(imageFunc))
        let gestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(imageFunc2))
        let gestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(imageFunc3))
        let gestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(imageFunc4))
        
        Image.addGestureRecognizer(gestureRecognizer1)
        Image2.addGestureRecognizer(gestureRecognizer2)
        Image3.addGestureRecognizer(gestureRecognizer3)
        Image4.addGestureRecognizer(gestureRecognizer4)
        
        let navigationBar = self.navigationController!.navigationBar
        let firstFrame = CGRect(x: navigationBar.frame.width/2 - navigationBar.frame.width/4, y: 0, width: navigationBar.frame.width/2, height: navigationBar.frame.height)
        let firstLabel = UILabel(frame: firstFrame)
        firstLabel.text = "Guess The Flag"
        firstLabel.textAlignment = .center
        navigationBar.addSubview(firstLabel)

    }
    @objc func imageFunc(){
        
        if Image.image == UIImage(named: answer){
            alertMessageFunc(gTitle: "True Answer", gMessage: "You scored 10 points")
            Gskor += 10
            skor.text = "Your score is \(String(Gskor))"
            answer = randomQuestion(gArray: allOfCountries)
            countryName.text = answer
            answer = answer.lowercased()
            
        }
        else {
            alertMessageFunc(gTitle: "False Answer", gMessage: "Think Carefully")
            answer = randomQuestion(gArray: allOfCountries)
            countryName.text = answer
            answer = answer.lowercased()
            
        } }
    
    
    @objc func imageFunc2(){
        
        if Image2.image == UIImage(named: answer){
            Gskor += 10
            skor.text = "Your score is \(String(Gskor))"
            answer = randomQuestion(gArray: allOfCountries)
            countryName.text = answer
            answer = answer.lowercased()
            alertMessageFunc(gTitle: "True Answer", gMessage: "You scored 10 points")
        }
        else {
            answer = randomQuestion(gArray: allOfCountries)
            countryName.text = answer
            answer = answer.lowercased()
            alertMessageFunc(gTitle: "False Answer", gMessage: "Think Carefully")
        } }
    @objc func imageFunc3(){
        
        if Image3.image == UIImage(named: answer){
            Gskor += 10
            skor.text = "Your score is \(String(Gskor))"
            answer = randomQuestion(gArray: allOfCountries)
            countryName.text = answer
            answer = answer.lowercased()
            alertMessageFunc(gTitle: "True Answer", gMessage: "You scored 10 points")
        }
        else {
            answer = randomQuestion(gArray: allOfCountries)
            countryName.text = answer
            answer = answer.lowercased()
            alertMessageFunc(gTitle: "False Answer", gMessage: "Think Carefully")
        } }
    @objc func imageFunc4(){
        
        if Image4.image == UIImage(named: answer){
            Gskor += 10
            skor.text = "Your score is \(String(Gskor))"
            answer = randomQuestion(gArray: allOfCountries)
            countryName.text = answer
            answer = answer.lowercased()
            alertMessageFunc(gTitle: "True Answer", gMessage: "You scored 10 points")
        }
        else {
            answer = randomQuestion(gArray: allOfCountries)
            countryName.text = answer
            answer = answer.lowercased()
            alertMessageFunc(gTitle: "False Answer", gMessage: "Think Carefully")
        } }
    
    func alertMessageFunc(gTitle : String, gMessage : String){
        let gAlertMessage = UIAlertController(title: gTitle, message: gMessage, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Okey", style: UIAlertAction.Style.default)
        gAlertMessage.addAction(okButton)
        self.present(gAlertMessage, animated: true)
    }
    
    
    func randomQuestion(gArray : [Flag])-> String{
        
        var result = ""
        if gArray.count >= 4 {
            var durum = 0
            var oldNumbers = [Int]()
            var rndFlagName = [String]()
            var gBool = true
            
            while durum != 4 {
                let random = Int.random(in: 0..<gArray.count)
                var num = 0
                for i in oldNumbers{
                    if i == random{
                        num += 1
                        gBool = false}}
                if (num == 0){
                    gBool = true}
                if(gBool){
                    oldNumbers.append(random)
                    rndFlagName.append(gArray[random].countryName)
                    switch durum{
                    case 0 : Image.image = gArray[random].countryFlagImage
                    case 1 : Image2.image = gArray[random].countryFlagImage
                    case 2  : Image3.image = gArray[random].countryFlagImage
                    case 3  : Image4.image = gArray[random].countryFlagImage
                        
                    default:
                        print("Error at switch-case")}
                    durum += 1}}
            let number = oldNumbers.randomElement()!
            result = gArray[number].countryName
            
            for i in rndFlagName {
                if i == result {
                    allOfCountries.remove(at: number)}}}
        else{
            skor.text = "Congratulations your score is \(String(Gskor))"
                
            Image.isUserInteractionEnabled = false
            Image2.isUserInteractionEnabled = false
            Image3.isUserInteractionEnabled = false
            Image4.isUserInteractionEnabled = false
            alertMessageFunc(gTitle: "Game Over", gMessage: "Your current score is \(Gskor)")}
       
        return result}
    
    
    }
    

