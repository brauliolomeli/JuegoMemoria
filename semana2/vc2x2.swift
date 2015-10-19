//
//  vc2x2.swift
//  semana2
//
//  Created by Braulio Lomeli on 17/10/15.
//  Copyright © 2015 Braulio Lomeli. All rights reserved.
//

import UIKit
import Foundation

class vc2x2: UIViewController {
    
    //0 inicial, 1 una opcion abierta, 2 2 opciones abiertas OK, 3 2 opciones abiertas ERR, 4 todo abierto
    var estatusAp = 0, posibles = 0, puntos = 0, abiertos = 0, aciertosContinuos = 0, btnAbierto = -1, btnIncorrecto = -1, numeroOpciones=0
    var botones: [BtnOpcion] = []
    var botonesPendientes: [Int] = []
    
    @IBOutlet weak var bt1: BtnOpcion!
    @IBOutlet weak var bt2: BtnOpcion!
    @IBOutlet weak var bt3: BtnOpcion!
    @IBOutlet weak var bt4: BtnOpcion!
    @IBOutlet weak var bt5: BtnOpcion!
    @IBOutlet weak var bt6: BtnOpcion!
    @IBOutlet weak var bt7: BtnOpcion!
    @IBOutlet weak var bt8: BtnOpcion!
    @IBOutlet weak var bt9: BtnOpcion!
    @IBOutlet weak var bt10: BtnOpcion!
    @IBOutlet weak var bt11: BtnOpcion!
    @IBOutlet weak var bt12: BtnOpcion!
    @IBOutlet weak var bt13: BtnOpcion!
    @IBOutlet weak var bt14: BtnOpcion!
    @IBOutlet weak var bt15: BtnOpcion!
    @IBOutlet weak var bt16: BtnOpcion!
    
    @IBOutlet weak var lbExitos: UILabel!
    @IBOutlet weak var lbMensaje: UILabel!
    @IBAction func b1p(sender: AnyObject) {
        seleccionaBoton(0)
    }
    @IBAction func b2p(sender: AnyObject) {
        seleccionaBoton(1)
    }
    @IBAction func b3p(sender: AnyObject) {
        seleccionaBoton(2)
    }
    @IBAction func b4p(sender: AnyObject) {
        seleccionaBoton(3)
    }
    @IBAction func b5p(sender: AnyObject) {
        seleccionaBoton(4)
    }
    @IBAction func b6p(sender: AnyObject) {
        seleccionaBoton(5)
    }
    @IBAction func b7p(sender: AnyObject) {
        seleccionaBoton(6)
    }
    @IBAction func b8p(sender: AnyObject) {
        seleccionaBoton(7)
    }
    @IBAction func b9p(sender: AnyObject) {
        seleccionaBoton(8)
    }
    @IBAction func b10p(sender: AnyObject) {
        seleccionaBoton(9)
    }
    @IBAction func b11p(sender: AnyObject) {
        seleccionaBoton(10)
    }
    @IBAction func b12p(sender: AnyObject) {
        seleccionaBoton(11)
    }
    @IBAction func b13p(sender: AnyObject) {
        seleccionaBoton(12)
    }
    @IBAction func b14p(sender: AnyObject) {
        seleccionaBoton(13)
    }
    @IBAction func b15p(sender: AnyObject) {
        seleccionaBoton(14)
    }
    @IBAction func b16p(sender: AnyObject) {
        seleccionaBoton(15)
    }
    @IBAction func reiniciar(sender: AnyObject) {
        inicializaJuego()
    }
    
    func seleccionaBoton(seleccionado: Int){
        muestraMensaje("")
        if(estatusAp == 0){
            estatusAp = 1
            btnAbierto = seleccionado
            estatusBoton(seleccionado, estatus: "abierto")
        }
        else if(estatusAp == 1){
            let btnAnterior = botones[btnAbierto]
            let btnActual = botones[seleccionado]
            if(btnActual.estado != 0){
                return
            }
            if(btnAnterior.opcion == btnActual.opcion){
                //Par correcto
                aciertosContinuos++
                if(aciertosContinuos >= 2 && aciertosContinuos <= 5){
                    muestraMensaje("\(aciertosContinuos) aciertos COMBO +\(aciertosContinuos)")
                    puntos += aciertosContinuos
                    muestraExitos()
                }
                else{
                    puntos++
                    muestraExitos()
                }
                estatusAp = 2
                estatusBoton(seleccionado, estatus: "correcto")
                estatusBoton(btnAbierto, estatus: "correcto")
                btnAbierto = -1
                abiertos++
                muestraExitos()
                if(abiertos >= posibles){
                    estatusAp = 4
                    muestraMensaje("Éxito Perfecto!!!")
                }
            }
            else{
                //Par incorrecto
                aciertosContinuos = 0
                estatusAp = 3
                estatusBoton(seleccionado, estatus: "incorrecto")
                estatusBoton(btnAbierto, estatus: "incorrecto")
                btnIncorrecto = seleccionado
            }
        }
        else if(estatusAp == 2){
            let btnActual = botones[seleccionado]
            if(btnActual.estado != 0 && btnActual.estado != 3){
                return
            }
            estatusAp = 1
            btnAbierto = seleccionado
            estatusBoton(seleccionado, estatus: "abierto")
        }
        else if(estatusAp == 3){
            let btnActual = botones[seleccionado]
            if(btnActual.estado != 0 && btnActual.estado != 3){
                return
            }
            estatusBoton(btnAbierto, estatus: "inicial")
            estatusBoton(btnIncorrecto, estatus: "inicial")
            btnIncorrecto = -1
            estatusAp = 1
            btnAbierto = seleccionado
            estatusBoton(seleccionado, estatus: "abierto")
        }
    }
    
