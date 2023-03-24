const imgDiv = document.querySelector('.profile');
const img = document.querySelector('#photo');
const file = document.querySelector('#file');
const uploadBtn = document.querySelector('#uploadBtn');


file.addEventListener('change',function(){
    const choosedFile = this.files[0];
    if(choosedFile) {
        const reader = new FileReader();
        reader.addEventListener('load',function(){
            img.setAttribute('src',reader.result);
        });
        reader.readAsDataURL(choosedFile);

    }

});



function loadDoc() {
    const xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        document.getElementById("demo").innerHTML =
        this.responseText;
      }
    };
    xhttp.open("GET", "ajax_info.txt");
    xhttp.send();
  }

