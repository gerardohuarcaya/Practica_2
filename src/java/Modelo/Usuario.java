
package Modelo;
import java.sql.*;
import  Util.ConexionBD;
import java.util.ArrayList;

public class Usuario 
{  public  int idusu ;
   public  String  usu;
   public  String cla;
    Connection   cn=null;
    PreparedStatement  pt=null;
    ResultSet          rs=null;    
    ArrayList<Usuario> lista  ;
    public ArrayList<Usuario>  ListarUsuario()
    {
        try {
            cn=ConexionBD.getConexionBD();
            pt=cn.prepareStatement("Select *   from   usuario ");
            rs=pt.executeQuery();
            lista=new ArrayList<Usuario>();
            while(rs.next())
            {
                Usuario objusu=new Usuario();
                        objusu.idusu=rs.getInt(1);
                        objusu.usu=rs.getString(2);
                        objusu.cla=rs.getString(3);
                 lista.add(objusu);
            } 
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
      return lista;
    }
    
   public boolean Insertar(int id, String usu, String cla)
   {   boolean  estado=false;
       try {
           cn=ConexionBD.getConexionBD();// me estoy conectando a la BD
           pt=cn.prepareStatement("insert into usuario values(?,?,?);");
           pt.setInt(1,id);
           pt.setString(2, usu);
           pt.setString(3, cla);
           pt.execute();
           pt.close();
           
       } catch (Exception e) {
       }     
       return estado;
   }
    
   public int eliminar(int id)
   {   int  estado=0;
       try {
           cn=ConexionBD.getConexionBD();// me estoy conectando a la BD
           pt=cn.prepareStatement("delete from usuario where  ID_USU=? ");
           pt.setInt(1,id);
           estado= pt.executeUpdate();
           pt.close();
           
       } catch (Exception e) {
       }     
       return estado;
   }
      
   
   
   
   
   
    
    
}
