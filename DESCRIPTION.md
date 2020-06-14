# Object Detection Model
## General Idea

Equipping lamp posts with Raspberry Pi Camera to record live images. These live images will be processed through the Object Detection Model and if it detects a fire, the location details of the lamp post will be sent to a server.

## Details

We propose the use of Raspberry Pi Camera Module v2 to capture the image of the surroundings every 10s.
![alt text](https://github.com/[username]/[reponame]/blob/[branch]/image.jpg?raw=true)

The raspberry pi device also consists of the object detection model (written in Python) as well as id and location details that is unique to each lampposts and is hard-coded in the system.

![alt text](https://github.com/[username]/[reponame]/blob/[branch]/image.jpg?raw=true)

The image captured will then be processed via the object detection model in real-time. When the threshold is above 0.8, it will detect that there is a fire going on and send the id and location details to the server, in which the app will access. The server will store these details for up to 10 days, after which it will be deleted.

Potential limitations:
* Obstruction to the camera’s view due to large amounts of smoke, or other factors such as insects. We propose using multiple lamp posts near the scene
* Might be costly to implement
* Some areas might not be covered by the scope of the lamp post. Currently SCDF has started trials with drones to cover more inaccessible areas. Thus we propose the drones would only need to focus on areas where the smart lamp posts are unable to cover.

# Android App
## General Idea

This app builds on the existing MyResponder App.  By retrieving data such as unique ID of lamp posts and location details from the server, the app can then notify CFRs of the location of the incident immediately. Admins can have access to a broader and higher level of information to oversee the situation

## Details

In the scenario when there is a suspected case of a fire, the location and ID of the lamppost will be sent to a server. After that, our application will then receive location details from the server. This will create a notification on the phone to alert the CFR that there is a case near them. By clicking on the notification, they will open the app and accept the case.  The homepage for the CFR in the app would be very simple and clean, so as to improve user experience, minimising confusion for the CFRs.
From the admin’s perspective, SCDF would also receive the same information and images. They will also have access to the overview of all cases in Singapore, which would allow them to gauge the situation and properly allocate  resources such as manpower and vehicles accordingly. Cases on the map will be updated using the geo location details from the smart lamp posts in real time.

