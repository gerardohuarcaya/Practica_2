<%-- 
    Document   : FrmRegistrarUsuario
    Created on : 20 oct. 2026, 4:15:39 p. m.
    Author     : UNFV
--%>
<%@page import="java.util.ArrayList" %>
<%@page import="Modelo.Persona" %>

<%!
  ArrayList<Persona>   lista =null;  
  Persona              objPersona=null;
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
      <script>
            function  Grabar()
            { 
               var codigo=document.form.txtcodigo.value;
               var nombre=document.form.txtnombre.value;
               var apellido=document.form.txtapellido.value;               
               var sexo = document.form.cbosexo.value;
               var estado=document.form.cboestado.value;
               if(codigo.length==0){
                   alert("Ingrese el codigo por favor !!!");
                   document.form.txtcodigo.focus();
                   return;
               } else if(nombre.length==0){
                   alert("Ingrese el nombre por favor !!!");
                   document.form.txtnombre.focus();
                   return; 
               }else if(apellido.length==0){
                   alert("Ingrese el apellido por favor !!!");
                   document.form.txtapellido.focus();
                   return; 
               } else if(parseInt(sexo)==0){
                   alert("Ingrese el sexo por favor !!!");
                   document.form.cbosexo.focus();
                   return; 
               }  else if(parseInt(estado)==0){
                   alert("Ingrese el estado por favor !!!");
                   document.form.cboestado.focus();
                   return; 
               } 
               else
               {
        
               document.form.action="<%=request.getContextPath()%>/UsuarioControlador";
               document.form.method="POST";
               document.form.op.value="2";
               document.form.submit(); 
           }               
           }
            
            function Eliminar(codigo)
            {
               document.form.action="<%=request.getContextPath()%>/UsuarioControlador";
               document.form.method="POST";
               document.form.op.value="3";
               document.form.txtcodigo1.value=codigo;
               alert(codigo);
               document.form.submit();  
                
            }
            
            function  modificar(codigo , nombre , apellido  , sexo , estado)
            {
               document.form.action="<%=request.getContextPath()%>/UsuarioControlador";
               document.form.method="POST";
               document.form.op.value="4";
               document.form.txtcodigo1.value=codigo;
               document.form.nombre.value=nombre;
               document.form.apellido.value=apellido;
               document.form.sexo.value=sexo;
               document.form.estado.value=estado;
               alert(codigo);
               document.form.submit();  
                
                
            }
            
        </script>  
    </head>
    <body>
    <center>
        <form name="form">
            <input type="hidden" name="op">
            
             <input type="hidden" name="txtcodigo1">
             <input type="hidden" name="nombre">
             <input type="hidden" name="apellido">
             <input type="hidden" name="sexo">
             <input type="hidden" name="estado">
         
            <table border="10">
                <tr>
                    <td>Codigo: </td>
                    <td><input type="text" name="txtcodigo"></td>
                </tr>
                <tr>
                    <td>Nombre: </td>
                    <td><input type="text" name="txtnombre"></td>
                </tr>
                <tr>
                    <td>Apellido: </td>
                    <td><input type="text" name="txtapellido"></td>
                </tr>
                <tr>
                    <td>Sexo: </td>
                    <td>
                        <select name="cbosexo">
                            <option value="0">-----------</option>
                            <option value="1">MASCULINO</option>
                            <option value="2">FEMENINO</option>
                        </select>                        
                    </td>
                </tr>
                
                <tr>
                    <td>Estado Civil: </td>
                    <td>
                       <select name="cboestado">
                            <option value="0">-----------</option>
                            <option value="1">CASADO     </option>
                            <option value="2">SOLTERO    </option>
                            <option value="3"> VIUDO     </option>
                            <option value="4">DIVORCIADO </option>
                        </select>  
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                       <center>
                           <input type="button" value="Grabar"  onclick="Grabar()" >
                       </center>
                    </td>                        
                </tr>                
            </table>  
            
            <% 
               if(request.getAttribute("lista")!=null){  
                lista=(ArrayList)request.getAttribute("lista");                                   
            %>             
            <table border="10" >  
                
                  <tr>
                    <td   >Codigo</td>
                    <td>   Nombre</td>
                    <td>   Apellido</td>
                    <td>   Sexo    </td>
                    <td>   Estado Civil </td>
                    <td>   Eliminar</td>
                    <td>   Modificar</td>
                </tr>   
                
                <%   for (Persona  objPersona1:lista){    %>
              
                
                <tr>
                     <td  ><%=objPersona1.idper%></td>
                     <td  ><%=objPersona1.nombre%></td>
                     <td  ><%=objPersona1.apellido%></td>
                      <td  ><%=objPersona1.sexo%></td>
                       <td  ><%=objPersona1.estado%></td>
                     <td>  <input type="button" value="Eliminar"  onclick="Eliminar('<%=objPersona1.idper%>')">    </td>
                     <td>  <input type="button" value="Modificar"  onclick="">    </td>
                </tr>    
                <%    }   %> 
            </table>
            
            <%    }  %>
        </form>
    </center>
    </body>
</html>
