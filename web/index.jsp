<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio de sesión</title>
    <script>
        function Aceptar() {
            var usuario = document.form.txtusuario.value.trim();
            var clave = document.form.txtclave.value;

            if (usuario.length === 0) {
                alert("Ingrese el usuario por favor.");
                document.form.txtusuario.focus();
                return;
            }

            if (clave.length === 0) {
                alert("Ingrese la clave por favor.");
                document.form.txtclave.focus();
                return;
            }

            document.form.action = "<%=request.getContextPath()%>/UsuarioControlador";
            document.form.method = "POST";
            document.form.op.value = "4";
            document.form.submit();
        }

        function RegistrarPersona() {
            document.form.action = "<%=request.getContextPath()%>/UsuarioControlador";
            document.form.method = "POST";
            document.form.op.value = "1";
            document.form.submit();
        }
    </script>
</head>
<body>
    <main>
        <h2>INICIO DE SESIÓN</h2>

        <form name="form" method="post">
            <input type="hidden" name="op">

            <table border="1">
                <tr>
                    <td><label for="txtusuario">Usuario:</label></td>
                    <td><input type="text" id="txtusuario" name="txtusuario" autocomplete="username"></td>
                </tr>
                <tr>
                    <td><label for="txtclave">Clave:</label></td>
                    <td><input type="password" id="txtclave" name="txtclave" autocomplete="current-password"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="button" value="Aceptar" onclick="Aceptar()">
                        <input type="button" value="Registrar Persona" onclick="RegistrarPersona()">
                    </td>
                </tr>
            </table>

            <% if (request.getAttribute("error") != null) { %>
                <p style="color: red;"><%= request.getAttribute("error") %></p>
            <% } %>
        </form>
    </main>
</body>
</html>
