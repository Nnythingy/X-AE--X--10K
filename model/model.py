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
		# Send unique id of lamp post and geolocation data to server 
            
			base_url="www.server.com"
			final_url="/{0}/friendly/{1}/url".format(base_url,any_value_here)

			payload = {'id': 001, 'geo_lat': 1.36251, 'geo_long': 103.74579}
			response = requests.post(final_url, data=payload)

			print(response.text) #TEXT/HTML
			print(response.status_code, response.reason) #HTTP
			

