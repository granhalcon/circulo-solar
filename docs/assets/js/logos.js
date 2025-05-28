$(document).ready(function () {
  //$('#nav').click(function() {
  //    $(this).toggleClass('rotate');
  //    $('aside').hide();
  //    $('nav').toggle('slow');
  //    if($('#indice').hasClass('flip')) {
  //        $('#indice').toggleClass('flip');
  //    }
  //});
  //$('#nav li a').click(function() {
  //    $('nav').toggle('slow');
  //});
  //$('#indice').click(function() {
  //    $(this).toggleClass('flip');
  //    $('nav').hide();
  //    $('aside').toggle('slow');
  //    if($('#nav').hasClass('rotate')) {
  //        $('#nav').toggleClass('rotate');
  //    }
  //});
  //$('#indice li a').click(function() {
  //    $('aside').toggle('slow');
  //});

  //TOC

  $(":header").each(function () {
    var texto = $(this).text();
    var htmlElement = $(this).prop("outerHTML");
    var classH = "";
    //    console.log(htmlElement);

    function test(str) {
      switch (true) {
        case /h1/.test(str):
          classH = "classH1";
          break;
        case /h2/.test(str):
          classH = "classH2";
          break;
        case /h3/.test(str):
          classH = "classH3";
          break;
        case /h4/.test(str):
          classH = "classH4";
          break;
        case /h5/.test(str):
          classH = "classH5";
          break;
        case /h6/.test(str):
          classH = "classH6";
          break;
        default:
          break;
      }
    }

    test(htmlElement);

    var idH = texto
      .toLowerCase()
      .replaceAll(" ", "-")
      .replaceAll("á", "a")
      .replaceAll("é", "e")
      .replaceAll("í", "i")
      .replaceAll("ó", "o")
      .replaceAll("ú", "u")
      .replaceAll("ñ", "n");
    $(this).attr("id", idH);
    if (texto != "Índice:" && texto != "Contacto:") {
      $("aside ul").append(
        '<li class="' +
          classH +
          '"><a href="#' +
          idH +
          '" class="aAside">' +
          texto +
          "</a></li>"
      );
    }
    //$('a.aAside').click(function(){
    //    $('aside').hide();
    //});
  });
    $(function() {
        $('aside').on('click', function() {
            console.log('aside clicked');
            $(this).toggleClass('expanded');
        });
    });
});
