/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interfaces;

import java.util.List;
import modelo.Libro;

/**
 *
 * @author BRAYAN
 */
public interface CRUDLIBRO {
    
    public List listar();
    public Libro list(int id);
    public boolean add(Libro lib);
    public boolean edit(Libro lib);
    public boolean eliminar(int id);
}


