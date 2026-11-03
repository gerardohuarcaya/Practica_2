<%-- 
    Document   : FrmUsuario
    Created on : 3 nov. 2026, 4:59:07 p. m.
    Author     : UNFV
--%>

```jsp
```jsp
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FrmUsuario</title>

        <script>
            function Aceptar()
            {
                var usuario = document.form.txtusuario.value;
                var clave = document.form.txtclave.value;

                if(usuario.length == 0)
                {
                    alert("Ingrese el usuario por favor !!!");
                    document.form.txtusuario.focus();
                    return;
                }
                else if(clave.length == 0)
                {
                    alert("Ingrese la clave por favor !!!");
                    document.form.txtclave.focus();
                    return;
                }
                else
                {
                    document.form.action="<%=request.getContextPath()%>/UsuarioControlador";
                    document.form.method="POST";
                    document.form.op.value="4";
                    document.form.submit();
                }
            }

            function Salir()
            {
                window.location.href="<%=request.getContextPath()%>/index.jsp";
            }
        </script>
    </head>

    <body>
    <center>

        <h2>INICIO DE SESION</h2>

        <form name="form">

            <input type="hidden" name="op">

            <table border="10">

                <tr>
                    <td>Usuario:</td>
                    <td>
                        <input type="text" name="txtusuario">
                    </td>
                </tr>

                <tr>
                    <td>Clave:</td>
                    <td>
                        <input type="password" name="txtclave">
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                        <center>
                            <input type="button" value="Aceptar" onclick="Aceptar()">

                            <input type="button" value="Salir" onclick="Salir()">
                        </center>
                    </td>
                </tr>

            </table>

            <%
                if(request.getAttribute("error") != null)
                {
            %>

                <h4 style="color:red;">
                    <%=request.getAttribute("error")%>
                </h4>

            <%
                }
            %>

        </form>

    </center>
    </body>
</html>
```