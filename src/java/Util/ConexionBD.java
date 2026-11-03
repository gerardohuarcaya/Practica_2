package Util;
 import java.sql.*;
public class ConexionBD 
{
    public static Connection getConexionBD()
    { Connection   cn=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bdpruebaunfv03","root","");
            System.out.println("Se conecto !!!!");
        } catch (Exception e) {
            System.out.println("NOO Se conecto !!!!"+e.getMessage());
        } 
       return cn;
    }    
    public static void main(String[] args) 
    {      
        getConexionBD();
    }
    
}
