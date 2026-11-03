<%@page import="Modelo.Usuario" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function  Entrar()
            {  document.form.action="<%=request.getContextPath()%>/UsuarioControlador";
               document.form.method="POST";
               document.form.op.value="1";
               document.form.submit();
            }
        </script> 
    </head>
    <body>   
    <center>        
        <h1>Pantalla Principal del Sistema</h1>   
        <form name="form">
          <input  type="hidden" name="op">
          <table border="10">
            <tr>
                <td>
                    <center>
                        <button   onclick="Entrar()"  > Registrar Usuario </button>
                    </center>
                </td>
                
            </tr>
          </table>
            
        </form>      
    </center>  
        
        
        
        
        
    </body>
</html>
