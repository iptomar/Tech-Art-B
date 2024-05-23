<?php
session_start();

if(!isset($_SESSION["lang"])){
  $_SESSION["lang"] = "pt";
}

$_SESSION["basename"] = $_SERVER['PHP_SELF'];

if(strlen($_SERVER["QUERY_STRING"])>0){
  $_SESSION["basename"] = $_SESSION["basename"]."?".$_SERVER["QUERY_STRING"];
}
function template_header($title){

//::::::CABECALHO PRINCIPAL::::::
  $ptWeight= $_SESSION["lang"] == "pt" ? "bold" : "normal";
  $enWeight= $_SESSION["lang"] == "en" ? "bold" :  "normal";

  $change_lang =  function ($key) {
    return  change_lang($key);
  };


    echo <<<EOT
                
                <head>
                <!-- Basic -->
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <!-- Mobile Metas -->
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <!-- Site Metas -->
                <meta name="keywords" content="" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <link rel="shortcut icon" href="images/favicon.png" type="">
                <title>$title</title>
                <!-- bootstrap core css -->
                <link rel="stylesheet" type="text/css" href="./assets/css/bootstrap.css" />
                <!-- font awesome style -->
                <link href="./assets/css/font-awesome.min.css" rel="stylesheet" />
                <!-- Custom styles for this template -->
                <link href="./assets/css/style.css" rel="stylesheet" />
                <!-- responsive style -->
                <link href="./assets/css/responsive.css" rel="stylesheet" />
                <link rel="stylesheet" href="./assets/css/owl.carousel.min.css">
                <link href="https://fonts.googleapis.com/css?family=Mansalva|Roboto&display=swap" rel="stylesheet">

                <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300&display=swap" rel="stylesheet">
                <link rel="stylesheet" href="./assets/fonts/icomoon/style.css">

                <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700&display=swap" rel="stylesheet">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" 
                integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />

                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link href="https://fonts.googleapis.com/css2?family=Merriweather+Sans:wght@700&display=swap" rel="stylesheet">
          
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link href="https://fonts.googleapis.com/css2?family=Merriweather+Sans:wght@700&family=PT+Sans&display=swap" rel="stylesheet">

                <link rel="stylesheet" type="text/css" href="./assets/css/font-awesome.css">
                <link rel="stylesheet" href="./assets/css/owl-carousel.css">

                <link rel="stylesheet" href="./assets/css/lightbox.css">

                <link rel="stylesheet" href="https://code.jquery.com/jquery-3.4.1.min.js">

                <link rel="stylesheet" href="./assets/css/open-iconic-bootstrap.min.css">
                <link rel="stylesheet" href="./assets/css/animate.css">
                <link rel="stylesheet" href="./assets/css/owl.carousel.min.css">
                <link rel="stylesheet" href="./assets/css/owl.theme.default.min.css">
                <link rel="stylesheet" href="./assets/css/magnific-popup.css">
                <link rel="stylesheet" href="./assets/css/aos.css">
                <link rel="stylesheet" href="./assets/css/ionicons.min.css">
                <link rel="stylesheet" href="./assets/css/flaticon.css">
                <link rel="stylesheet" href="./assets/css/icomoon.css">


                <link rel="stylesheet" href="./assets/vendors/fontawesome/css/all.min.css">
                <link rel="stylesheet" href="./assets/vendors/themify-icons/themify-icons.css">
                <link rel="stylesheet" href="./assets/vendors/nice-select/nice-select.css">
                <link rel="stylesheet" href="./assets/vendors/owl-carousel/owl.theme.default.min.css">
                <link rel="stylesheet" href="./assets/vendors/owl-carousel/owl.carousel.min.css">

                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
                
                <style type="text/css">
 
                body > .skiptranslate {
                    display: none;
                }
                body {
                    top: 0px !important; 
                    }
                 
                 .goog-logo-link {
                    display:none !important;
                } 
                    
                .goog-te-gadget{
                    color: transparent !important;
                }

                #developmentWarning{
                  position:fixed;
                  top:0;
                  left:0;
                  z-index: 2;
                  opacity: 0.8;
                  max-width: 190px;
                  width:25%
                }
                 
                </style>
                
               
               

            
                </head>
                
                <body>

             
                    <div style="padding-top: 0px;"class="hero_area">
                    <!-- header section strats -->
                    <header style="padding-top: 0px;" class="header_section">
                        <div style="padding-top: 0px;" class="container">

                          <!--Language nav bar-->
                          <div style="padding-bottom: 0px;" class="hero_area">
                            <!-- header section strats -->
                            <header style="padding-bottom: 0px; z-index:1;" class="header_section2">
                                    <nav class="navbar navbar-expand custom_nav-container lang_nav">  
                                        <!-- <form class="form-inline">
                                                <button class="btn  my-2 my-sm-0 nav_search-btn">
                                                <i style="padding-left: 1125px; padding-top: 19px;" class="fa fa-search" aria-hidden="true"></i>
                                                </button> 
                                            </form> -->
                                        <ul class="navbar-nav">
                                            <li style="margin-top: 40px; overflow:visible;" class="nav-item">
                                              <div>
                                                <a href="javascript:void(0);" class="translationOption" style="font-weight: $ptWeight" data-value="pt" onclick="updateSessionAndRefresh(this)">PT</a>
                                                <a href="javascript:void(0);" class="translationOption" style="font-weight: $enWeight" data-value="en" onclick="updateSessionAndRefresh(this)">EN</a>
                                              </div>
                                            </li>
                                        
                                        </ul>
                                                                
                                    </nav>
                                
                            </header>
                          </div>

                            <!-- Main navbar -->
                            <nav style="padding-top: 0px;" class="navbar navbar-expand-lg custom_nav-container ">
                                
                                <div id="logo" style="max-width:350px; width:85%;">
                                <a class="navbar-brand" href="index.php"><img class="w-100"  src={$change_lang("header-site-logo")} alt="#" /></a> <!--Logo que redireciona para o index.html-->
                                </div>

                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                <span></span>
                                </button>
                                
                                <div style="padding-top: 0px;" class="collapse navbar-collapse" id="navbarSupportedContent">
                                <ul class="navbar-nav">

                                <li class="nav-item dropdown">
                                        <a class="nav-link" id="nav_drop" href="sobre.php" role="button" aria-haspopup="true" aria-expanded="true"> <span class="nav-label">{$change_lang("about-technart-drop-down")}<span class="caret"></span></a>
                                        <div class="dropdown-content">
                                            <a href="missao.php">{$change_lang("mission-and-goals-option")}</a>
                                            <a href="eixos.php">{$change_lang("research-axes-option")}</a>
                                            <a href="estrutura.php">{$change_lang("org-struct-option")}</a>
                                            <a href="financiamento.php">{$change_lang("funding-option")}</a>
                                            <a href="oportunidades.php">{$change_lang("opportunities-option")}</a>
                                    </div>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link" id="nav_drop" href="#" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true"><span class="nav-label">{$change_lang("projects-tab")}<span class="caret"></span></a>
                                        <div class="dropdown-content">
                                          <a href="projetos_em_curso.php">{$change_lang("ongoing-option")}</a>
                                          <a href="projetos_concluidos.php">{$change_lang("finished-option")}</a>
                                        </div>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link" id="nav_drop" href="#" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="true"> <span class="nav-label">{$change_lang("researchers-drop-down")}<span class="caret"></span></a>
                                        <div class="dropdown-content">
                                            <a href="integrados.php">{$change_lang("integrated-option")}</a>
                                            <a href="colaboradores.php">{$change_lang("collaborators-option")}</a>
                                          <!-- <a href="alunos.php">{$change_lang("students-option")}</a> -->
                                            <a href="novasadmissoes.php">{$change_lang("admission-option")}</a>
                                        </div>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="noticias.php">{$change_lang("news-tab")}</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="publicacoes.php">{$change_lang("publ-tab")}</a>
                                    </li>   
                                    <li class="nav-item">
                                      <a class="nav-link" href="../backoffice/index.php">Login</a>
                                    </li>                  
                                </div>
                            </nav>
                        </div>
                    </header>
                    </div>
                    <!-- end header section -->

                    <script>
                    function updateSessionAndRefresh(link) {
                      // Obter o atributo data-value do link clicado
                      var newLanguage = link.getAttribute('data-value');
                  
                      // Utilizar AJAX para atualizar a variável de sessão
                      $.ajax({
                          url: 'session_language.php',
                          method: 'POST',
                          data: { newLanguage: newLanguage },
                          success: function(response) {
                              // Redirecionar para a mesma página para atualizar sem  adicionar ao histórico
                              location.replace(location.href);
                          }
                      });
                    }                  
                    </script>
