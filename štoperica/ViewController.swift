//
//  ViewController.swift
//  štoperica
//
//  Created by Vuk on 6/2/16.
//  Copyright © 2016 User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var tajmer = Timer()
    
    var sekund = 0
    var minut = 0
    var sat = 0
    var tok = 0 // ova promenljiva je uvedena jer sam imao problema sa prikazom na tajmeru,hteo sam da kad dođu minuti na 59 i sekunde na 59, sat tajmera da pokaže 1 a da se minuti i sekunde vrate na 0 - međutim to se nije događalo istovremeno, a pomoću ove promenljive TOK sam to eliminisao
    var daLiJeTajmerKliknut = false //ovu promeljivu sam uveo zbog toga što se svakim klikom na START tajmera, tajmer ubrzavao, tako da tok sekundi nije išao u realnom vremenu nego su se one obrtale kao da su u pitanju npr stotinke(ako kliknem START nekoliko puta)-----ovo sam namerno ubacio kao varijantu TRUE/FALSE jer sam hteo da imitiram opcional a da ga ne koristim (var daLiJeKliknnut: Int?    pa onda dalje da se ovim opcionalom služim)
    
    func protokVremena() {
        tok = tok + 1
        sekund = sekund + 1
        sekunde.text = String(sekund)
        //sekunde su odlazile na 60 kao i to sam rešio pomoću ovog if uslova
        if sekund > 58 {
            sekund = -1
        }
        if sekund == 0 && tok > 0{
            minut = minut + 1
        }
        minuti.text = String(minut)
        
        if minut == 60{
            minuti.text! = String(0)
            //i minuti su pokazivali 60 tokom samo jedne sekunde pa je ovim to eliminisano
        }
        
        if tok > 3599 {
            minut = 0
            tok = 0
            sat = sat + 1
        }
        
        sati.text = String(sat)
    }

    @IBOutlet weak var sekunde: UILabel!

    @IBOutlet weak var minuti: UILabel!
    
    @IBOutlet weak var sati: UILabel!
    
    @IBAction func pokreni(_ sender: AnyObject) {
        if daLiJeTajmerKliknut == false {
            tajmer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.protokVremena), userInfo: nil, repeats: true)
            daLiJeTajmerKliknut = true
        }
    }
    
    @IBAction func pauziraj(_ sender: AnyObject) {
        tajmer.invalidate()
        daLiJeTajmerKliknut = false
    }
    
    @IBAction func restartuj(_ sender: AnyObject) {
        tajmer.invalidate()
        sekund = 0
        minut = 0
        sat = 0
        tok = 0
        daLiJeTajmerKliknut = false
        sekunde.text! = String(0)
        minuti.text! = String(0)
        sati.text! = String(0)
    }
    
    
}

