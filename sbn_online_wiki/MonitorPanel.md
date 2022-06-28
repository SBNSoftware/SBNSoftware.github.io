If the metric you want to display on Grafana is already monitored by a script running on evb machines then you only need to add a new panel on Grafana.
-	Login to Grafana as “admin” user (ask to Gennadiy Lukhanin for the password)
-	Go to “Shifter DAQ Status” page
-	Click on “Add Panel” on the top right of the page:


![immagine](https://user-images.githubusercontent.com/97683442/176135913-9adc14ba-2d0a-4325-b1a8-10f65c893ac6.png)

-	Click on “Add an empty panel”

![immagine](https://user-images.githubusercontent.com/97683442/176136223-c6db09c8-6f74-43b4-9764-4251ec995872.png)

-	Modify the title and add a description in “Panel options” on the right
-	Go to select metric and select:
  -	  Icarus
  -   The machine or the component you want to monitor
  -   the partition you want to monitor
  -   the metric you are interested to monitor
-	Click on “Time series” on the the top right part of the page and select the type of visualization you want to use for the monitoring (Graph, Gauge, Table etc)

![immagine](https://user-images.githubusercontent.com/97683442/176136353-2e4a4b4c-942d-4476-b723-a84970614182.png)

-	Scroll down in the right part of the page and change properly the Units

![immagine](https://user-images.githubusercontent.com/97683442/176136441-56537b4d-7dff-4ce9-a74d-993a6cf36ba5.png)

-	Scroll down in the right part to set the threshold, the threshold vale and the color to apply, you can click on “add threshold” to add a new threshold

![immagine](https://user-images.githubusercontent.com/97683442/176136538-78b4804e-e4a8-419d-9688-850f51005bd7.png)

Click on the top right blue button “Apply” and then “Save” to save your changes.
