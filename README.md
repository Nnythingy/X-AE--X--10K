# X Æ A-10K
## Introduction
#### Hi! We are Team X Æ A-10K, consisting of 4 members who have recently started our programming journey. We will be targeting the following problem:

**INTEGRATING WITH A SMART ENVIRONMENT**

* What’s the problem?

Currently, the MyResponder App uses the “Call 995” function on the app to get through to SCDF Ops Centre, and SCDF would then dispatch emergency services and contact CFRs if necessary. However, depending on this function solely might lead to a waste of precious resources, if the user uses this function for non-emergency or false alarm calls. In 2018, there were 17,954 cases of non-emergency and false alarm calls, averaging to about 50 per day. In addition, by going through the SCDF Ops Centre, it might take some time before emergency services/CFRs are deployed to the incident site.


* How can technology help?

We can make use of IBM’s features, coupled with sensors and IoTs embedded in the environment, to provide useful info when an accident/fire happens such as live images and location details. Leveraging on the current implementation of MyResponder, we can ensure that community first responders (CFRs) can respond to incidents in a more efficient and timely manner. Sensors can also be used to detect any onset of fire before the fire becomes larger.


* Idea that we proposed:

Equipping lamp posts with Raspberry Pi Camera to record live images. These live images will be processed through the Object Detection Model and if it detects a fire, the location details of the lamp post will be sent to a server.
By retrieving data such as location details from the server, the app can then notify CFRs of the location of incident immediately 


## Pitch Video
<a href="http://www.youtube.com/watch?feature=player_embedded&v=YOUTUBE_VIDEO_ID_HERE
" target="_blank"><img src="http://img.youtube.com/vi/YOUTUBE_VIDEO_ID_HERE/0.jpg" 
alt="IMAGE ALT TEXT HERE" width="240" height="180" border="10" /></a>

