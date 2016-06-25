---
title: EdgeCamera
description: Take pictures with the device camera and automatically crop them.
---
<!---
# license: Licensed to the Apache Software Foundation (ASF) under one
#         or more contributor license agreements.  See the NOTICE file
#         distributed with this work for additional information
#         regarding copyright ownership.  The ASF licenses this file
#         to you under the Apache License, Version 2.0 (the
#         "License"); you may not use this file except in compliance
#         with the License.  You may obtain a copy of the License at
#
#           http://www.apache.org/licenses/LICENSE-2.0
#
#         Unless required by applicable law or agreed to in writing,
#         software distributed under the License is distributed on an
#         "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
#         KIND, either express or implied.  See the License for the
#         specific language governing permissions and limitations
#         under the License.
-->
# phonegap_edge_camera

This plugin defines a global `EdgeCamera` object, which provides an API for taking pictures and cropping them.

## Installation

This requires cordova 5.0+

Currently installable via repo url directly ( unstable )

    cordova plugin add https://github.com/brianmwadime/phonegap_edge_camera.git

---

# API Reference <a name="reference"></a>


* [edgecamera](#module_edgecamera)
    * [.takePicture(successCallback, errorCallback, options)](#module_edgecamera.getPicture)
    * [.onError](#module_edgecamera.onError) : <code>function</code>
    * [.onSuccess](#module_edgecamera.onSuccess) : <code>function</code>
    * [.CameraOptions](#module_edgecamera.CameraOptions) : <code>Object</code>

---

<a name="module_edgecamera"></a>

## edgecamera
<a name="module_edgecamera.takePicture"></a>

### camera.getPicture(successCallback, errorCallback, options)
Takes a photo using the camera, or retrieves a photo from the device's
image gallery.  The image is passed to the success callback as a
Base64-encoded `String`, or as the URI for the image file.

The `camera.takePicture` function opens the device's default camera
application that allows users to snap pictures by default.
Once the user snaps the photo, it is cropped and the camera application closes and the application is restored.

The return value is sent to the [`cameraSuccess`](#module_camera.onSuccess) callback function, in
one of the following formats, depending on the specified
`cameraOptions`:

- A `String` containing the Base64-encoded photo image.

- A `String` representing the image file location on local storage (default).

You can do whatever you want with the encoded image or URI, for
example:

- Render the image in an `<img>` tag, as in the example below

- Save the data locally (`LocalStorage`, [Lawnchair](http://brianleroux.github.com/lawnchair/), etc.)

- Post the data to a remote server

__Supported Platforms__

- iOS

**Kind**: static method of <code>[edgecamera](#module_edgecamera)</code>

| Param | Type | Description |
| --- | --- | --- |
| successCallback | <code>[onSuccess](#module_edgecamera.onSuccess)</code> |  |
| errorCallback | <code>[onError](#module_edgecamera.onError)</code> |  |
| options | <code>[CameraOptions](#module_edgecamera.CameraOptions)</code> | CameraOptions |

**Example**
```js
EdgeCamera.takePicture(cameraSuccess, cameraError, cameraOptions);
```
