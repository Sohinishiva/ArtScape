import 'package:flutter/material.dart';

class PlaylistPage extends StatefulWidget {
  @override
  _PlaylistPageState createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  int _currentSongIndex = 0;
  List<String> _songs = [
    "Bohemian Rhapsody",
    "Hotel California",
    "Stairway to Heaven",
    "Pause",
    "Imagine",
    "Smells Like Teen Spirit",
    "Next",
    "Billie Jean",
    "Sweet Child o' Mine",
    "Like a Rolling Stone",
    "Previous",
    "Another Brick in the Wall, Part 2",
    "Hey Jude",
    "Comfortably Numb",
    "Wonderwall",
  ];

  void _playPause() {
    // Add code to play/pause current song
    print("Play/Pause button pressed");
  }

  void _nextSong() {
    setState(() {
      _currentSongIndex = (_currentSongIndex + 1) % _songs.length;
    });
  }

  void _previousSong() {
    setState(() {
      _currentSongIndex = (_currentSongIndex - 1) % _songs.length;
      if (_currentSongIndex < 0) {
        _currentSongIndex = _songs.length - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            _songs[_currentSongIndex],
            style: TextStyle(fontSize: 24.0),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.skip_previous),
                onPressed: _previousSong,
              ),
              IconButton(
                icon: Icon(Icons.play_arrow),
                onPressed: _playPause,
              ),
              IconButton(
                icon: Icon(Icons.skip_next),
                onPressed: _nextSong,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
