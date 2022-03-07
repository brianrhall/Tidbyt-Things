# Tidbyt Things
[Tidbyt](https://tidbyt.com/) integration with [Things app (Things3)](https://apps.apple.com/us/app/things-3/id904237743)

<span style="color:red">No I have not published the scripts here yet, currently just showing how it works.</span>
 
![Alt](./images/IMG_3199.jpeg "two items")

I am on macOS and use the very popular Things app to help me stay on task through the day. I wanted to put my "Today" todo list on my tidbyt. Unfortunately, Things doesn't have an API for their cloud service, so I went a different route and used AppleScript to grab the data from Things, write to a .star file, and then set up a cron to render and push to the tidbyt. Here is the general way it works...

1. AppleScript
	- pull todo data from Things app
	- overwrite existing things.star file with updated todo list (current limit 3 items)
	- option to write todo list to file
2. things.star
	- renders large app image with crossed circle for 0 items
	- renders small icon top center for 1 and 2 items
	- renders small icon left center for 3 items
	- *option for vertical scroll with 1 item layout*

![Alt](./images/upcoming.mov "upcoming list") <figcaption align="center"><i>Upcoming list with vertical scroll layout</i></figcaption>

3. cron
	- shell script to run AppleScript and pixlet render webp
	- shell script to push webp to tidbyt
	- shell scripts set to run on certain hour intervals and 10 seconds apart

Things is on my tidbyt! The pictures do not do it justice, it looks great! 

# Rendered via localhost
| ![Alt](./images/img1.jpg "today none")
![Alt](./images/img2.jpg "img2")
![Alt](./images/img3.jpg "img3")
![Alt](./images/img4.jpg "img4")
![Alt](./images/img5.jpg "img5")
![Alt](./images/img6.jpg "img6")

# Pushed to Tidbyt
![Alt](./images/IMG_3196.jpeg "zero items")
![Alt](./images/IMG_3197.jpeg "one item")
![Alt](./images/IMG_3198.jpeg "one long item")
![Alt](./images/IMG_3199.jpeg "two items")
![Alt](./images/IMG_3200.jpeg "two long items")
![Alt](./images/IMG_3201.jpeg "three items")