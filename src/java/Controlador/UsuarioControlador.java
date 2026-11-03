package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import Modelo.Persona;
import java.util.ArrayList;

public class UsuarioControlador extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {        
       String  opcad=request.getParameter("op");
       int     op=Integer.parseInt(opcad);       
        switch (op) {
            case 1:{                
                Persona    objeto=new Persona();                    
                ArrayList<Persona> lista= objeto.ListarPersona();        
                request.setAttribute("lista", lista);        
                getServletContext().getRequestDispatcher("/Vista/FrmRegistrarUsuario.jsp").forward(request, response);
        
                break;}
            case 2:{       
                    String  cod= request.getParameter("txtcodigo");
                    String  nombre= request.getParameter("txtnombre");
                    String  apellido=request.getParameter("txtapellido");
                    
                    String  sexo=request.getParameter("cbosexo");
                    String  estado=request.getParameter("cboestado");
                    
                    int codigo=Integer.parseInt(cod);  
                    int idsexo=Integer.parseInt(sexo);
                    int idestado=Integer.parseInt(estado);                                
                                            
                    Persona    objeto=new Persona();
                    objeto.Insertar(codigo, nombre, apellido , idsexo, idestado);  
                    
                    ArrayList<Persona> lista= objeto.ListarPersona();        
                    request.setAttribute("lista", lista);        
                    getServletContext().getRequestDispatcher("/Vista/FrmRegistrarUsuario.jsp").forward(request, response);
                 break;}
            
            case 3:
            {
                String  codigocad=request.getParameter("txtcodigo1");                
                               
                int     codigo=Integer.parseInt(codigocad);       
                Persona    objeto=new Persona();  
                           objeto.eliminar(codigo);
                
                ArrayList<Persona> lista= objeto.ListarPersona();        
                request.setAttribute("lista", lista);        
                getServletContext().getRequestDispatcher("/Vista/FrmRegistrarUsuario.jsp").forward(request, response);
        
                
            }
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
