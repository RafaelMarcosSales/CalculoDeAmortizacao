<%-- 
    Document   : amortizacaoConstante
    Created on : 07/09/2018, 13:43:33
    Author     : LEOES
--%>

<%@page import="java.text.NumberFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="libs/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link rel="stylesheet" href="css/main.css">
        <title>Amortização Constante</title>
    </head>
    <body>
        
        <%@include file="/WEB-INF/jspf/header.jspf"%>
        <%@include file="/WEB-INF/jspf/menu.jspf"%>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb"></ol>
        <h1>Amortização Constante</h1>
        <div id="formulario">
        <form>
            <br>
            <br>
            <h2>Digite os dados solicitados nos Campos</h2>
            
            <br>
            
            <input type="text" name="vlEmprestimo" placeholder="Valor do Empréstimo "/>
            <br>
            <input type="text" name="vlJuros" placeholder="Taxa de Juros Mensal "/>
            <br>
            <input type="text" name="qtMeses" placeholder="Quantidade de meses "/>
            <br>
            <br>
            <input type="submit" value="Calcular"/>
            <br>
            <br>
        </form>
            </div>
        
        
        <%
            String vlEmprestimo = request.getParameter("vlEmprestimo");
            String vlJuros = request.getParameter("vlJuros");
            String qtMeses = request.getParameter("qtMeses");
            
            if((vlEmprestimo!="" && vlEmprestimo!=null)||(vlJuros!="" && vlJuros!=null)||(qtMeses!="" && qtMeses!=null)){
                try{
                    float emprestimo = Float.parseFloat(vlEmprestimo);
                    float taxaJuros = Float.parseFloat(vlJuros);
                    int meses = Integer.parseInt(qtMeses);
                    float amortizacaoConst = emprestimo / meses;
                    float prestacao;
                    float saldoDevedor = emprestimo;
                    float juros;
        %>
                    <div>
                        <%try{%>
        <%int n= Integer.parseInt(request.getParameter("n"));%>
        <table border="1">
            <tr><th>Índice</th><th>Número</th></tr>
            <%for(int i=1; i<=n; i++){%>
            <tr>
                <th><%= i %></th>
                <td><%= (int)(Math.random()*1000) %></td>
            </tr>
            <%}%>
        </table>
        <%}catch(Exception ex){%>
        
        <%}%>
                    <table id="res" border="1">
                        <tr>
                            <th>Período </th>
                            <th> Prestação </th>
                            <th> Juros </th>
                            <th> Amortização </th>
                            <th> Saldo Devedor </th>
                        </tr>
                        <tr>
                            <th>0</th>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>
                                <%= NumberFormat.getCurrencyInstance().format(saldoDevedor) %>
                            </td>
                        </tr>
                        <tr>
                            <%
                                for(int i=1; i<=meses; i++) {
                                    juros=(meses-i+1)*(taxaJuros/100)*amortizacaoConst;
                                    prestacao = amortizacaoConst + juros;
                                    saldoDevedor = saldoDevedor - amortizacaoConst;
                            %>
                            <th><%= i %></th>
                            <td><%= NumberFormat.getCurrencyInstance().format(prestacao) %></td>
                            <td><%= NumberFormat.getCurrencyInstance().format(juros) %></td>
                            <td><%= NumberFormat.getCurrencyInstance().format(amortizacaoConst) %></td>
                            <td><%= NumberFormat.getCurrencyInstance().format(saldoDevedor) %></td>
                        </tr>
                            <%}%>
                    </table>
                <%}catch(Exception e){}}%>               
    
    </div>
                
    </body>
</html>