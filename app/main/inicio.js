$(document).ready(function () {


})


function loadHeader() {

  request =
    {
      table: 'KNA816HOMRNRI1FP1P8QNRKBNYLSWWJPNW72EJ89DTNLODLKPKHD5E9SX0XD',
      key: getStorage('key', false),
      token: getStorage('token', false),

      data: 
            {
              query: ''
            }
    }

  smartRequestGet(data, fillApps)

}


function fillApps(code, data) {

}