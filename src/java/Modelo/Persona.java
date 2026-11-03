
package Modelo;
import java.sql.*;
import  Util.ConexionBD;
import java.util.ArrayList;

public class Persona 
{  public  int idper ;
   public  String  nombre;
   public  String apellido;
   public  String sexo;
   public  String estado;
   
    Connection   cn=null;
    PreparedStatement  pt=null;
    ResultSet          rs=null;    
    ArrayList<Persona> lista  ;
    public ArrayList<Persona>  ListarPersona()
    {
        try {
            cn=ConexionBD.getConexionBD();
            pt=cn.prepareStatement("Select A.idpersona,A.nombpersona,A.apellipersona ,B.nombsexo ,C.nombestado "+
                                   " from   persona  A, sexo  B , estadocivil C where "+
                                   " A.idsexo = B.idsexo   and    A.idestado=C.idestado ");
            rs=pt.executeQuery();
            lista=new ArrayList<Persona>();
            while(rs.next())
            {
                Persona objper=new Persona();
                        objper.idper=rs.getInt("idpersona");
                        objper.nombre=rs.getString("nombpersona");
                        objper.apellido=rs.getString("apellipersona");
                        objper.sexo=rs.getString("nombsexo");
                        objper.estado=rs.getString("nombestado");
                 lista.add(objper);
            } 
            pt.close();
            rs.close();
            cn.close();
        } catch (Exception e) {
        }
      return lista;
    }    
   public boolean Insertar(int id, String nombre, String apellido , int sexo , int estadocivil)
   {   boolean  estado=false;
       try {
           cn=ConexionBD.getConexionBD();// me estoy conectando a la BD
           pt=cn.prepareStatement("insert into persona values(?,?,? , ? , ?);");
           pt.setInt(1,id);
           pt.setString(2, nombre);
           pt.setString(3, apellido);
           pt.setInt(4,sexo);
           pt.setInt(5,estadocivil);           
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
           pt=cn.prepareStatement("DELETE FROM persona WHERE `persona`.`idpersona` = ? ");
           pt.setInt(1,id);
           estado= pt.executeUpdate();
           pt.close();
           
       } catch (Exception e) {
       }     
       return estado;
   }
      
   
   
   
   
   
    
    
}