    func estatusBoton(seleccionado: Int, estatus: String){
        print("Estatus \(estatus) para \(seleccionado)")
        //btn estatus: 0 inicial, 1 abierto, 3 incorrecto, 4 correcto
        let btn = botones[seleccionado]
        if(estatus == "inicial"){
            btn.setTitle("", forState: UIControlState.Normal)
            btn.setBackgroundImage(UIImage(named: "Circle_Yellow.png"), forState: UIControlState.Normal)
            btn.estado = 0
        }
        else if(estatus == "abierto"){
            btn.setTitle(String(btn.opcion), forState: UIControlState.Normal)
            btn.setBackgroundImage(UIImage(named: "Circle_Green.png"), forState: UIControlState.Normal)
            btn.estado = 1
        }
        else if(estatus == "correcto"){
            btn.setTitle(String(btn.opcion), forState: UIControlState.Normal)
            btn.setBackgroundImage(UIImage(named: "Circle_Blue.png"), forState: UIControlState.Normal)
            btn.estado = 4
        }
        else if(estatus == "incorrecto"){
            btn.setTitle(String(btn.opcion), forState: UIControlState.Normal)
            btn.setBackgroundImage(UIImage(named: "Circle_Red.png"), forState: UIControlState.Normal)
            btn.estado = 3
        }
    }
    
    override func viewDidLoad() {
//        numeroOpciones=4
        var botonesOcultar: [BtnOpcion] = []
        if(numeroOpciones == 4){
            botones = [bt1, bt2, bt3, bt4]
            botonesOcultar = [bt5, bt6, bt7, bt8, bt9, bt10, bt11, bt12, bt13, bt14, bt15, bt16]
        }
        else if(numeroOpciones == 9){
            botones = [bt1, bt2, bt3, bt4, bt5, bt6, bt7, bt8]
            botonesOcultar = [bt9, bt10, bt11, bt12, bt13, bt14, bt15, bt16]
        }
        else if(numeroOpciones == 16){
            botones = [bt1, bt2, bt3, bt4, bt5, bt6, bt7, bt8, bt9, bt10, bt11, bt12, bt13, bt14, bt15, bt16]
        }
        for i in 0..<botonesOcultar.count {
            botonesOcultar[i].hidden = true
        }
        posibles = botones.count / 2
        inicializaJuego()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    func inicializaJuego(){
        var num = 0, botonActual=0
        var asignados = [0]
        for i in 0..<botones.count{
            botonesPendientes.append(i)
        }
        for i in 0..<posibles{
            var yaEstaba = true
            while(yaEstaba){
                num = Int(CGFloat(Float(arc4random()) / Float(UINT32_MAX)) * 99)
                if !asignados.contains(num) {
                    yaEstaba = false
                }
            }
            asignados.append(num)
            botonActual = Int(CGFloat(Float(arc4random()) / Float(UINT32_MAX)) * CGFloat(botonesPendientes.count))
            botones[botonesPendientes[botonActual]].opcion = num
            print("Asignando \(num) a indice \([botonesPendientes[botonActual]])")
            botonesPendientes.removeAtIndex(botonActual)
            botonActual = Int(CGFloat(Float(arc4random()) / Float(UINT32_MAX)) * CGFloat(botonesPendientes.count))
            botones[botonesPendientes[botonActual]].opcion = num
            print("Asignando \(num) a indice \([botonesPendientes[botonActual]])")
            botonesPendientes.removeAtIndex(botonActual)
        }
//        bt1.opcion = 1
//        bt2.opcion = 1
//        bt3.opcion = 2
//        bt4.opcion = 2
//        bt5.opcion = 3
//        bt6.opcion = 3
//        bt7.opcion = 4
//        bt8.opcion = 4
//        bt9.opcion = 5
//        bt10.opcion = 5
//        bt11.opcion = 6
//        bt12.opcion = 6
//        bt13.opcion = 7
//        bt14.opcion = 7
//        bt15.opcion = 8
//        bt16.opcion = 8
        estatusAp = 0
        puntos = 0
        abiertos = 0
        aciertosContinuos = 0
        btnAbierto = -1
        for i in 0..<botones.count {
            estatusBoton(i, estatus: "inicial")
        }
        muestraExitos()
        muestraMensaje("")
    }
    func muestraExitos(){
        lbExitos.text = String(puntos)
    }
    func muestraMensaje(mensaje: String){
        lbMensaje.text = mensaje
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
