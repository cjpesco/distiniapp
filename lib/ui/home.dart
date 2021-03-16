import 'package:distiniapp/model/story_brain.dart';
import 'package:flutter/material.dart';

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  StoryBrain storyBrain = StoryBrain();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('img/background.png'),
            fit: BoxFit.cover,
          ),
        ),
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
                    storyBrain.getStory(),
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: _buildChoiceButton(
                    buttonColor: Colors.redAccent,
                    userChoice: 1,
                    userChoiceText: storyBrain.getChoice1()),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: _buildChoiceButton(
                      buttonColor: Colors.blueAccent,
                      userChoice: 2,
                      userChoiceText: storyBrain.getChoice2()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton _buildChoiceButton(
      {Color buttonColor, int userChoice, String userChoiceText}) {
    return ElevatedButton(
      onPressed: () => _nextStory(userChoice),
      style: ElevatedButton.styleFrom(
        primary: buttonColor,
      ),
      child: Text(
        userChoiceText,
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
    );
  }

  void _nextStory(int userChoice) {
    setState(() {
      storyBrain.nextStory(userChoice);
    });
  }
}
