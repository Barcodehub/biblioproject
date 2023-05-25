
package Config;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author BRAYAN
 */
public class Conexion {
    Connection con;
    public Connection getConnection(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/registro", "root", "");
        }catch (Exception e){  
        }
        return con;
    }
    
}
