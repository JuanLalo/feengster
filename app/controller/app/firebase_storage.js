
var storage = firebase.storage();
var storageRef = storage.ref();

function uploadFile(file, n, callback) 
{
    var docsRef = storageRef.child('beauty/servicios/img' + file[0].name)
    docsRef.put(file[0]).then(function (snapshot) {
        getURLimg(snapshot.metadata.fullPath, n, callback)
    })
}


function uploadTicketFile(file) {
    file[0].previewElement.querySelector(".start").setAttribute("disabled", "disabled");
    file[0].previewElement.querySelector(".cancel").setAttribute("disabled", "disabled");
    $(file[0].previewElement.querySelector('.mybar')).width('25%')

    var docsRef = storageRef.child('tickets/docs/' + file[0].name)
    docsRef.put(file[0]).then(function (snapshot) {
        file[0].previewElement.querySelector('.sucess').append(' Se cargó con éxito!')
        $(file[0].previewElement.querySelector('.mybar')).width('100%')
        t_files[t_files.number] = { 
                                    bucket: snapshot.metadata.bucket,
                                    path: snapshot.metadata.fullPath,
                                    name: snapshot.metadata.name,
                                    size: snapshot.metadata.size,
                                    contentType: snapshot.metadata.contentType,
                                    urlPublic: snapshot.task.uploadUrl_
                                } 
       // getURLimg(snapshot.metadata.fullPath)
        t_files.number++
        console.log(snapshot)

    });
}

function getURLimg(path, n, callback)
{
    var docsRef = storageRef.child(path)
    docsRef.getDownloadURL().then(function(url) {
        callback(n, url, false)
    }).catch(function(error) {
        console.log(error)
    });
}

function deleteFile(file) {

    var docsRef = storageRef.child('tickets/docs/' + file[0].name)
    desertRef.delete().then(function () {
        console.log('Se eliminó con éxito')
    }).catch(function (error) {
        console.log('No se eliminó')
    });
}
