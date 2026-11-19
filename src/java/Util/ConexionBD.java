package Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionBD {

    public static Connection getConexionBD() {
        try {
            String url = System.getenv("DB_URL");

            if (url == null || url.isBlank()) {
                String host = firstEnvironmentValue("DB_HOST", "MYSQLHOST", "localhost");
                String port = firstEnvironmentValue("DB_PORT", "MYSQLPORT", "3306");
                String database = firstEnvironmentValue("DB_NAME", "MYSQLDATABASE", "bdpruebaunfv03");

                boolean local = host.equalsIgnoreCase("localhost") || host.equals("127.0.0.1");

                url = "jdbc:mysql://" + host + ":" + port + "/" + database
                        + "?serverTimezone=UTC&useSSL=" + (!local)
                        + "&allowPublicKeyRetrieval=true";
            }

            String usuario = firstEnvironmentValue("DB_USER", "MYSQLUSER", "root");
            String clave = firstEnvironmentValue("DB_PASSWORD", "MYSQLPASSWORD", "");

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection cn = DriverManager.getConnection(url, usuario, clave);
            System.out.println("Conexión a MySQL establecida correctamente.");
            return cn;

        } catch (ClassNotFoundException e) {
            System.err.println("No se encontró el controlador JDBC de MySQL.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("No se pudo conectar a MySQL. Revisa DB_URL, DB_USER, DB_PASSWORD y el acceso de red.");
            e.printStackTrace();
        } catch (Exception e) {
            System.err.println("Error inesperado al conectar con la base de datos.");
            e.printStackTrace();
        }

        return null;
    }

    private static String firstEnvironmentValue(String primary, String secondary, String fallback) {
        String value = System.getenv(primary);

        if (value == null || value.isBlank()) {
            value = System.getenv(secondary);
        }

        return (value == null || value.isBlank()) ? fallback : value;
    }

    public static void main(String[] args) {
        try (Connection cn = getConexionBD()) {
            if (cn != null) {
                System.out.println("Prueba de conexión exitosa.");
            } else {
                System.err.println("La prueba de conexión falló.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
