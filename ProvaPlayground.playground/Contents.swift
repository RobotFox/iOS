//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var varDouble:Double = 10

var varString:String

//assegnazione valore a variabile
varString = "Ciao"

//stampare a video valore variabile
print(varString)

//dichiarazione variabile opzionale
var temperatura:Double?


//ciclo for normale da 1 a 6
for n in 1...6{
    print(n)
}

//ciclo for normale da 1 a 5
for n in 1..<6{
    print(n)
}


//temperatura=12

//if con costante di test per verificare se variabile è valorizzata
if let testProva = temperatura{
    print("Temperatura è: \(testProva)")
}
else{
    print("Temperatura non è valorizzata")
}


//definizione di un array
var sports = ["calcio","basket","pallavolo","tennis"]

//definizione di un dictionary
var animals = ["CA","CANE","GA","GATTO","PE","PESCE"]

//for eache di un array
for sport in sports {
    print ("Lo sport è \(sport)")
}

//esempio di casting
var testVar:Int = 0

var pippo:Double

//pippo = testVar as Double

//array intrinseco di stringhe perchè valori sono delle stringhe
var provincie = ["VI","PD","VR"]

//array in cui il primo valore è una Stringa mentre il secondo è un Any
var myDic:[String:Any] = ["VI":"Vicenza","Temp":12.3,"Avaible":true]

//aggiungere un valore ad un dictionary
myDic["Gianni"]="Pippo"

//array di valori any
var myTest:[Any] = [0,2,"Pippo",true,12.3]

//ciclo for per stampare il tipo dell'oggetto all'interno di un dictionary, describing è il metodo di String per descrivere il tipo (type of) ecc.....
for myVal in myTest
{
    print(String(describing: type(of: myVal)))
}

//creazione classe con metodo friend
class Figura{
    func Area() -> Double {
        return 0.0
    }
}


//inizializzazione classe con costruttore vuoto
var myFigura = Figura()

//utilizzo metodo della classe
myFigura.Area()

class Quadrato:Figura{
    var lato:Double = 5.0
    override func Area() -> Double {
        return lato*lato
    }
}

var q1 = Quadrato()

//classe con costruttore vuoto
class Cane{
    
    var nome:String
    var razza:String
    var eta:Int
    
    init(){
        nome="Braccobaldo"
        razza="Pastore tedesco"
        eta=12
    }
}


class Calcolatrice{
    
    var valoreDisplay:Double
    
    init(val:Double) {
        self.valoreDisplay=val
    }
    
    func somma(valore:Double) -> Double {
        return valoreDisplay+valore
    }
    func sottrazione(valore:Double) -> Double {
        return valoreDisplay-valore
    }
    func moltiplicazione(valore:Double) -> Double {
        return valoreDisplay*valore
    }
    func divisione(valore:Double) -> Double {
        return valoreDisplay/valore
    }
}


class Calcolatrice2{
    
    
    var valoreDisplay:Double
    //var lastOperation:Operation
    enum Operation {
        case add
        case substract
        case moltiply
        case divide
    }
    
    
    
    
    init() {
        valoreDisplay=0.0
    }
    
    
    func add(num:Double) {
        valoreDisplay=num
    }
    
    
    
    
}


//valore display
var va:Double = 12

//premo il tasto +
var calcSomma = Calcolatrice(val: va)

//valore digitato
var digitato:Double = 10

calcSomma.somma(valore: digitato)

//premo il tasto *
var calcMolt = Calcolatrice(val: va)

calcMolt.moltiplicazione(valore: digitato)


//premo il tasto -
var calcSottr = Calcolatrice(val: va)

calcSottr.sottrazione(valore: digitato)

//premo il tasto /
var calcDiv = Calcolatrice(val: va)

calcDiv.divisione(valore: digitato)

//esempio di enum
enum Operation {
    case add
    case subtract
    case divide
    case multiply
}

var currentOperation:Operation

currentOperation = Operation.divide

print(currentOperation)





var message:String

var receivers = ["Samuele","Massimo","Fulvio"]

enum Errors:Error{
    case receiverNotPresent
    case receiverEmpty
    case messageEmpty
}

func send(receiver:String,msg:String) throws -> Bool {
    
    guard !receiver.isEmpty else {
        throw Errors.receiverEmpty
    }
    
    var receiverPresent:Bool = false
    
    for rec in receivers {
        if rec == receiver {
            receiverPresent = true
        }
    }
    guard receiverPresent else {
        throw Errors.receiverNotPresent
    }
    guard !msg.isEmpty else {
        throw Errors.messageEmpty
    }
    return receiverPresent
}

//I tre metodi per fare try...catch

//Metodo 1: try con catch specifici
do{
    try send(receiver: "Elisa", msg: "Ciao")
}
catch Errors.receiverNotPresent
{
    print("Error: receiver not present")
}
catch Errors.messageEmpty{
    print("Error: message is empty")
}
catch Errors.receiverEmpty{
    print("Error: receiver is empty")
}

//Metodo 2: try con catch generica
do{
    try send(receiver: "Grespo", msg: "Hello")
}
catch {
    print("Generic error: \(error)")
}


//Metodo 3: try con ritorno di nil
let value = try? send(receiver: "Marco", msg: "Hello")
print(value)

//Metodo 4: try senza blocco del programma
//let try! send(receiver: "Luca", msg: "Hello")

let btnStop_ON:UIImage = UIImage(named: "Stop-32-png")!
let btnStop_OFF:UIImage = UIImage(named: "StopFilled")
if started {
    btnStop.setImage(btnStop_OFF, for:UIControlState.normal)
    started = false
}
else{
    btnStop.setImage(btnStop_ON, for: UIControlState.normal)
    started=true
}


func refreshGauge( myDate: Date)
{
    let calendar = Calendar.current
    let hour = calendar.component(.hour, from: myDate)
    let minute = calendar.component(.minute, from: myDate)
    let seconds = calendar.component(.second, from: myDate)
    gaugeBlue.rate = CGFloat(hours)
}



