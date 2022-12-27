# Galaxy-Breakout

BreakOut game created using Haxe Programming language with the library OpenFL (Flash Like API) and Starling Framework to leverage GPU acceleration

![image](https://user-images.githubusercontent.com/36489857/209717840-f0e8d293-ada4-49ef-b298-5f7ef8a2574e.png)

![image](https://user-images.githubusercontent.com/36489857/209717948-6929afe2-7829-466c-8d1c-4bcbcf2f6680.png)

<h2>Install</h2>

1 ) Install Haxe from :  https://haxe.org/

2 ) Using Terminal/CMD install the following libraries

  - Haxelib install lime
  - Haxelib install openfl
  - Haxelib install starling
  
3 ) To Start the app use

  - Neko : Haxelib run openfl test neko
  - HTML : Haxelib run openfl test html5

4 ) The Level layout can be set by defining an array with 0 = empty space and 1 = a block

[0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1,0,0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0]


Changes can be done a the file LevelGenerator.hx you can play with the array inside the function GenerateLevel2
  - Note : make sure to not change the array size.

5 ) Next Step for next update:

  - Dislay Score
  - Add more scenes
  - Add Level Editor
  - Add More Type of blocks
  - Random Reward or Penalty drops affected by touching the game Paddle or by game ball touch
  - Sounds
  

