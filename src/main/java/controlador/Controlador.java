package controlador;

import Config.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Persona;
import modeloDAO.PersonaDAO;

//validar el login

public class Controlador extends HttpServlet {

    PersonaDAO dao = new PersonaDAO();
    Persona p = new Persona();
    int r;
    String editPass = "editPass.jsp";
    String pass, pass2 = "";
    int codigoauth = 0;
    int contid = 0;

    public static void main(String[] args) {
        
    }
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");
        if (accion.equals("Ingresar")) {
            String nom = request.getParameter("txtnom");
            String correo = request.getParameter("txtCorreo");
            String pass = request.getParameter("txtPass");
            p.setNom(nom);
            p.setCorreo(correo);
            p.setPass(pass);
            r = dao.validar(p);
            if (r == 1) {
                request.getSession().setAttribute("nom", nom);
                request.getSession().setAttribute("correo", correo);
                request.getSession().setAttribute("pass", pass);
                request.getRequestDispatcher("Principal.jsp").forward(request, response); //me entra si valida, CRUCIAL PARA EL ROL ADMIN Y UDUARIO LUEGO
            } else {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }

            
            
            
            
        } else if (accion.equals("ValidarCorreo")) {
            //si el correo existe en la BD
            String correo = request.getParameter("txtCorreo");
            p.setCorreo(correo);
            r = dao.validarCorreo(p);
            if (r == 1) {
//                request.getSession().setAttribute("correo", correo);

                pass = request.getParameter("txtPass1");
                pass2 = request.getParameter("txtPass2");
                System.out.println("PASS: " + pass2);

                if (pass.equals(pass2)) { //si ambas passwords son iguales

                    codigoauth = (int) (Math.random() * (99999)) + 1; //codigo de autentificacion aleatorio
                    
                    System.out.println("el numero es: " + codigoauth);

                 
       
                    //CODIGO PARA ENVIAR CODIGODEAUTENTIFICACION AL CORREO AQUI
                   
                    
                    
                    
                    
                    //para extraer el id del correo del usuario
                    PersonaDAO dao = new PersonaDAO();
                    List<Persona> list = dao.listar();
                    Iterator<Persona> iter = list.iterator();
                    Persona per = null;

                    while (iter.hasNext()) {
                        per = iter.next();
                        
                        if (correo.equals(per.getCorreo())) {
//                            System.out.println("id es: " + contid);
                            contid++;
                        }
                    }

                    System.out.println("getcorreo: " + p.getCorreo());
                    System.out.println("el id de " + correo + " es: " + contid);

                    //llevamos para que el usuario ingrese el codigo de autentificacion
                    request.getRequestDispatcher("editPass.jsp").forward(request, response);

                }

//               
            }

        } else if (accion.equals("ValidarCodigo")) {

            //codigo validado ahora actualizece la contraseña
            int codigo = Integer.parseInt(request.getParameter("txtcod"));

            System.out.println("codigo: " + codigo);

            if (codigoauth == codigo) {
                p.setId(contid);
                p.setPass(pass);
                dao.editPass(p);

            }

        } else {
            //Correo ingresado incorrecto---vueleve a intenetarlo
            request.getRequestDispatcher("validarCorreo.jsp").forward(request, response);

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
