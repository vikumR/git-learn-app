class Texts {
//model class

  int _id;
  String _header;
  String _textInside;
  String _note;
  double _rating;

  //default contructor
  Texts(this._id, this._header, this._textInside);

  //named contructor
  Texts.dbTexts(this._id, this._note, this._rating);

  //return a map from a Texts object
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['note'] = _note;
    map['rating'] = _rating;

    return map;
  }

  //return a Texts object from a map
  Texts.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._note = map['note'];
    this._rating = map['rating'];
  }

  int get id => _id;

  String get header => _header;

  String get textInside => _textInside;

  String get note => _note;

  double get rating => _rating;
}

//data to render toc and contents (with custom ids)
List<Texts> allTexts = [
  Texts(01, 'CREATE A NEW REPOSITORY',
      'CREATE A NEW DIRECTORY, OPEN IT AND PERFORM A\n\n git init\n\n TO CREATE A NEW GIT REPOSITORY.'),
  Texts(02, 'CHECKOUT A REPOSITORY',
      'CREATE A WORKING COPY OF A LOCAL REPOSITORY BY RUNNING THE COMMAND\n\n git clone /path/to/repository\n\n WHEN USING A REMOTE SERVER, YOUR COMMAND WILL BE\n\n git clone username@host:/path/to/repository'),
  Texts(03, 'WORKFLOW',
      'YOUR LOCAL REPOSITORY CONSISTS OF THREE TREES MAINTAINED BY GIT. THE FIRST ONE IS YOUR\n\nworking directory\n\nWHICH HOLDS THE ACTUAL FILES. THE SECOND ONE IS THE\n\nindex\n\nWHICH ACTS AS A STAGING AREA AND FINALLY THE\n\nhead\n\nWHICH POINTS TO THE LAST COMMIT YOU HAVE MADE.'),
  Texts(04, 'ADD & COMMIT',
      'YOU CAN PROPOSE CHANGES (ADD IT TO THE INDEX) USING\n\ngit add <filename>\n\ngit add *\n\nTHIS IS THE FIRST STEP IN THE BASIC GIT WORKFLOW. TO ACTUALLY COMMIT THESE CHANGES USE\n\ngit commit -m "Commit message"\n\nNOW THE FILE IS COMMITTED TO THE HEAD, BUT NOT IN YOUR REMOTE REPOSITORY YET.'),
  Texts(05, 'PUSHING CHANGES',
      'YOUR CHANGES ARE NOW IN THE head OF YOUR LOCAL WORKING COPY. TO SEND THOSE CHANGES TO YOUR REMOTE REPOSITORY, EXECUTE\n\ngit push origin master\n\nCHANGE master TO WHATEVER BRANCH YOU WANT TO PUSH YOUR CHANGES TO.\n\nIF YOU HAVE NOT CLONED AN EXISTING REPOSITORY AND WANT TO CONNECT YOUR REPOSITORY TO A REMOTE SERVER, YOU NEED TO ADD IT WITH\n\ngit remote add origin <server>\n\nNOW YOU ARE ABLE TO PUSH YOUR CHANGES TO THE SELECTED REMOTE SERVER.'),
  Texts(06, 'BRANCHING',
      'BRANCHES ARE USED TO DEVELOP FEATURES ISOLATED FROM EACH OTHER. THE master BRANCH IS THE DEFAULT BRANCH WHEN YOU CREATE A REPOSITORY. USE OTHER BRANCHES FOR DEVELOPMENT AND MERGE THEM BACK TO THE MASTER BRANCH UPON COMPLETION.\n\nCREATE A NEW BRANCH NAMED "FEATURE_X" AND SWITCH TO IT USING\n\ngit checkout -b feature_x\n\nSWITCH BACK TO MASTER\n\ngit checkout master\n\nAND DELETE THE BRANCH AGAIN\n\ngit branch -d feature_x\n\nA BRANCH IS NOT AVAILABLE TO OTHERS UNLESS YOU PUSH THE BRANCH TO YOUR REMOTE REPOSITORY\n\ngit push origin <branch>'),
  Texts(07, 'UPDATE & MERGE',
      'TO UPDATE YOUR LOCAL REPOSITORY TO THE NEWEST COMMIT, EXECUTE\n\ngit pull\n\nIN YOUR WORKING DIRECTORY TO fetch AND merge REMOTE CHANGES.TO MERGE ANOTHER BRANCH INTO YOUR ACTIVE BRANCH (E.G. MASTER), USE\n\ngit merge <branch>\n\nIN BOTH CASES GIT TRIES TO AUTO-MERGE CHANGES. UNFORTUNATELY, THIS IS NOT ALWAYS POSSIBLE AND RESULTS IN conflicts. YOU ARE RESPONSIBLE TO MERGE THOSE conflicts MANUALLY BY EDITING THE FILES SHOWN BY GIT. AFTER CHANGING, YOU NEED TO MARK THEM AS MERGED WITH\n\ngit add <filename>\n\nBEFORE MERGING CHANGES, YOU CAN ALSO PREVIEW THEM BY USING\n\ngit diff <source_branch> <target_branch>'),
  Texts(08, 'TAGGING',
      'IT IS RECOMMENDED TO CREATE TAGS FOR SOFTWARE RELEASES. THIS IS A KNOWN CONCEPT, WHICH ALSO EXISTS IN SVN. YOU CAN CREATE A NEW TAG NAMED 1.0.0 BY EXECUTING\n\ngit tag 1.0.0 1b2e1d63ff\n\nTHE 1b2e1d63ff STANDS FOR THE FIRST 10 CHARACTERS OF THE COMMIT ID YOU WANT TO REFERENCE WITH YOUR TAG. YOU CAN GET THE COMMIT ID BY LOOKING AT THE log'),
  Texts(09, 'LOG',
      'IN ITS SIMPLEST FORM, YOU CAN STUDY REPOSITORY HISTORY USING.. git log\n\nYOU CAN ADD A LOT OF PARAMETERS TO MAKE THE LOG LOOK LIKE WHAT YOU WANT. TO SEE ONLY THE COMMITS OF A CERTAIN AUTHOR:\n\ngit log --author=bob\n\nTO SEE A VERY COMPRESSED LOG WHERE EACH COMMIT IS ONE LINE:\n\ngit log --pretty=oneline\n\nOR MAYBE YOU WANT TO SEE AN ASCII ART TREE OF ALL THE BRANCHES, DECORATED WITH THE NAMES OF TAGS AND BRANCHES:\n\ngit log --graph --oneline --decorate –all\n\nSEE ONLY WHICH FILES HAVE CHANGED:\n\ngit log --name-status'),
  Texts(10, 'REPLACE LOCAL CHANGES',
      'IN CASE YOU DID SOMETHING WRONG, WHICH FOR SURE NEVER HAPPENS, YOU CAN REPLACE LOCAL CHANGES USING THE COMMAND\n\ngit checkout -- <filename>\n\nTHIS REPLACES THE CHANGES IN YOUR WORKING TREE WITH THE LAST CONTENT IN HEAD. CHANGES ALREADY ADDED TO THE INDEX, AS WELL AS NEW FILES, WILL BE KEPT.\n\nIF YOU INSTEAD WANT TO DROP ALL YOUR LOCAL CHANGES AND COMMITS, FETCH THE LATEST HISTORY FROM THE SERVER AND POINT YOUR LOCAL MASTER BRANCH AT IT LIKE THIS.\n\ngit fetch origin\n\ngit reset --hard origin/master'),
  Texts(11, 'USEFUL HINTS',
      'BUILT-IN GIT GUI\n\ngitk\n\nUSE COLORFUL GIT OUTPUT\n\ngit config color.ui true\n\nSHOW LOG ON JUST ONE LINE PER COMMIT\n\ngit config format.pretty oneline\n\nUSE INTERACTIVE ADDING\n\ngit add -i'),
];
