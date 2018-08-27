
$(document).ready(function(){
    user = getStorage('userdata', true);
    $('.content-header').hide()
    reloadImgProfile()
  
   // getProfile(user.id)
   
});



function getProfile(id_user){
    var settings = {
        "async": false,
        "crossDomain": true,
        "url": config.app.core_path + "user/getProfile",
        "method": "POST",
        "headers": {
          "Content-Type": "application/json"
        },
        "processData": false,
        "data": "{\n\t\"key\": \""+ getStorage('key', false) +
            "\",\n\t\"token\": \""+ getStorage('token', false)+
            "\",\n\t\"id_user\": \""+ id_user +"\"\n}"
      }
      
      $.ajax(settings).done(function (response) {
        saveStorage('profileInfo', response.data, true);
        $('.userfullname').html(response.data[0].name + ' '+ response.data[0].surnames)
      })
      .fail(function (data){
        ajaxFail(data);
      })
}