## Architecture of Proposed Solution
![alt text](https://github.com/Nnythingy/X-AE-A-10K/blob/master/images/Proposed%20Workflow.jpg "Architecture")

## Long Description
[More details are available here](https://github.com/Nnythingy/X-AE-A-10K/blob/master/DESCRIPTION.md)

## Getting Started
Follow these instructions to install the required software and run a demo on your local machine for testing purposes
### 1) Object-Detection Model
#### Prerequisites
* Create an Watson Studio instance:
1. Sign up for a free IBM Cloud account or log in.
2. Search for [Watson Studio](https://cloud.ibm.com/catalog/services/watson-studio) in Catalog
3. Click **Create**.

* Create a new Project:
1. Open Watson Studio under the resource list in IBM Cloud
2. Click **Create a new project** followed by **Create an empty project** 
3. Enter details for **Project Name**
4. Click **Create**.
5. Open the project
6. Under the **Settings** tab
7. Click **Add Service** in the Associated Services section, and add a Watson Service
8. Select the Watson Visual Recognition Service and create a new service instance

#### Training the model
1. Access the list of [Watson Services](https://dataplatform.cloud.ibm.com/data/services?target=watson&context=wdp) and open your visual recognition tool
2. Click Create Model under Classify Images
3. Click Browse and upload .jpeg, .png, or .zip files for training purposes (refer to [images](https://github.com/Nnythingy/X-AE-A-10K/tree/master/images) for sample images that we used)
4. Classify images under different classes
5. Ensure that you have at least 2 classes (including “negative”) with at least 10 images in each class. More images uploaded will lead to a better and more accurate model.
6. Click **Train Model** and wait for the model to be successfully trained

#### Testing the model
1. Go back to the main page of your visual recognition tool. You should see a new custom model that you have just created
2. Click **Test**
3. Under the test tab, you can upload any image to ensure that the visual recognition model is trained correctly

#### Implementing the model
* Use the code snippets below to classify images against your model.

pip
```python
pip install --upgrade "watson-developer-cloud>=2.4.1"
```

Authentication
```python
from watson_developer_cloud import VisualRecognitionV3

visual_recognition = VisualRecognitionV3(
    version='{version}',
    iam_apikey='{apikey}'
)
```

Classify an image + Prepare ID of Lamp post/Location Details to be sent to server if needed
```python
import json, os, requests
from watson_developer_cloud import VisualRecognitionV3
from glob import iglob

visual_recognition = VisualRecognitionV3(
    '2018-03-19',
    iam_apikey='{iam_api_key}')

# Iterating through image directory of camera
rootdir_glob = 'C:/Users/test/Desktop/test/**/*' 
# This will return absolute paths
file_list = [f for f in iglob('**/*', recursive=True) if os.path.isfile(f)]

for f in file_list:
    with f as images_file:
        classes = visual_recognition.classify(
            images_file,
            threshold='0.8',
            classifier_ids='DefaultCustomModel_1850765552').get_result()
        if (classes == 'fire'):
	# Send geolocation data to server 
            
		base_url="www.server.com"
		final_url="/{0}/friendly/{1}/url".format(base_url,any_value_here)

		payload = {'id': 001, 'geo_lat': 1.36251, 'geo_long': 103.74579}
		response = requests.post(final_url, data=payload)

		print(response.text) #TEXT/HTML
		print(response.status_code, response.reason) #HTTP
```
### 2) Using the Android App
#### Prerequisites
* Installing the apk file:
1. Download the [apk](https://github.com/Nnythingy/X-AE-A-10K/blob/master/app-release.apk) on the emulator or android phone
2. Install the apk
3. Open the app called scdf_ibm_call_for_code
* Logging into the accounts for testing
1. Admin test account ( username: admin | password: 1234 )
2. CFR test account ( username: cfr1 | password: 1234 )
3. Any other combination will result in wrong password

#### Using the admin account
![alt text](https://github.com/Nnythingy/X-AE-A-10K/blob/master/images/admin_home.jpg "Admin Home Page")
* AppBar
1. The icons on the AppBar are meant to imitate the similar functions as on the actual MyResponder App
* Body
1. Contains high level information. Can be edited to suit the requirements of the First Responder / Operation Control Center
2. Current Cases contain a button which can perform more functions. Eg: link to a new page/ look at more statistics (other buttons can have similar functions)
3. Box that holds a miniature map view of Singapore. A bigger interactive map can be accessed by clicking on the blue border or accessing the bottom left corner on the screen and choosing *Location OverView*
* Location OverView
![alt text](https://github.com/Nnythingy/X-AE-A-10K/blob/master/images/map_page.jpg "Live Map")
1. Interactive Map view can be accessed here.
2. Data to populate the points on the map will come from the location details of lamp post which has detected a fire
3. *Locations* button will lead to detailed list of current locations with SOS cases
![alt text](https://github.com/Nnythingy/X-AE-A-10K/blob/master/images/sos_locations.jpg "Live cases location" )
* SOS Locations
1. This contains a list of current locations with SOS cases.
2. Click on the first location to view the 3 different street camera views from the proposed smart lamp posts on the location.
![alt text](https://github.com/Nnythingy/X-AE-A-10K/blob/master/images/Street_view.jpg "Live Video Feed")
* LampPost Camera Near Locations
1. Live video feed from smart Lamp Posts to view up-to-date information on current location. 

#### Using the CFR account
![alt text](https://github.com/Nnythingy/X-AE-A-10K/blob/master/images/cfr_home.jpg "CFR Home Page")
* AppBar
1. The icons on the AppBar are meant to imitate the similar functions as on the actual MyResponder App
* Body
1. Contains different services for CFR to use
2. E-Services has an interactable button which will be similar to that in MyResponder App
3. Closest SOS case will include the location data for the closest case for CFR to help. There will be a notification alert to alert the CFR to open the app to accept the request. By clicking the button *Accept Request*, there will be *Yes* or *Cancel*
![alt text](https://github.com/Nnythingy/X-AE-A-10K/blob/master/images/accepting_request.jpg "accepting the request")
4. Clicking *Yes* will copy the location information of the nearest case into the phone’s clipboard. Then the app will open Google Maps from the phone. The CFR would then only need to paste the location to search how to get there.
5. New Sign up has an interactable button which will allow a new user to Sign up
6. More features deemed necessary can be added for the CFR
7. There is a speed dial icon at the bottom of the screen to speed dial *995*

## Built With
* IBM Watson Studio/IBM Watson Visual Recognition Service – Tool used in the Object Detection Model
* Flutter – Creation of the mobile application

