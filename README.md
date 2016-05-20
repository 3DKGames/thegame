# thegame
The core development environment for the game

1) I've started the intial build using Animate CC and FlashDevelop for the code(project file included)
2) I've set up a basic working directory
    2a) Bin to publish to
    2b) Libs to publish SWC files to
    2c) Src where the AS3 source files will live
    
3) I have setup some test files to help talking you through working with SWC files
    3a) In the Core.fla under actionscript setting there is a Tab called Library paths, you can add SWC's there which gives the main FLA access to all the assets of the SWC
    3b) If you open the FlashDevevlop project file (The Game.as3proj) you can see that you can do the same thing but the trick is you have to find the SWC you want to add then "Add to Library" that way while you are coding you also have access to all the assets and code of the SWC.
    3c) As long as there are no bugs in the SWC you can add whatever you like to it without affecting the Core SWF unless you add an asset from the SWC (See Core.as where I did a quick demo on adding a DemoGang)
    3d) All the assets from the SWC are included in the publish file so you have access to everything