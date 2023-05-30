/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDAO;

import Config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Reserva;

/**
 *
 * @author USUARIO
 */
public class ReservaDao {

    Connection cnx = new Conexion().getConnection();

    public boolean agregarReserva(Reserva rv) {
        try {
            String sql = "INSERT INTO reserva VALUES(?,?,?,?)";
            PreparedStatement ps = cnx.prepareStatement(sql);
            ps.setInt(1, rv.getLibroId());
            ps.setInt(2, rv.getUsuarioId());
            ps.setDate(3, rv.getFechaLimite());
            ps.setString(4, rv.getEstado());
            ps.executeUpdate();
            sql = "UPDATE libro SET prestados=prestados+1 WHERE id=" + rv.getLibroId();
            ps = cnx.prepareStatement(sql);
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

        return false;
    }

    public boolean cancelarReserva(Reserva rv) {
        try {
            String sql = "UPDATE reserva SET estado='Cancelado' WHERE id_persona=? AND id_libro=?";
            PreparedStatement ps = cnx.prepareStatement(sql);
            ps.setInt(1, rv.getUsuarioId());
            ps.setInt(2, rv.getLibroId());
            int count = ps.executeUpdate();
            sql = "UPDATE libro SET prestados=prestados-1 WHERE id=" + rv.getLibroId();
            ps = cnx.prepareStatement(sql);
            ps.executeUpdate();
            if (count > 0) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return false;
    }

    public ArrayList<Reserva> listarReserva(String correo) {
        try {
            int usuarioID = idUsuario(correo);
            String sql = "SELECT * FROM reserva WHERE id_persona= " + usuarioID + " AND estado='Pendiente'";
            PreparedStatement ps = cnx.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<Reserva> rvList = new ArrayList<>();
            while (rs.next()) {
                Reserva rv = new Reserva();
                rv.setLibroId(rs.getInt(1));
                rv.setUsuarioId(rs.getInt(2));
                rv.setFechaLimite(rs.getDate(3));
                rv.setEstado(rs.getString(4));
                rvList.add(rv);
            }
            return rvList;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return null;
    }

    public int idUsuario(String correo) {
        try {
            String sql = "SELECT Id FROM persona WHERE correo='" + correo + "'";
            PreparedStatement ps = cnx.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            rs.next();
            int usuarioID = rs.getInt("Id");
            return usuarioID;
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return 0;
    }

    public boolean LibroDisponible(Reserva rv) {
        try {
            String sql = "SELECT * FROM reserva WHERE id_libro=? AND id_persona=? AND estado='Pendiente'";
            PreparedStatement ps = cnx.prepareStatement(sql);
            ps.setInt(1, rv.getLibroId());
            ps.setInt(2, rv.getUsuarioId());
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                return false;
            }
            sql = "SELECT copias,prestados FROM libro WHERE id=" + rv.getLibroId();
            ps = cnx.prepareStatement(sql);
            rs = ps.executeQuery();
            rs.next();
            if (rs.getInt("copias") > rs.getInt("prestados")) {
                return true;
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return false;
    }
}
