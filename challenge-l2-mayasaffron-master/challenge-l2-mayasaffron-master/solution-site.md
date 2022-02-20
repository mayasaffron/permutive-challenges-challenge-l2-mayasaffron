2. 
I used the python3 -m https.server command to launch the site in the browser and preview. After opening the port i needed to select the lock icon in order to make the port public as opposed to private and therefore viewable in the browser. 

I chose this method because I am most comfortable with this. 

The first change i made to the html was rectifying the article links. The 'cloud computing' and 'edge computing' article links were not working. After looking at the code, I noticed that the edge computing 'a tag' was 
``` <a src="/articles/edge.html">Edge computing is the future</a> ```
This would work if the file was an image however for links, one must use : ``` <a href> ```

The next thing i noticeed was that the accessibility for visually imparied users will be highly limited due to the contrast between the text and background colours. To solve this issue, I used https://colourcontrast
to measure the contrast between the background colour and text colour and it scored 2.43. 

In order for colour contrast to be deemed accessible, the rating should be 4.5 or above. 
Therefore I updated the colours using https://cooloers.com
and updated colour of the text from ```#888888```` to 
```#112A46 ``` and the background colour from ```#ccc ``` to ```#ACC8E5 ```

I noticed that the there was no style applied to the 'fibonacci' article. 
I was not sure if the Fibonacci article was supposed to have different css to the other articles, because the Fibonacci article (fib.html) sat within a sub folder 'sections', within the folder 'articles'. In attempt to get consitent style across all articles, I removed an additional closing ```</div>``` tag from the index.html file and this did not resolve the issue. 

I then realised that the issue was probabaly a mistake in the css file pathway, I have made this error myself and know how common it is! I resolved the error by adjusting the css file path from ``` "../style/main.css" ``` to ``` "../../style/main.css" ``` so that the path indicates two directories out of the current file instead of just one. This mistake was made because the other two html files sit just one directory away from the root, whereas fib.html is in a subfolder as mentioned above. 

When turning my attention to the resposiveness of the site, I adjusted the css so that the body was 100% as opposed to 50% and the margin to 0, this reduced the side scrolling which would provide a much better user experience. 

I used dev tools to adjust the device, so that I could check how responsive the site was when viewed on smaller devices, I noticed that the column gap size was significantly wider than necessary and the unit of measure was cm as opposed em. I adjusted the unit of measure to em as from previous experience I have found working in 'em' a better user experience than px or cm. 

Equally, I added some padding to the p h1 h2 and h5 elements 