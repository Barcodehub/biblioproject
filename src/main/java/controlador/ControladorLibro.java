/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import modelo.Libro;
import modelo.Persona;
import modelo.Reserva;
import modeloDAO.LibroDAO;
import modeloDAO.PersonaDAO;
import modeloDAO.ReservaDao;

/**
 *
 * @author BRAYAN
 */
public class ControladorLibro extends HttpServlet {

    LibroDAO dao=new LibroDAO();
    Libro l=new Libro();
    int r;
    
    String listar="Principal.jsp";
    String add="vistas/addlibro.jsp";
    String edit="vistas/editLibro.jsp";
    String reservar="vistas/reservar.jsp";
    int id;
    int id2;
    
    PersonaDAO dao2=new PersonaDAO();
    Persona p = new Persona();
    
    ReservaDao dao3=new ReservaDao();
    Reserva res = new Reserva();
    int contid=0;
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorLibro</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorLibro at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    
    
    
  
     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso="";
        String action=request.getParameter("accion");
        if(action.equalsIgnoreCase("listar")){
            acceso=listar;            
        }else if(action.equalsIgnoreCase("add")){
            acceso=add;
        }
        else if(action.equalsIgnoreCase("Agregar")){
            String titulo=request.getParameter("txttitulo");
            String autor=request.getParameter("txtautor");
            String codigo=request.getParameter("txtcodigo");
            String fechaStr = request.getParameter("txtfecha"); // Supongamos que el parámetro se llama "txtfecha"
            
            
            
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    Date fecha = null;
    try {
         java.util.Date utilDate = dateFormat.parse(fechaStr);
//    fecha = new Date(utilDate.getTime());
// fecha = (Date) dateFormat.parse(fechaStr);
fecha = new Date(dateFormat.parse(fechaStr).getTime());
    } catch (ParseException e) {
        System.out.println("errorrrororororor");
    }
        
            int copias=Integer.parseInt(request.getParameter("txtcopias"));
            
            
            
              LibroDAO dao = new LibroDAO();
                    List<Libro> list = dao.listar();
                    Iterator<Libro> iter = list.iterator();
                    Libro lib = null;

                    while (iter.hasNext()) {
                        lib = iter.next();
                        
                        if (codigo.equals(lib.getCodigo())) {
//                            
                            System.out.println("ERROR, ESE CODIGO DE LIBRO YA ESTÁ SIENDO USADO POR OTRO");
                            //----------------------
                        }
                    }
            
            
            
            
            l.setTitulo(titulo);
            l.setAutor(autor);
            l.setCodigo(codigo);
            l.setFecha(fecha);
            l.setCopias(copias);
            dao.add(l);
            acceso=listar;
        }
        else if(action.equalsIgnoreCase("editar")){
            request.setAttribute("idlib",request.getParameter("id"));
            acceso=edit;
        }
        else if(action.equalsIgnoreCase("Actualizar")){
            id=Integer.parseInt(request.getParameter("txtid"));
            String titulo=request.getParameter("txttitulo");
            String autor=request.getParameter("txtautor");
            String codigo=request.getParameter("txtcodigo");
            
            
            
           String fechaStr = request.getParameter("txtfecha"); // Supongamos que el parámetro se llama "txtfecha"

            
            
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    Date fecha = null;
    try {
         java.util.Date utilDate = dateFormat.parse(fechaStr);
//    fecha = new Date(utilDate.getTime());
// fecha = (Date) dateFormat.parse(fechaStr);
fecha = new Date(dateFormat.parse(fechaStr).getTime());
    } catch (ParseException e) {
        System.out.println("errorrrororororor");
    }
           
            
             int copias=Integer.parseInt(request.getParameter("txtcopias"));
            int prestados=Integer.parseInt(request.getParameter("txtprestados"));
            
            
            
            
            
            if(prestados <= copias){
                l.setId(id);
            l.setTitulo(titulo);
            l.setAutor(autor);
            l.setCodigo(codigo);
            l.setFecha(fecha);
            l.setCopias(copias);
            l.setPrestados(prestados);
            dao.edit(l);
            acceso=listar;
            }else{
                //PRESTADOS NO PUEDE SER MAYOR AL NUMERO DE COPIAS DISPONIBLES
                request.getRequestDispatcher("index.jsp").forward(request, response);
       
            }
            
            
            
            
        }
        else if(action.equalsIgnoreCase("eliminar")){
            id=Integer.parseInt(request.getParameter("id"));
            l.setId(id);
            dao.eliminar(id);
            acceso=listar;
            
            
        
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
        }else if(action.equalsIgnoreCase("reservar")){
            request.setAttribute("idlib",request.getParameter("id"));
//            request.setAttribute("idper",request.getParameter("id2"));
            
           acceso=reservar;
            
            
            
            
            
        }else if(action.equalsIgnoreCase("reservar1")){
            
            System.out.println("entro");
            id=Integer.parseInt(request.getParameter("txtid"));
//            id2=Integer.parseInt(request.getParameter("txtid2"));
            
             String nom = request.getParameter("txtnom");
            String correo = request.getParameter("txtCorreo");
            String pass = request.getParameter("txtPass");
            
            System.out.println("nom: "+nom);
                
            
            p.setNom(nom);
            p.setCorreo(correo);
            p.setPass(pass);
            r = dao2.validar(p);
            if (r == 1) {
                request.getSession().setAttribute("nom", nom);
                request.getSession().setAttribute("correo", correo);
                request.getSession().setAttribute("pass", pass);
//                request.getRequestDispatcher("Principal.jsp").forward(request, response); //me entra si valida, CRUCIAL PARA EL ROL ADMIN Y UDUARIO LUEGO

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
                        System.out.println("id persona es: "+contid);



            } else {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }

        

id2=contid;





            
            String fechaStr = request.getParameter("txtfecha"); // Supongamos que el parámetro se llama "txtfecha"
            
            
            
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    Date fecha = null;
    try {
         java.util.Date utilDate = dateFormat.parse(fechaStr);
//    fecha = new Date(utilDate.getTime());
// fecha = (Date) dateFormat.parse(fechaStr);
fecha = new Date(dateFormat.parse(fechaStr).getTime());
    } catch (ParseException e) {
        System.out.println("errorrrororororor");
    }
        
          
            
            
            
            res.setUsuarioId(id2);
            res.setLibroId(id);
            res.setFechaLimite(fecha);
            res.setEstado("Pendiente");
            
            dao3.agregarReserva(res);
            acceso=listar;
            
            
        }
        RequestDispatcher vista=request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}