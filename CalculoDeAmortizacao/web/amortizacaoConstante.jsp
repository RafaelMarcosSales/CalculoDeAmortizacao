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
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="home.jsp">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Amortização Constante</li>
            </ol>
        </nav>

        <main>
            <div class="container-fluid">
                <div class="row">
                    <div class="card offset-md-2 col-md-8 offset-lg-3 col-lg-6 offset-xl-3 col-xl-6">
                        <div class="card-body">
                            <form>
                                <div class="form-row">
                                    <h4 class="card-title col-12 mb-2">Amortização Constante</h4>
                                    <p class="lead col-12">Preencha os campos</p>
                                    <div class="form-group col-12">
                                        <label for="vlEmprestimo">Valor do emprestimo</label>
                                        <input type="text" class="form-control" name="vlEmprestimo" id="vlEmprestimo" placeholder="Ex: 50000 " required/>
                                    </div>
                                    <div class="form-group col-12">
                                        <label for="vlJuros">Taxa de Juros</label>
                                        <input type="text" class="form-control" name="vlJuros" id="vlJuros" placeholder="% de juros" required/>
                                    </div>
                                    <div class="form-group col-12">
                                        <label for="qtMeses">Quantidade de meses</label>
                                        <input type="text" min="1" class="form-control" name="qtMeses" id="qtMeses" placeholder="Número de meses" required/>
                                    </div>
                                </div>
                                <input type="submit" class="btn btn-primary" value="Calcular" data-toggle="modal" data-target="#modalAmortizacaoConstante"/>
                            </form>
                            <%
                                String vlEmprestimo = request.getParameter("vlEmprestimo");
                                String vlJuros = request.getParameter("vlJuros");
                                String qtMeses = request.getParameter("qtMeses");

                                if ((vlEmprestimo != "" && vlEmprestimo != null) || (vlJuros != "" && vlJuros != null) || (qtMeses != "" && qtMeses != null)) {
                                    try {
                                        float emprestimo = Float.parseFloat(vlEmprestimo);
                                        float taxaJuros = Float.parseFloat(vlJuros);
                                        int meses = Integer.parseInt(qtMeses);
                                        float amortizacaoConst = emprestimo / meses;
                                        float prestacao;
                                        float saldoDevedor = emprestimo;
                                        float juros;
                            %>
                                        <%try {%>
                                            <%int n = Integer.parseInt(request.getParameter("n"));%>
                                            <hr class="my-4"/>
                                            <table class="table table-sm table-hover">
                                                <thead>
                                                    <tr><th>Índice</th><th>Número</th></tr>
                                                </thead>
                                                <%for (int i = 1; i <= n; i++) {%>
                                                    <tbody>
                                                        <tr>
                                                            <th><%= i%></th>
                                                            <td><%= (int) (Math.random() * 1000)%></td>
                                                        </tr>
                                                    </tbody>
                                                <%}%>
                                            </table>
                                        <%} catch (Exception ex) {%>

                                        <%}%>
                                        <hr class="my-4">
                                        <table class="table table-sm table-hover" id="res">
                                            <thead class="table-primary">
                                                <tr>
                                                    <th>Período </th>
                                                    <th> Prestação </th>
                                                    <th> Juros </th>
                                                    <th> Amortização </th>
                                                    <th> Saldo Devedor </th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <tr>
                                                    <th>0</th>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td><%= NumberFormat.getCurrencyInstance().format(saldoDevedor)%></td>
                                                </tr>
                                                    <%
                                                        for (int i = 1; i <= meses; i++) {
                                                            juros = (meses - i + 1) * (taxaJuros / 100) * amortizacaoConst;
                                                            prestacao = amortizacaoConst + juros;
                                                            saldoDevedor = saldoDevedor - amortizacaoConst;
                                                    %>
                                                <tr>
                                                    <th><%= i%></th>
                                                    <td><%= NumberFormat.getCurrencyInstance().format(prestacao)%></td>
                                                    <td><%= NumberFormat.getCurrencyInstance().format(juros)%></td>
                                                    <td><%= NumberFormat.getCurrencyInstance().format(amortizacaoConst)%></td>
                                                    <td><%= NumberFormat.getCurrencyInstance().format(saldoDevedor)%></td>
                                                </tr>
                                                    <%}%>
                                            </tbody>
                                        </table>
                            <%  
                                    } catch (Exception e) {}
                                }
                            %> 
                        </div>
                    </div>
                </div>
            </div>              
        </div>
    </main>
    <%@include file="/WEB-INF/jspf/footer.jspf"%>
    <script src="libs/jquery.min.js"></script>
    <script src="libs/popper.min.js"></script>
    <script src="libs/bootstrap.min.js"></script>
    <script>
        $('input[type="text"]').on('change', function (e) {
            $(e.target).val($(e.target).val().replace(/[^\d\.]/g, ''));
        });
        $('input[type="text"]').on('keypress', function (e) {
            keys = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.'];
            return keys.indexOf(event.key) > -1;
        });
    </script>
</body>
</html>