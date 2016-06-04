var EdgeCamera = {
    takePicture: function(success, failure){
        cordova.exec(success, failure, "EdgeCamera", "takePicture", []);
    }
};
module.exports = EdgeCamera;
