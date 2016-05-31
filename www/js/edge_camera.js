var EdgeCamera = {
getPicture: function(success, failure){
    cordova.exec(success, failure, "EdgeCamera", "openCamera", []);
}
};
module.exports = EdgeCamera;