EOT;
}

function template_footer(){

//variaveis para passar valores de dicionarios

//imagens

//::::::RODAPE PRINCIPAL::::::

$change_lang =  function ($key) {
  return  change_lang($key);
};


    echo <<<EOT
                <!-- footer start -->
                <footer>
                <div class="container">
                    <div class="row">
                        <div class="col-md-4">
                        <div class="logo_footer" >
                        <a target="_blank"href="https://www.ipt.pt/"><img height="100" src="./assets/images/IPT_i_1-vertical-branco-img-para-fundo-escuro.png" alt="#" /></a>
                    </div>
                        <div class="logo_footer" id="logo4">
                        <a href="#"><img class="logo-tech_footer" src={$change_lang("footer-site-logo")} alt="#" /></a>
                        </div>
                        
                    </div>
                        <div class="col-md-8">
                            <div class="row center_footer">
                            <div class="col-md-7 center_footer">
                            <div class="row">
                                <div class="col-md-6 center_footer">
                                    <div class="widget_menu">
                                        <ul>
                                        <li><a style="color: white;">{$change_lang("address-txt-1")}</a></li>
                                        <li><a style="color: white;">{$change_lang("address-txt-2")}</a></li>
                                        <li><a style="color: white;">2300-313 Tomar - Portugal</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                                <div class="widget_menu">
                                    <br><ul><li><a style="color: white;">sec.techenart@ipt.pt</a></li></ul>
                                </div>
                                <div class="widget_menu">
                                    <br><ul><li><a style="color: white;"><strong>{$change_lang("follow-us-txt")}</strong></a></li></ul>
                                </div>
                                <div class="widget_menu">
                                    <span><a target="_blank"href="https://www.facebook.com/Techn.Art.IPT/"><img src="../tecnart/assets/icons/facebook.svg" alt="facebook" style="width: 30px; height: 30px;"/></i>&nbsp</a></span>
                                    <span><a target="_blank" style="color: white; font-size: 19px;" href="https://www.youtube.com/channel/UC3w94LwkXczhZ12WYINYKzA"><img src="../tecnart/assets/icons/youtube.svg" alt="youtube" style="width: 40px; height: 40px;"/>


                                    </i></a></span>
                                </div>
                            </div> 

                            <div class="col-md-5 center_footer">
                            <!-- adicionar margin-left ao logotipo do ipt de forma aos logatipos ficaram alinhados-->
                            
                                
                                <div class="logo_footer">
                                    <a target="_blank"href="https://www.cienciavitae.pt/"><img height="80" src="./assets/images/cienciavitaeFundoTrans.png" alt="#" /></a>
                                </div>
                                <div class="logo_footer">
                                    <a target="_blank"href="https://www.fct.pt/"><img height="80" src="./assets/images/2022_FCT_Logo_A_horizontal_branco.png" alt="#" /></a>
                                </div>
                                <div class="information_f">
                                    <p style="color: white; font-size: 13px;">{$change_lang("project-ud-txt")}</p>
                                </div>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
                </footer>
                <!-- footer end -->
                <div class="cpy_">
                <p class="mx-auto" style="font-size: 13px; padding-bottom: 20px;">
                {$change_lang("ipt-copyright-txt")} | {$change_lang("all-rights-reserved-txt")} | 
                <a style="font-size: 13px;" href="copyright.php">{$change_lang("copyright-title")}</a> 
                <br></p>
                </div>

                <!-- jQery -->
                <script src="./assets/js/jquery-3.4.1.min.js"></script>
                <!-- popper js -->
                <script src="./assets/js/popper.min.js"></script>
                <!-- bootstrap js -->
                <script src="./assets/js/bootstrap.js"></script>
                <!-- custom js -->
                <script src="./assets/js/custom.js"></script>
                <script src="./assets/js/owl.carousel.min.js"></script>
            <!-- <script src="./assets/js/jquery.min.js"></script> -->
                <script src="./assets/js/jquery-migrate-3.0.1.min.js"></script>
                <script src="./assets/js/popper2.min.js"></script>
                <script src="./assets/js/bootstrap.min.js"></script>
                <script src="./assets/js/jquery.easing.1.3.js"></script>
                <script src="./assets/js/jquery.waypoints.min.js"></script>
                <script src="./assets/js/jquery.stellar.min.js"></script>
                <script src="./assets/js/owl.carousel.min.js"></script>
                <script src="./assets/js/jquery.magnific-popup.min.js"></script>
                <script src="./assets/js/aos.js"></script>
                <script src="./assets/js/jquery.animateNumber.min.js"></script>
                <script src="./assets/js/scrollax.min.js"></script>
                <script src="./assets/js/main.js"></script>
            <!--  <script src="./assets/js/jquery-2.1.0.min.js"></script> -->
                <script src="./assets/js/owl-carousel.js"></script>
                <script src="./assets/js/accordions.js"></script>
                <script src="./assets/js/datepicker.js"></script>
                <script src="./assets/js/scrollreveal.min.js"></script>
                <script src="./assets/js/waypoints.min.js"></script>
                <script src="./assets/js/jquery.counterup.min.js"></script>
                <script src="./assets/js/imgfix.min.js"></script> 
                <script src="./assets/js/slick.js"></script> 
                <script src="./assets/js/lightbox.js"></script> 
                <script src="./assets/js/isotope.js"></script> 
                
            <!--  <script src="./assets/vendors/jquery/jquery-3.2.1.min.js"></script> -->
                <script src="./assets/vendors/bootstrap/bootstrap.bundle.min.js"></script>
                <script src="./assets/vendors/skrollr.min.js"></script>
                <script src="./assets/vendors/owl-carousel/owl.carousel.min.js"></script>
                <script src="./assets/vendors/nice-select/jquery.nice-select.min.js"></script>
                <script src="./assets/vendors/jquery.ajaxchimp.min.js"></script>
                <script src="./assets/vendors/mail-script.js"></script>
                <script src="./assets/js/main2.js"></script>


                <script type="text/javascript">

                /*function googleTranslateElementInit() {
                  const lang = getCookie("googtrans");
                  if (lang == "") {
                    setCookie('googtrans', '/en/pt', 1);
                  }
            
                  new google.translate.TranslateElement({
                    autoDisplay: 'true',
                    includedLanguages: 'pt,en',
                    layout: google.translate.TranslateElement.InlineLayout.HORIZONTAL
                  }, 'google_translate_element');
            
                 
                  })

                 lang = document.getElementsById("translation_select").addEventListener("change", function () {
                    imagens(); 
                 }

                  if (lang == "en") {
                    
                    document.getElementById('logo2').className = "show";
                    document.getElementById('logo').className = "hidden"; 
                    document.getElementById('logo4').className = "show";
                    document.getElementById('logo3').className = "hidden"; 
                    } else {
                    
                    document.getElementById('logo').className = "show";
                    document.getElementById('logo2').className = "hidden";
                    document.getElementById('logo3').className = "show";
                    document.getElementById('logo4').className = "hidden";
                    }
                }*/

                /*function getLangSelecionada() {
                    const e = document.getElementById("translation_select");
                    return e.options[e.selectedIndex].value;
                  }


            
                function imagens() {
                  const lang = getLangSelecionada();
                  
                  if (lang == "pt") {
                    //setCookie('googtrans', '/en/pt', 1);
                    document.getElementById('logo2').className = "show";
                    document.getElementById('logo').className = "hidden"; 
                    document.getElementById('logo4').className = "show";
                    document.getElementById('logo3').className = "hidden"; 
                    } else {
                    //setCookie('googtrans', '/en/en', 1);
                    document.getElementById('logo').className = "show";
                    document.getElementById('logo2').className = "hidden";
                    document.getElementById('logo3').className = "show";
                    document.getElementById('logo4').className = "hidden";
                    
                    }
                }

                document.getElementsById("translation_select").addEventListener("change", function () {
                 imagens();
                });
            
                function getCookie(cname) {
                  let name = cname + "=";
                  let decodedCookie = decodeURIComponent(document.cookie);
                  let ca = decodedCookie.split(';');
                  for (let i = 0; i < ca.length; i++) {
                    let c = ca[i];
                    while (c.charAt(0) == ' ') {
                      c = c.substring(1);
                    }
                    if (c.indexOf(name) == 0) {
                      return c.substring(name.length, c.length);
                    }
                  }
                  return "";
                }
            
                function setCookie(key, value, expiry) {
                  var expires = new Date();
                  expires.setTime(expires.getTime() + (expiry * 24 * 60 * 60 * 1000));
                  document.cookie = key + '=' + value + ';expires=' + expires.toUTCString();
                }
            */
            
              </script>

              <!--<script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>-->




EOT;

}
if ($_SESSION["lang"] == "en"){
  include 'models/dicionario_en.php';
} elseif($_SESSION["lang"] == "pt"){
  include 'models/dicionario_pt.php';
}

function change_lang($dicElem){
  if ($_SESSION["lang"] == "en"){
    return ret_dic_en()[$dicElem];
  } elseif($_SESSION["lang"] == "pt"){
    return ret_dic_pt()[$dicElem];
  }
}

function alert_redirect($msg, $redirect)
{
  echo "<script>
        alert('$msg');
        window.location.href = '$redirect';
        </script>";
  exit();
}

function show_error($error)
{
  echo '<div class="w-100">
  <div class="mx-auto alert alert-danger alert-dismissible fade show d-flex align-items-center justify-content-center" style="min-height:150px;" role="alert">
    <div>' . $error . '</div>
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
  </div>
</div>';
}
