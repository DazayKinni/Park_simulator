***

	GMS2 prototyping template
	
	This file is intended to give the developer a set of quick, common tools, objects, and scripts to get
	prototypes up and running quickly for proof-of-concept, which can be built-on
	
	Last updated: 22-12-06 by James Eaton.
	
***

Wishlist

	1.	A script for global variables and universal enums
	2.	A script for setting various dev environment macros
	3.	Debug and Ship profiles;
	4.	An initial loading flow:
		i.		Initialisation setting camera, display, and viewport specfics;
		ii.		Loading room displaying a splash screen which all loading takes place behind;
		iii.	Splash fades in broxcorp logo, then fades it out after 1 second following loading flow complete
		iv.	    A menu room with a button that then takes you quickly to a game room;
	5.	Display setup and device scaling as follows:
		-	Set default camera width and height;
		-	Set default gui width and height;
		-	Set a default view scaling property and calculate view width and height;
		-	Defaults to fixed width and height, but either width or height can be fixed, with the other set to
			scale dynamically according to screen ratio (eg to cater for different mobile screen sizes)
		-	Emulate a portrait 'mobile' view on desktop for dev purposes;
		-	Manually draw app surface so that shader can be applied;
	6.	Basic set of tools:
		-	Bezier curve scripts;
		-	Control inputs for gamepads and keyboards;
		-	Touch and mouse to use native GM functions;
		-	Asynchronous save system;
		-	Dynamo;
		-	Basic audio engine like Vinyl or similar: play, pause, stop, queue, skip track, control ag volume, one shot plays
		-	Texture page manager;
		-	Transforms library (for Skies of Chaos-style menu transforms)
