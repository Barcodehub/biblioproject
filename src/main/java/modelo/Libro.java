/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.sql.Date;
import javax.swing.JOptionPane;

/**
 *
 * @author BRAYAN
 */
public class Libro {
    
    int id;
    String titulo;
    String autor;
    String codigo;
    Date fecha;
    int copias;
    int prestados;
    int disponibles = 0;
    
    public Libro() {
    }

    public Libro(int id, String titulo, String autor, String codigo, Date fecha) {
        this.id = id;
        this.titulo = titulo;
        this.autor = autor;
        this.codigo = codigo;
        this.fecha = fecha;
    }

    public Libro(int id, String titulo, String autor, String codigo, Date fecha, int copias, int prestados) {
        this.id = id;
        this.titulo = titulo;
        this.autor = autor;
        this.codigo = codigo;
        this.fecha = fecha;
        this.copias = copias;
        this.prestados = prestados;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public int getCopias() {
        return copias;
    }

    public void setCopias(int copias) {
        this.copias = copias;
    }

    public int getPrestados() {
        return prestados;
    }

    public void setPrestados(int prestados) {
        this.prestados = prestados;
    }

    public int disponiblebook(int copias, int prestados){
//        this.copias = copias;
//        this.prestados = prestados;


    disponibles = copias - prestados;

        return disponibles;
        
    }
    
    
    
    
}