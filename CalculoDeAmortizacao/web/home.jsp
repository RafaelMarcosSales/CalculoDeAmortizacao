<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="libs/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link rel="stylesheet" href="css/main.css">
        <title>Cáculo de Amortização</title>
    </head>
    <body>
        <%@include file="/WEB-INF/jspf/header.jspf"%>
        <%@include file="/WEB-INF/jspf/menu.jspf"%>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item active" aria-current="page">Home</li>
            </ol>
        </nav>
        
        <main>
            
            <div class="container-fluid">
                <div class="row justify-content-center px-2">
                    <div class="card col-xl-3 my-3 mx-4">
                        <div class="card-body">
                            <h5 class="card-title">Sobre nossa equipe</h5>
                            <p class="lead">Nosso time é composto pelos membros:</p>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">Rafael Marcos Sales</li>
                                <li class="list-group-item">Raul Gomes P. G. da Silva </li>
                                <li class="list-group-item">Renan Fernandes Lorenzetti</li>
                                <li class="list-group-item">Tiago Benitez Pedutti</li>
                            </ul>
                        </div>
                    </div>

                    <div class="card col-xl-3 my-3 mx-4">
                        <div class="card-body">
                            <h5 class="card-title">A aplicação</h5>
                            <p class="lead">O que essa aplicação irá fazer?</p>
                            <hr class="my-2"/>
                            <p class="card-text">Nossa aplicação possui três módulos para calculos de amortização diferentes.
                                Você irá ver nesse sistema o cálculo para <b>amortização americana</b>, <b>amortização constante</b>
                                e a <b>tabela price</b>.
                            </p>
                        </div>
                    </div>
                    
                    <div class="card col-xl-3 my-3 mx-4">
                        <div class="card-body">
                            <h5 class="card-title">Hora de conferir!</h5>
                            <p class="lead">Primeiro passo...</p>
                            <hr class="my-2"/>
                            <p class="card-text">Clique no botão abaixo ou navegue pelo menu acima para começar a explorar o sistema!</p>
                            <a href="amortizacaoAmericana.jsp" class="btn btn-primary">Começar <i class="far fa-play-circle"></i></a>
                        </div>
                    </div>
                    
                </div>
                
            </div>
            
        </main>        
        
        <%@include file="/WEB-INF/jspf/footer.jspf"%>
        
        <script src="libs/jquery.min.js"></script>
        <script src="libs/popper.min.js"></script>
        <script src="libs/bootstrap.min.js"></script>
    </body>
</html>
