/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modeloDAO;

import Config.Conexion;
import Interfaces.CRUDLIBRO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import modelo.Libro;

/**
 *
 * @author BRAYAN
 */
public class LibroDAO implements  CRUDLIBRO{
    
    
    Connection con;
    Conexion cn=new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    Libro p=new Libro();
    
    
@Override
    public List listar() {
        ArrayList<Libro>list=new ArrayList<>();
        String sql="select * from libro";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Libro lib=new Libro();
                lib.setId(rs.getInt("Id"));
                lib.setTitulo(rs.getString("Titulo"));
                lib.setAutor(rs.getString("Autor"));
                lib.setCodigo(rs.getString("Codigo"));
               list.add(lib);
            }
        } catch (Exception e) {
        }
        return list;
    }

    @Override
    public Libro list(int id) {
        String sql="select * from libro where Id="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){                
                p.setId(rs.getInt("Id"));
                p.setTitulo(rs.getString("Titulo"));
                p.setAutor(rs.getString("Autor"));
                p.setCodigo(rs.getString("Codigo")); 
                
            }
        } catch (Exception e) {
        }
        return p;
    }

    @Override
    public boolean add(Libro lib) {
       String sql="INSERT INTO libro(Titulo, Autor, Codigo, Fecha) VALUES (?, ?, ?, ?)";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
       return false;
    }

    @Override
    public boolean edit(Libro lib) {
        String sql="update libro set Titulo='"+lib.getTitulo()+"',Autor='"+lib.getAutor()+"',Codigo='"+lib.getCodigo()+"',Fecha='"+lib.getFecha()+"'where Id="+lib.getId();
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean eliminar(int id) {
        String sql="delete from libro where Id="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

}


