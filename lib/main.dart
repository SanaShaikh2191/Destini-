import 'package:destini/story_brain.dart';
import 'package:flutter/material.dart';

void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

//Step 9 - Create a new storyBrain object from the StoryBrain class.

StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/background.png'), fit: BoxFit.cover)),

        // Step 1 - Add background.png to this Container as a background image.
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    // Step 10 - use the storyBrain to get the first story title and display it in this Text Widget.
                    storyBrain.getStory(),
                    style: const TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    //Choice 1 made by user.
                    // Step 18 - Call the nextStory() method from storyBrain and pass the number 1 as the choice made by the user.
                    setState(() {
                      storyBrain.nextStory(1);
                    });
                  },
                  child: Text(
                    //Step 13 - Use the storyBrain to get the text for choice 1.
                    storyBrain.getChoice1(),
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                //Step 26 - Use a Flutter Visibility Widget to wrap this FlatButton.
                //Step 28 - Set the "visible" property of the Visibility Widget to equal the output from the buttonShouldBeVisible() method in the storyBrain.
                child: Visibility(visible: storyBrain.buttonShouldBeVisible(),
                  child: TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: () {
                      //Choice 2 made by user.
                      //Step 19 - Call the nextStory() method from storyBrain and pass the number 2 as the choice made by the user.
                      setState(() {
                        storyBrain.nextStory(2);
                      });
                    },
                    child: Text(
                      //Step 14 - Use the storyBrain to get the text for choice 2.
                      storyBrain.getChoice2(),
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//TODO: Step 24 - Run the app and try to figure out what code you need to add to this file to make the story change when you press on the choice buttons.
