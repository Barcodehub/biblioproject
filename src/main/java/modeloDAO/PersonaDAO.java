/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modeloDAO;

import Config.Conexion;
import Interfaces.CRUD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import modelo.Persona;
import Interfaces.Validar;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

/**
 *
 * @author BRAYAN
 */
public class PersonaDAO implements Validar, CRUD{

    Connection con;
    Conexion cn=new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    Persona p=new Persona();
    
    
    @Override
    public int validar(Persona per) {
        int r =0;
        String sql ="Select * from persona where Nombres=? and Correo=? and Password=?";
        try{
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.setString(1, per.getNom());
            ps.setString(2, per.getCorreo());
            ps.setString(3, hashPassword(per.getPass()));
            rs=ps.executeQuery();
            
            
        //Aqui lo que hacemos es encriptar por el hash 256, la contraseña ingresada por el usuariopara compararla con la contraseña encriptada de la base de datos
              while (rs.next()) {
    String storedPassword = rs.getString("Password");
    String enteredPassword = per.getPass();

    String hashedEnteredPassword = hashPassword(enteredPassword);

    if (hashedEnteredPassword.equals(storedPassword)) {
        r = r + 1;
        per.setNom(rs.getString("Nombres"));
        per.setCorreo(rs.getString("Correo"));
    }
}            
            if(r==1){
                return 1;
            }else{
                return 0;
            }
    
        }catch(Exception e){
            return 0;
        }
        
    }
   
    
    
    //Hashea la contraseña ingresada por el usuario para despues compararla con la contraseña hasheada del mysql
    public static String hashPassword(String password) {
        try {
            final MessageDigest digest = MessageDigest.getInstance("SHA-256");
            final byte[] hash = digest.digest(password.getBytes(StandardCharsets.UTF_8));
            final StringBuilder hexString = new StringBuilder();
            for (int i = 0; i < hash.length; i++) {
                final String hex = Integer.toHexString(0xff & hash[i]);
                if (hex.length() == 1)
                    hexString.append('0');
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException ex) {
            throw new RuntimeException(ex);
        }
    }

    
    
    
    
    
    


@Override
    public List listar() {
        ArrayList<Persona>list=new ArrayList<>();
        String sql="select * from persona";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Persona per=new Persona();
                per.setId(rs.getInt("Id"));
                per.setNom(rs.getString("Nombres"));
                per.setCorreo(rs.getString("Correo"));
               list.add(per);
            }
        } catch (Exception e) {
        }
        return list;
    }

    @Override
    public Persona list(int id) {
        String sql="select * from persona where Id="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){                
                p.setId(rs.getInt("Id"));
                p.setNom(rs.getString("Nombres"));
                p.setCorreo(rs.getString("Correo"));
                
            }
        } catch (Exception e) {
        }
        return p;
    }

    @Override
    public boolean add(Persona per) {
         boolean rta=false;
       String sql="INSERT INTO persona(Nombres, Correo, Password) "+ " VALUES (?,?,?,?,?)";
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
       
        ps.setInt(1, p.getId());
        ps.setString(2, p.getNom());
        ps.setString(4, p.getCorreo());
        ps.setString(5, p.getPass());
            
            
        ps.execute();
        rta=true;
                
        // 5. Cerrar recursos y conexion        
        ps.close();
        con.close();
                
        ps=null;
        con=null;
        return rta;
        
        
            //ps.executeUpdate();
        } catch (Exception e) {
        }
       return false;
    }

    @Override
    public boolean edit(Persona per) {
        String sql="update persona set Nombres='"+per.getNom()+"',Correo='"+per.getCorreo()+"'where Id="+per.getId();
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
        String sql="delete from persona where Id="+id;
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

}
