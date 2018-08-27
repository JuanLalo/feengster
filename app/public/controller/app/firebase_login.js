/*
POR: ING. JUAN EDUARDO ROSALES
VERISIÖN: 1.0
CUENTA: feengster@gmail.com
LICENCIA: Spark
FUNCIONES: RealTime Database, Storage, Auth, 
*/


var configFirebase = {
          apiKey: "AIzaSyA6gZ0UAUr9jbmMCGK2MA2bdvhtZZmY-is",
          authDomain: "feengster-app.firebaseapp.com",
          databaseURL: "https://feengster-app.firebaseio.com",
          projectId: "feengster-app",
          storageBucket: "gs://feengster-app.appspot.com/",
          messagingSenderId: "909522745522"
        };
        firebase.initializeApp(configFirebase);

      //login google
      
      
    //   function googleLogin()
    //   {
       
    //   var provider = new firebase.auth.GoogleAuthProvider();
    // //   provider.addScope('https://www.googleapis.com/auth/contacts.readonly');
    //   firebase.auth().useDeviceLanguage();
    //   firebase.auth().signInWithPopup(provider).then(function(result) {
    //     //alert()
    //     // This gives you a Google Access Token. You can use it to access the Google API.
    //     var token = result.credential.accessToken;
    //     sessionStorage.setItem('google-token', token)  
    //     // The signed-in user info.
    //     var user = result.user;
    //     sessionStorage.setItem('google-user', user)
    //      console.log(user)
    //     // ...
    //   }).catch(function(error) {
    // //alert(error)

    //     // Handle Errors here.
    //     var errorCode = error.code;
    //     var errorMessage = error.message;
    //     // The email of the user's account used.
    //     var email = error.email;
    //     // The firebase.auth.AuthCredential type that was used.
    //     var credential = error.credential;
    //     console.log(error)
    //     // ...
    //   })
    //   //alert('aqui')
    //   }
      
      
    //   function facebookLogin()
    //   {
    //       //alert()
    //       var provider = new firebase.auth.FacebookAuthProvider();
    //     //   provider.addScope('user_birthday');
    //       firebase.auth().useDeviceLanguage();
    //   //alert()
    //      firebase.auth().signInWithPopup(provider).then(function(result) {
    //     // This gives you a Facebook Access Token. You can use it to access the Facebook API.
    //     var token = result.credential.accessToken;
    //     // The signed-in user info.
    //     var user = result.user;
    //     // ...
    //     //alert()
    //   }).catch(function(error) {
    //       //alert(error)
    //     // Handle Errors here.
    //     var errorCode = error.code;
    //     var errorMessage = error.message;
    //     // The email of the user's account used.
    //     var email = error.email;
    //     // The firebase.auth.AuthCredential type that was used.
    //     var credential = error.credential;
    //     // ...
    //   });
    //   //alert()
    //   }
      
      
    //       firebase.auth().useDeviceLanguage();
    //     //window.recaptchaVerifier = new firebase.auth.RecaptchaVerifier('recaptcha-container');
    //    function iniRecapcha()
    //    {  
    //     setTimeout(function() {
    //       window.recaptchaVerifier = new firebase.auth.RecaptchaVerifier('recaptcha-container', {
    //           'size': 'normal',
    //           'callback': function(response) {
    //               console.log("success", response);
    //           },
    //           'expired-callback': function() {
    //               console.log("expired-callback");
    //           }
    //       });
      
    //       recaptchaVerifier.render().then(function(widgetId) {
    //           window.recaptchaWidgetId = widgetId;
    //       });
    //     },1000)
    //   }
      
    //   var confirmationResult1 = null 
    //   function telefonoLogin()
    //   {
          
    //       firebase.auth().useDeviceLanguage();
    //   //var phoneNumber = getPhoneNumberFromUserInput();
    //   var appVerifier = window.recaptchaVerifier;
    //   firebase.auth().signInWithPhoneNumber('+524775805532', appVerifier)
    //       .then(function (confirmationResult) {
    //         // SMS sent. Prompt user to type the code from the message, then sign the
    //         // user in with confirmationResult.confirm(code).
    //         window.confirmationResult = confirmationResult;
    //       }).catch(function (error) {
      
    //           console.log(error)
    //           grecaptcha.reset(window.recaptchaWidgetId);
    //         // Error; SMS not sent
    //         // ...
    //       });
      
    //   }
      
      
    //   function ingresarCodigo(code)
    //   {
    //       //var code = getCodeFromUserInput();
    //       window.confirmationResult.confirm(code).then(function (result) {
    //     // User signed in successfully.
    //     var user = result.user;
    //    console.log(user)
    //   }).catch(function (error) {
    //   config.log(error)
    //     // User couldn't sign in (bad verification code?)
    //     // ...
    //   });
    //   }
      
    //   function logaut()
    //   {
    //   firebase.auth().signOut().then(function() {
    //     // Sign-out successful.
    //     //alert('successful')
    //   }).catch(function(error) {
    //     // An error happened.
    //     //alert('error al cerrar sesión')
    //   })
    //   }
      
      
    //   function isSession()
    //   {
    //       var user = firebase.auth().currentUser;
      
    //   if (user) {
    //      // //alert('esta en session')
    //     // User is signed in.
    //   } else {
    //       ////alert('no está en session')
    //     // No user is signed in.
    //   }
         
    //   }
      
    //    firebase.auth().onAuthStateChanged(function(user) {
    //     if (user) { 
    //        // //alert('El usuario inicio sesión')
    //       // User is signed in.
    //     } else {
    //       ////alert('El usuario cerró sessión')
    //       // No user is signed in.
    //     }
    //   });
      
    //   function loginCostum(token)
    //   {
    //       firebase.auth().signInWithCustomToken(token).catch(function(error) {
    //     // Handle Errors here.
    //     var errorCode = error.code;
    //     var errorMessage = error.message;
    //     console.log(error)
    //     // ...
    //   });
      //}