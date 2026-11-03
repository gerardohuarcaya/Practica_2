<%@page import="Modelo.Usuario" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function  Entrar()
            {
                document.form.action = "<%=request.getContextPath()%>/UsuarioControlador";
                document.form.method = "POST";
                document.form.op.value = "1";
                document.form.submit();
            }
            function Aceptar()
            {
                var usuario = document.form.txtusuario.value;
                var clave = document.form.txtclave.value;

                if (usuario.length == 0)
                {
                    alert("Ingrese el usuario por favor !!!");
                    document.form.txtusuario.focus();
                    return;
                } else if (clave.length == 0)
                {
                    alert("Ingrese la clave por favor !!!");
                    document.form.txtclave.focus();
                    return;
                } else
                {
                    document.form.action = "<%=request.getContextPath()%>/UsuarioControlador";
                    document.form.method = "POST";
                    document.form.op.value = "4";
                    document.form.submit();
                }
            }

            function RegistrarPersona()
            {
                window.location.href = "<%=request.getContextPath()%>/Vista/FrmRegistrarUsuario.jsp";
            }

            function Salir()
            {
                window.location.href = "<%=request.getContextPath()%>/index.jsp";
            }
        </script> 
    </head>


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
                <input type="button" value="Registrar Persona" onclick="RegistrarPersona()">
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
</center>  





</body>
</html>
