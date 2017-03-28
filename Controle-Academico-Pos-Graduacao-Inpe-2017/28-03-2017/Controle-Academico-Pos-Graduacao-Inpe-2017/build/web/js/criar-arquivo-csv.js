





/*function criarArquivoCSV(){
    
    var tabela = document.getElementById("tabela-resultado-do-formulario-de-busca-alunos-com-o-status-conluido-a-partir-do-codigo-do-docente").innerHTML;
    var data = tabela.replace(/\s{2,}/g, '')
               .replace(/<thead>/g, "")
               .replace(/<\/thead>/g, "")
               .replace(/<tbody>/g, "")
               .replace(/<\/tbody>/g, "")
               .replace(/<tr>/g, "")
               .replace(/<\/tr>/g, "\r\n")
               .replace(/<th>/g, "")
               .replace(/<\/th>/g, ";")
               .replace(/<td>/g, "")
               .replace(/<\/td>/g, ";")
               .replace(/\t/g, "")
               .replace(/\n/g, "");
               
    
    var mylink = document.createElement("a");
    mylink.download = "csvname.csv";
    
    //The scape() function encodes a string. This function makes a string portable, so it can be transmitted across
    //any network to any computer that supports ASCII characteres 
    //This function encodes special characters, with the exception of: * @ - _ + .
    //document.write(escape("Need tips? Visit W3Schools!"));
    //Need%20tips%3F%20Visit%20W3Schools%21
    
    mylink.href = "data:text/csv;charset=utf-8,"+encodeURI(data);
    mylink.click();
    alert(data);
}*/