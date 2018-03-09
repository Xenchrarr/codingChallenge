#  CodingTest

Solution:


The task:
    1. Get a json string
    2. Parse json
    3. Fill gui with data from json
    4. Make it possible to favourite ads
    5. Make favourites persistent

Description, how I solved the problem, from start to end. (info might contradict, but that is because it is how I thought when solving)

1. - I used URLSession to get the json string from the url.
2. - [ http://www.json4swift.com] was used to generate all of the classes for the json parsing
    I am keeping the objects in memory as long as the app is running, but the images are swapped out as the user scrolls.

3. - Fill gui

Here it was more to the task. It needs to give a good user experience. Every ad has a picture that needs to be downloaded. I decided to do the download of the picture when it is on the screen. When the cellForRowAt configures a cell, the download will start. [https://stackoverflow.com/questions/24231680/loading-downloading-image-from-url-on-swift ]    led me to an extension that makes this really simple.

The app will automatically insert more cells as the user is scrolling. When willDisplayCell is called on the last cell, it will insert more of the items that are downloaded, and will download the images as the cells are created. I got the basic idea from [https://github.com/Abizern/PartialTable]


4. - favourite ads

From the image in the pdf, I saw that the ads had a heart. So I downloaded two images of hearts. One white and one red. Made the white transparent. Added a button to the cell, and used the white heart as image. The is that the user click a heart to add it to favourites.

I created a favourites object that is to be part of AdSource (table data source file). The FavouriteItems object has two arrays, one with the items, (which is called items (because of the json files were created that way and I did not bother to change the name so it is not plural)) and one with the keys (just to be able to check if an item is a member of the favourites)

When a heart is clicked, it will either add, or remove depending on the state of the heart (button).

When the cells are created now, it will check if the item is a part of the favourites, and change the heart image. Which means it has to call isFavourite for all of the items. That is the reason for the itemKeys array.

isFavourite variable was added to item to make it easier to check if it a favourite.

I keep the downloaded and favourited ads separat. So when the switch is clicked, it swaps out the data set.


5. - persistency
I went with NSCoder since it seemed the easiest to implement. I added the required methods to FavouriteItems, price and Items to save and load the minimum required data.

Now, before the network connection starts, it will load the favourites, so they are available when inserting the data from the JSON. This way the hearts will be red for the favourites that are saved.


I wanted the scrolling to be as fluent as possible, and I am happy with the result.


The favouriting seems a bit hacky, I am do either a or b all over the place. I am also unsure on wheter is a good idea to download images on cellForRowAt. I wonder if this can lead to strange behaviour on slow networks. If scrolled fast I am thinking that an old image is loaded in the wrong cell before the correct one is loaded.

I did not spend much time on the GUI. I am not very good at it nor did I have time to research much. I went with tableview - but a collectionview would probably have been better?

The favourited ads are not removed from the view when clicking on the heart before loading all (clicking the switch), but they are removed from the favourites.
