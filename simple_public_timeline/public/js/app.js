$(document).ready(function(){
  $("button").click(function(){
    $("#div1").load("/via_js",function(responseTxt,statusTxt,xhr){
      // if(statusTxt=="success") alert("External content loaded successfully!");
      if(statusTxt=="error")
        alert("Error: "+xhr.status+": "+xhr.statusText);
    });
  });
});